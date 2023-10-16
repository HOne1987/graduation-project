#!/bin/bash
#Gives the uploaded image its extension and checks if choice submitted from form radio button is rembg or upscale
#
#Fix Image Extension and make filename be known to the next script
idisthis=$(pwgen -n -s -B -A 10 -N 1)
sleeptime=$((2 + $RANDOM % 4))
sleep $sleeptime &&
case $(file -b up) in
	  'JPEG '*)
		  rm -rf filename.txt extension.txt || true && mv uploads/up uploads/$idisthis.jpg && echo "$idisthis.jpg" > filename.txt && echo ".jpg" > extension.txt
		  ;;
	  *)
		  rm -rf filename.txt extension.txt || true && mv uploads/up uploads/$idisthis.png && echo "$idisthis.png" > filename.txt && echo ".png" > extension.txt
		  ;;
esac

#Know which model to use from the radio button on the page. v_choice is the submitted radio button variable (rembg or upscale).
rm -rf model.txt || true;
rg="rembg"
if [ "$v_choice" == "$rg" ]
then
	echo "rembg" > model.txt
else
	echo "scale4x" > model.txt
fi
