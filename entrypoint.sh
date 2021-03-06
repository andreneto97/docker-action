#!/bin/sh -l
apk add curl
apk add bash

# Transform project in tar files
echo "Tar the Project"
touch workspace.tar.gz
tar -czf workspace.tar.gz --exclude=workspace.tar.gz .

# Send the tar file to Dashboard
ls
echo "Do a POST"
curl --location --request POST 'https://jsonplaceholder.typicode.com/posts' \
          --form '=@"./workspace.tar.gz"'

# Make a comment inside the pull request
echo "token: $1"
curl --location --request POST 'https://api.github.com/repos/andreneto97/react-example-action/issues/6/comments' \
          --header 'Authorization: Bearer $1' \
          --header 'Content-Type: application/json' \
          --data-raw '{"body": "Um comentário"}'
