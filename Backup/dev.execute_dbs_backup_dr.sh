#!/bin/bash
# Utility to run a copy of the snapshots of Hive Metastore, Oozie, HUE and Ambari databases from a source cluster and drop it to target cluster

now=$(date +'%Y-%m-%d')

echo "......Executing remote copy of backup data from source cluster to target cluster at " + $(date)

hadoop distcp -update -prbugp -m 32 \
        hdfs://qa_namenode_host/sql_dbs_backup/.snapshot/$now \
        hdfs://dev_namenode_host/backup/

echo "......Completed copying source cluster data for back to target cluster"
