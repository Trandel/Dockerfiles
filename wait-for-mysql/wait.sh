#!/bin/sh
echo "Waiting for MYSQL ..."
if [ -z "$MYSQL_PASSWORD" ]
then
  CONNECT="-h $MYSQL_HOST -u $MYSQL_USER -P $MYSQL_PORT"
else
  CONNECT="-h $MYSQL_HOST -u $MYSQL_USER -P $MYSQL_PORT -p$MYSQL_PASSWORD"
fi

until mysql $CONNECT &> /dev/null
do
  echo "MYSQL not ready ... retrying in 5 seconds"
  sleep 5
done

echo "MYSQL READY !!!"
