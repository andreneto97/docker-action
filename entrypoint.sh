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
          --form '=@"./workspace.tar.gz"'

echo "token: $2"
curl --location --request POST 'https://api.github.com/repos/andreneto97/react-example-action/issues/6/comments' \
--header 'Authorization: Bearer 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' \
--header 'Content-Type: application/json' \
--data-raw '{"body": "Hello Github"}'
  
