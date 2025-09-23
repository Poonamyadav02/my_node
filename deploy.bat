@echo off
REM Stop and remove any existing container named hello-node
for /F "tokens=*" %%i in ('docker ps -aq -f "name=hello-node"') do (
    echo Stopping container %%i
    docker stop %%i
    echo Removing container %%i
    docker rm -f %%i
)

REM Run the container in detached mode
docker run -d --name hello-node -p 3001:3000 hello-node:latest
