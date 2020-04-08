
set -e

tag=1.1
docker build -t brainlife/ui-html . 
docker tag brainlife/ui-html brainlife/ui-html:$tag
docker push brainlife/ui-html:$tag

