.SILENT :
.PHONY : all
IMAGE := pouicr/docker-meetup-3

dev:
    $(eval docker_run_flags += -v $(PWD):/usr/share/nginx/html/)

build:
	echo "building image"
	docker build -t $(IMAGE) .

serve:
	echo "serving slides on 80"
	docker run -it --rm $(docker_run_flags) --name=slide -p 80:80 $(IMAGE)
