#!/bin/sh

PWD="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo $PWD
NAME=ddblocal

if [[ $# -ne 1 ]]; then
	echo "start-dynamodb.sh <start|stop>"
	exit 1
fi

ACTION=$1

if [ $ACTION == 'start' ]; then
	if [ ! "$(docker ps -a | grep $NAME)" ]; then
		docker run --name $NAME -dp 8000:8000 -v $PWD/data:/database amazon/dynamodb-local \
		-jar DynamoDBLocal.jar -sharedDb -dbPath /database
	else
		docker start $NAME
	fi
	if ! [ -x "$(command -v dynamodb-admin)" ]; then
		echo "install dynamodb-admin"
		npm -g i dynamodb-admin
	fi
	pkill -f dynamodb-admin
	rm -rf $PWD/nohup.out
	nohup dynamodb-admin &
else
	docker stop $NAME
	pkill -f dynamodb-admin
fi
