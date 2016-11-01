from __future__ import print_function

from pyspark.sql import SparkSession
# $example on:schema_merging$
from pyspark.sql import Row
# $example off:schema_merging$
from pyspark.ml import Pipeline
from pyspark.ml.feature import Tokenizer
from pyspark.ml.feature import StopWordsRemover
from pyspark.ml.feature import HashingTF, IDF
from pyspark.ml.feature import Normalizer
from pyspark.ml.clustering import KMeans


def read_db(spark):
  url = "jdbc:mysql://localhost:3306/flashdeals"
  properties = {
    "user": "root",
    "password": ""
  }

  # read a table from database.
  
  products_df = spark.read.format("jdbc").options(
  url = url,
  driver="com.mysql.jdbc.Driver",
  dbtable="products",
  user="root",
  password=""
  ).load()
  
  # simple operation
  categories_df = products_df.select(["id", "catalog_id"])
  categories_df.show(10)
  return products_df
  
def fit_kmeans(spark, products_df):
  step = 0 

  step += 1
  tokenizer = Tokenizer(inputCol="title", outputCol=str(step) + "_tokenizer")
  
  step += 1
  stopwords = StopWordsRemover(inputCol=tokenizer.getOutputCol(), outputCol=str(step) + "_stopwords")
  
  step += 1
  tf = HashingTF(inputCol=stopwords.getOutputCol(), outputCol=str(step) + "_tf", numFeatures=16)
  
  step += 1
  idf = IDF(inputCol=tf.getOutputCol(), outputCol=str(step) + "_idf")
  
  step += 1
  normalizer = Normalizer(inputCol=idf.getOutputCol(), outputCol=str(step) + "_normalizer")
  
  step += 1
  kmeans = KMeans(featuresCol=normalizer.getOutputCol(), predictionCol = str(step) + "_kmeans", k=2, seed=20)
  
  kmeans_pipeline = Pipeline(stages=[tokenizer, stopwords, tf, idf, normalizer, kmeans])
  
  model = kmeans_pipeline.fit(products_df)
  words_prediction = model.transform(products_df)
  model.save('./kmeans') # the whole machine learning instance is saved in a folder
  return model, words_prediction



# boiler plate entry
if __name__ == "__main__":
    # $example on:init_session$
    spark = SparkSession \
        .builder \
        .appName("Python Spark SQL basic example") \
        .config("spark.some.config.option", "some-value") \
        .getOrCreate()
    # $example off:init_session$


    products_df = read_db(spark)
    model, result = fit_kmeans(spark, products_df)
    result.select("6_kmeans").show(5)
    
    spark.stop()
