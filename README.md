# Task Journal app

An application to manage tasks, this application is built using Django, terraform, docker, helm, nginx

<b>Django</b><br>
this builds the backend of the application, it is responsible for handling the business logic and data storage. It provides RESTful APIs for managing tasks.

<b>helm</b><br>
charts for deploying the application to a kubernetes cluster 
ingress,
journal app,
journal app web front end

<b>frontend</b><br>
simple front end for the application 

<b>infra</b><br>
terraform scripts for the provisioning of the infrastructure for the application 
divided into three parts, dev, staging, production 

<b>journal app</b><br>
journal contains the application configuration files
tasks folder contains files for the application 
test folder contains the test cases for the application 

<b>nginx</b><br>
builds the web server for the application 

<b>.github</b><br>
contains the workflows for the application, including CI/CD pipeline for deploying to kubernetes cluster and running tests with github actions


