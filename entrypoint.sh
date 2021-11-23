#!/bin/sh -l

echo "Hello $1"
ls
echo "Tar the Project"
touch workspace.tar.gz
tar -czf workspace.tar.gz --exclude=workspace.tar.gz .
echo "Check Tar file"
ls
echo "Do a GET"
curl --location --request GET 'https://jsonplaceholder.typicode.com/todos/1'
