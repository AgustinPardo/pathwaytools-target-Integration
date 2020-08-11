# pathwaytools-target-Integration

### Requirements:

docker

PathwayTools installer linux-64

### Install:
```
sudo docker build -t pathway:24.0 .
```

### Run python server (5008 default pythoncyc socket connection):
```
sudo docker run --name pathwaytools --volume $PWD:/localData --volume $PWD/PGDBs:/opt/data/ptools-local/pgdbs -d -p 5008:5008 pathway:24.0 
```
This comand links the . directory to localData container directory, and create the PGDB folder where the PGDB reconstructions are stored. Also start a python server that listen in port 5008.


### Create the PGDB. Files to create the PGDB should be on a folder in . directory. (For this example test_kp13 folder)
```
sudo docker exec pathwaytools bash opt/pathway-tools/pathway-tools  -no-cel-overview -no-web-cel-overview -patho localData/test_kp13
```

### Restart the python service to see the new PGDB
```
sudo docker container restart pathwaytools
```


### Test the new PGDB reconstruction:

```python
import pythoncyc
PGDB_list=pythoncyc.all_orgids()
PGDB_list

meta = pythoncyc.select_organism("META")
all_pathways_list=meta.all_pathways(selector='all', base=True)
all_pathways_list

meta = pythoncyc.select_organism("TEST_2")
all_pathways_list=meta.all_pathways(selector='all', base=True)
all_pathways_list
```

<img src="https://docs.google.com/drawings/d/1yNp2wlEK0HYLAtRyw1voCTVYEGJ9KNBmqQun7bjWbB8/export/png"/>
