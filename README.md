# Proxsign docker

## Building

`docker build -t proxsign .`

## Running

`./run.sh`

After image is started visit [https://localhost:14972](https://localhos:14972) and accept selfsigned cert.
In the runnign container start *firefox* (`docker exec -i <container name> firefox`). 
