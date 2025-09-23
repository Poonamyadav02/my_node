@echo off
REM Stop and remove any existing container named hello-node
for /F "tokens=*" %%i in ('docker ps -q -f "name=hello-node"') do (
    echo Stopping container %%i
    docker stop %%i
    echo Removing container %%i
    docker rm %%i
)

REM Run the container in background
docker run --name hello-node -p 3000:3000 hello-node:latest
