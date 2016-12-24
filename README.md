## Summary of this project

This project is a practice to learn the following web technologies.
* Ruby on Rails framework for back end.
* Ajax and javascript for communication between front end and back end.
* Use Apache Spark to collect user click history and make prediction.

### Some notes on running rails

### Some notes on running spark


To start spark with jupyter, run the following in a terminal
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

