#!/bin/bash

#Initialize conda to use the virtual environments

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/hone/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/home/hone/anaconda3/etc/profile.d/conda.sh" ]; then
	       	. "/home/hone/anaconda3/etc/profile.d/conda.sh"
	else
		export PATH="/home/hone/anaconda3/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<

#Delete Previously processed image
#rm -rf /srv/http/demo.hone.moe/images/* || true && ##Commented cuz keeping output is useful for clients, might make a destruct timer later
rm -rf Real-ESRGAN/inputs/* || true &&
rm -rf Real-ESRGAN/results/* || true &&
#Activate Conda Environment
conda activate newrealesrgan &&
#Upscale the image using realesrgan_inference.py and move the output to the demo.hone.moe/images/ directory
mv uploads/$filename Real-ESRGAN/inputs/ &&
python Real-ESRGAN/inference_realesrgan.py -n realesr-general-x4v3 -i Real-ESRGAN/inputs -o Real-ESRGAN/results --face_enhance --fp32 >> esr_log.txt &&
mv Real-ESRGAN/results/* /srv/http/demo.hone.moe/images/$filename &&
#Make sure image is accessible from webserver
chmod 755 /srv/http/demo.hone.moe/images/$filename &&
#Show page showing the image
export filename=$filename &&
awk '{while(match($0,"[$]{[^}]*}")) {var=substr($0,RSTART+2,RLENGTH -3);gsub("[$]{"var"}",ENVIRON[var])}}1' < /srv/http/demo.hone.moe/result.html
