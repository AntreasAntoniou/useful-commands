```docker run -p 8888:8888 -it example```

```gcloud compute config-ssh``` # to allow local machine access to the internal IP of the instance

```ssh -L 8080:localhost:8080 dev-machine.us-central1-f.tali-multi-modal``` # open ssh tunnel to let remote machine's ports travel to local

run jupyter lab

```jupyter lab --no-browser --allow-root --port=8888 --ip=0.0.0.0```
