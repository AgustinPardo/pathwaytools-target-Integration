# pathwaytools-target-Integration

Requirements:

docker

PathwayTools installer linux-64

Install:
```
sudo docker build -t pathway:24.0 .
```

Run python server (5008 default pythoncyc socket connection):
```
sudo docker run --name pathwaytools --volume $PWD:/localData --volume $PWD/PGDBs:/opt/data/ptools-local/pgdbs -d -p 5008:5008 pathway:24.0 
```

Create the PGDB. Files to create the pgdb should be on localData/organism. (For this example test_kp13 folder)
```
sudo docker exec pathwaytools bash opt/pathway-tools/pathway-tools  -no-cel-overview -no-web-cel-overview -patho localData/test_kp13
```

<img src="https://docs.google.com/drawings/d/1yNp2wlEK0HYLAtRyw1voCTVYEGJ9KNBmqQun7bjWbB8/export/png"/>
