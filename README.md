## Summary of this project

This project is a practice to learn the following web technologies.
* Ruby on Rails framework for back end.
* Ajax and javascript for communication between front end and back end.
* Use Apache Spark to collect user click history and make prediction.

### Features implemented

* A product database to retrieve information using Amazon API.
* Show products for certain categories or vendors.
* User registration and login.
* Add, remove alerts by user.
* Automatically email users contents related to their alerts.
* Backend administration interface.
* Collect user click history and make recommendations based on the click history (see issue #1).

### Some notes on running rails
* rails s -p $PORT -b $IP

### Some notes on running spark

To start spark with jupyter, run the following in a terminal
(default configuration is in conf/spark-default.conf)
```shell
PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS="notebook --ip=0.0.0.0 --port=8081 --no-browser" pyspark 
# in order to connnect with mysql db
PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS="notebook --ip=0.0.0.0 --port=8081 --no-browser" pyspark --packages mysql:mysql-connector-java:5.1.38
or better 
PYSPARK_DRIVER_PYTHON=jupyter PYSPARK_DRIVER_PYTHON_OPTS="notebook --ip=0.0.0.0 --port=8081 --no-browser" pyspark --jars mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar --driver-class-path mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar

```

To submit jobs with jdbc, run
```shell
spark-submit --jars mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar --driver-class-path mysql-connector-java-5.1.40/mysql-connector-java-5.1.40-bin.jar sql_streaming.py 
```



Welcome to your Rails project on Cloud9 IDE!

To get started, just do the following:

1. Run the project with the "Run Project" button in the menu bar on top of the IDE.
2. Preview your new app by clicking on the URL that appears in the Run panel below (https://flash-deals-c9-ohliumliu.c9users.io/).

Happy coding!
The Cloud9 IDE team


## Support & Documentation

Visit http://docs.c9.io for support, or to learn more about using Cloud9 IDE. 
To watch some training videos, visit http://www.youtube.com/user/c9ide
