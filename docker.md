https://docs.docker.com/engine/reference/commandline/docker/

https://dockerlabs.collabnix.com/docker/cheatsheet/

### Docker build and run


To use:

1. Fill in the .env_template with your own values and rename it to .env
2. Build the image with `docker build -t <container_name> docker/<accelerator-type>/`
3. Run the container with `docker run --gpus all --name <container-instance-name> --shm-size=12gb --env-file .env -v /container/mount/folder/:/machine/folder/to/mount/ -it <container_name>`


🐈 Have fun.

TL;DR
To publish an image to ghcr:

Create a Personal Access Token
Log-in to the container registry
Push an image to ghcr.io/GITHUB_USERNAME/IMAGE_NAME:VERSION
To access GitHub container registry you need to create Personal Access Token (PAT) on GitHub:

“Settings > Developer Settings > Personal access tokens” and create token with permissions related to “packages” (or https://github.com/settings/tokens/new).

After that, you can login export CR_PAT=YOUR_TOKEN ; echo $CR_PAT | docker login ghcr.io -u USERNAME --password-stdin.

Now, you want to tag your local images:

docker tag SOURCE_IMAGE_NAME:VERSION ghcr.io/TARGET_OWNER/TARGET_IMAGE_NAME:VERSION

Push re-tagged imaged to the container registry (ghcr.io):

docker push ghcr.io/OWNER/IMAGE_NAME:VERSION
