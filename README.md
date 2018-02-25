# my-helloworld-webapp-dockerfile
This is the docker file for creating the image of a java webapp running in ubuntu

run "docker build . -t my-helloworld-webapp" to create image
run "docker run -p 8080:8080 imagename" to run the webapp
Once the docker container is up and running, try GET http:localhost:8080/helloworld, it will show hello world.
