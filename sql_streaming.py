
"""
 Use persistent kmeans model to monitor the files in a folder.

 Usage:  spark-submit sql_streaming.py > log.txt
 Need to add new files to history folder to trigger the job.
"""
from __future__ import print_function

import sys

from pyspark import SparkContext
from pyspark.streaming import StreamingContext
from pyspark.sql import Row, SparkSession

from pyspark.ml import Pipeline, PipelineModel
from pyspark.ml.feature import Tokenizer
from pyspark.ml.feature import StopWordsRemover
from pyspark.ml.feature import HashingTF, IDF
from pyspark.ml.feature import Normalizer
from pyspark.ml.clustering import KMeans

from datetime import date, datetime

def parse(lp):
    # format: (uid) [title]
    uid = lp[lp.find('(') + 1: lp.find(')')]
    title = lp[lp.find('[') + 1: lp.find(']')]
    return uid, title 

def getSparkSessionInstance(sparkConf):
    if ('sparkSessionSingletonInstance' not in globals()):
        globals()['sparkSessionSingletonInstance'] = SparkSession\
            .builder\
            .config(conf=sparkConf)\
            .getOrCreate()
    return globals()['sparkSessionSingletonInstance']


if __name__ == "__main__":
    sc = SparkContext(appName="PythonSqlNetworkWordCount")
    ssc = StreamingContext(sc, 5)

    words = ssc.textFileStream('history').map(parse)

    # Convert RDDs of the words DStream to DataFrame and run SQL query
    def process(time, rdd):
        print("========= %s =========" % str(time))

        try:
            # Get the singleton instance of SparkSession
            spark = getSparkSessionInstance(rdd.context.getConf())
    
            # Convert RDD[String] to RDD[Row] to DataFrame
            rowRdd = rdd.map(lambda w: Row(id = w[0], title=w[1]))
            wordsDataFrame = spark.createDataFrame(rowRdd)
            
            # load model pipeline
            model = PipelineModel.load('kmeans')
            prediction = model.transform(wordsDataFrame).select("id", "6_kmeans")
            
            
            prediction.show(5)
            
        
            # save prediction to product_cluster table
            url = "jdbc:mysql://localhost:3306/flashdeals"
            properties = {
                "user": "root",
                "password": ""
            }
            
            
            # product_cluster_df = spark.read.format("jdbc").options(
            # url = url,
            # driver="com.mysql.jdbc.Driver",
            # dbtable="product_clusters",
            # user="root",
            # password=""
            # ).load()
            
            product_cluster_df = spark.read.jdbc(url=url, table="product_clusters", properties=properties)
            
            #prediction.show(5)
            product_cluster_df.show(5)
                        
            new_id = product_cluster_df.agg({"id": "max"}).collect()[0]['max(id)'] + 1
            new_cluster_df = spark.createDataFrame([Row(id=new_id, 
                                                    product_id = prediction.first().id,
                                                    cluster=prediction.first()["6_kmeans"],
                                                    created_at=datetime.now(), 
                                                    updated_at=datetime.now())])
            new_cluster_df.write.jdbc(url=url, table="product_clusters", mode = "append", properties=properties) 
        except:
            pass
            

    words.foreachRDD(process)
    ssc.start()
    ssc.awaitTermination()
