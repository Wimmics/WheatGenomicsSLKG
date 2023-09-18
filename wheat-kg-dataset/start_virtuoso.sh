#!/bin/bash

if [ -f "env.sh" ]; then
   . ./env.sh
fi

sudo docker run --name $VIRTUOSO_CONTAINER -p 8890:8890 -it \
  -p 1111:1111 \
  -e DBA_PASSWORD=$VIRTUOSO_PWD \
  -e SPARQL_UPDATE=true \
  -e DEFAULT_GRAPH=http://ns.inria.fr/d2kab/graph/wheatgenomicsslkg \
  -v /home/yacoubi/d2kab/virtuoso-openlink:/database \
  -v /home/yacoubi/d2kab/wheatgenomicslkg/dataset:/dataset_wheatgenomicslkg \
  -v /home/yacoubi/d2kab/ricegenomicslkg/dataset:/dataset_ricegenomicslkg \
  -d openlink/virtuoso-opensource-7:latest
