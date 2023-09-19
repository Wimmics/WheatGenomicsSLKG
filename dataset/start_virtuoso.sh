#!/bin/bash
# To be executed as sudo

if [ -f "env.sh" ]; then
    echo "Running env.sh."
    . ./env.sh
fi

docker run --name $VIRTUOSO_CONTAINER \
  -p 8892:8890 -it \
  -e DBA_PASSWORD=$VIRTUOSO_PWD \
  -e SPARQL_UPDATE=true \
  -e DEFAULT_GRAPH=http://ns.inria.fr/d2kab/graph/wheatgenomicsslkg \
  -v /home/yacoubi/d2kab/virtuosodb:/database \
  -v /home/yacoubi/d2kab/WheatGenomicsSLKG/dataset:/dataset_wheatgenomicsslkg \
  -v /home/yacoubi/d2kab/RiceGenimocsSLKG/dataset:/dataset_ricegenomicsslkg \
  -d openlink/virtuoso-opensource-7:latest
