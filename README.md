# k8s primitives 1 workshop

## Overview

We will go through a journey running simple application which serves gifs of cats and dogs.
The application has two components; a web server serving the images and a file puller pulling gifs from somewhere, in this case a git repository.

## Steps

These are the steps we will go through during the workshop

### 01 - Run nginx in docker serving local files

In this step we will run our nginx server locally on docker serving gifs we have locally.

Run:
```
01-docker-nginx/run.sh
```

>Thats nice but how do I get my local files in the instance docker runs ? Enter step 2

### 02 - Run a git sync tool in docker cloning this repo

In this step we will run a separate container that pulls files from a remote git repository.


Run:
```
02-docker-git-sync/run.sh
```

>Nice! so now we have a way to get our files over to the instance docker runs. But I need to combine both containers somehow.. 

### 03 - Run both containers above in a k8s pod

In this step we will show how you can combine multiple containers of single concern into a pod and leverage that capability.

Run:
```
kubectl apply -f 03-pod/
```

> So now we can put both containers in a pod and leverage the pod semantics across shared network and volume. What happens if the pod dies though ? How can i maintain a number of pods always ?

### 04 - Run a fixed number of replics for each of our pods, called deployment

In this step we will create two deployment objects. One for cats and one for dogs. They will each have a fixed number of replicas such that we can ensure a fixed capacity irrespective of individual pods are dying.

Run:
```
kubectl apply -f 04-deployment/
```

> How do I access all the pods you might ask ? Since i have more than 1, i need a way to do service discovery and load balance across all the available ones. 

### 05 - Create a service for each deployment that allows us to do service discovery across any number of pods running 

In this step we will create a Service object for each deployment. This will allow us to group all the pods of a deployment into a service discovery endpoint based on the labels we provided to the pods in the deployment.

Run:
```
kubectl apply -f 05-service/
```

> How do i expose those to the outside world now ?

### 06 - Create an ingress object that makes those pods available to the external world

In this step we will create an Ingress object that exposes the pods under [k8sprimitives1.k8sdemos.test-infra.ouzi.io](k8sprimitives1.k8sdemos.test-infra.ouzi.io)

Run:
```
kubectl apply -f 06-ingress/
```