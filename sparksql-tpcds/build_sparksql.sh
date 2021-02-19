#!/bin/bash
source `dirname "$0"`/conf.sh

curl https://bintray.com/sbt/rpm/rpm | sudo tee /etc/yum.repos.d/bintray-sbt-rpm.repo
sudo yum install -y sbt
sudo yum install -y gcc make flex bison byacc git


git clone https://github.com/databricks/spark-sql-perf.git
cd spark-sql-perf/
# support spark 2.4 and scala 2.11
git checkout 85bbfd4ca22b386b3216af5434b44ad3b6a32b58

sbt assembly

echo "Done. Next, run build_tpcds_kit.sh to build and install DataBricks' tpcds-kit"
