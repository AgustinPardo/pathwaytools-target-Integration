# pathwaytools-target-Integration

Requirements:

docker

PathwayTools installer linux-64

Install:
```
sudo docker build -t pathway:24.0 .
```
Run (5008 default pythoncyc socket connection):
```
sudo docker run --volume $PWD:/localData --volume $PWD/PGDBs:/opt/data/ptools-local/pgdbs -it -p 5008:5008 pathway:24.0
```

Create the PGDB:
```
/opt/pathway-tools/pathway-tools -lisp -no-cel-overview -no-web-cel-overview -patho localData/test_kp13

```
Run python server on 5008 port:
```
/opt/pathway-tools/pathway-tools -lisp -python
```

<img src="https://docs.google.com/drawings/d/1yNp2wlEK0HYLAtRyw1voCTVYEGJ9KNBmqQun7bjWbB8/export/png"/>
