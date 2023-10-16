#!/bin/bash
shell2http -host demo1.hone.moe -port=9553 -no-index -form -cgi \
    GET:/ai 'cat /srv/http/demo.hone.moe/Ai.html' \
    POST:/loading 'cat $filepath_uplfile > uploads/up; ./choice.sh; cat /srv/http/demo.hone.moe/loading.html' \
    /output './output.sh'
