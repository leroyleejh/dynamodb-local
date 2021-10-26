# DynamoDB Local
Runs a local copy of DynamoDB in Docker.<br />
Sets up a simple GUI using [dynamodb-admin](https://www.npmjs.com/package/dynamodb-admin)

DynamoDB is stored locally into newly created folder `./data` in the file `shared-local-instance.db`

## Pre-Requisities

* [Docker Desktop](https://docs.docker.com/get-docker/)
* [Node Version Manager](https://github.com/nvm-sh/nvm#installing-and-updating)
* Node JS 14 - Install using Node Version Manager
    ```
    nvm install 14
    nvm use 14
    ```

## Usage
### Start / Stop
```
sh start-dynamodb.sh <start|stop>
```
### Endpoints
DynamoDB Endpoint: `localhost:8000` <br />
DynamoDB Shell: [`localhost:8000/shell`](http://localhost:8000/shell) <br />
DynamoDB GUI: [`localhost:8001`](http://localhost:8001)