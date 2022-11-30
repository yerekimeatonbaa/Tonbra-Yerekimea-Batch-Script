#!/bin/bash
 
#create a bucket using cloud console
#click navigate, cloud storage browser
#click create, name the bucket, keep deafult values and save 

#creating a bucket with name 'blue_marbles36' using cloud shell
gsutil mb gs://blue_marbles36
#if prompted, click Authorize
        echo blue_marbles36

#upload a file through cloud shell
#Click Upload in the cloud shell vm
#select a file for upload from your local machine
#click upload
#issue the 'ls' command on cloud shell to verify the uploaded file
#copy the file into one of the buckets you earlier created
ls
gsutil cp _atoi.c gs://blue_marbles36

#To create  a persistent space in cloud shell
#issue command on the cloud shell to list available regions
#select a region from the list
#verify the selected region with the echo command
gcloud compute regions list
INFRACLASS_REGION=northamerica-northeast2
echo $INFRACLASS_REGION

#To append your enviroment variable to a file 
#create a directory
#create a file  called "config" in the newly created directory
#append the value of the Region environment variable to the config file:
mkdir infraclass
touch infraclass/config
echo INFRACLASS_REGION=$INFRACLASS_REGION >> ~/infraclass/config

#create a second enviroment variable for your project ID
#append the value of your the project ID enviroment variable to the config file
#set the enviroment variable with the source command
#use the echo command to verify that the enviroment variable was set
INFRACLASS_PROJECT_ID=qwiklabs-gcp-02-0559b4ef80c3
echo INFRACLASS_PROJECT_ID=$INFRACLASS_PROJECT_ID >> ~/infraclass/config
source infraclass/config
echo $INFRACLASS_PROJECT_ID

#close and re-open cloud shell to reset it
#issue the echo command to confirm if the enviroment variable still exist after the reset
#this is will not return any output as the enviroment variable will no longer exist
echo $INFRACLASS_PROJECT_ID


#to modify the bash profile and creat persistence, edit the shell profile by opening the nano file
#add the following line to the end of the file 'source infraclass/config'
#save the file
nano .profile
source infraclass/config


#close and then reopn cloud shell to reset it
#use the echo command to verify that the variable has been set
#end the lab
echo $INFRACLASS_PROJECT_ID
