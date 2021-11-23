#!/bin/sh -l
apk add curl
apk add bash

echo "Hello $1"
ls
echo "Tar the Project"
touch workspace.tar.gz
tar -czf workspace.tar.gz --exclude=workspace.tar.gz .
echo "Check Tar file"
ls
echo "Do a GET"
curl -s 'https://jsonplaceholder.typicode.com/todos/1'
ls
echo "Do a POST"
curl --location --request POST 'https://jsonplaceholder.typicode.com/posts' \
--form '=@"./workspace.tar.gz"
