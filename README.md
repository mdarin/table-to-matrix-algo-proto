# table-to-matrix-algo-proto
Algorithm prototype for data transformation

clone and just run the perl script t2m.pl
```bash
$./t2m.pl
```
You will see the flollowing out put in the console...
```
max len: 13
GTL ао;ENPL-гдр;+МосЭнерго;iQIWI
2.748;2.75;2.7355;2.749
2.7415;2.751;2.735;2.7485
2.7405;2.75;2.7375;2.7445
2.739;0.0;2.748;2.749
2.7335;0.0;0.0;2.7475
2.7325;0.0;0.0;0.0
2.7305;0.0;0.0;0.0
2.7325;0.0;0.0;0.0
2.7325;0.0;0.0;0.0
2.7305;0.0;0.0;0.0
2.734;0.0;0.0;0.0
2.736;0.0;0.0;0.0
```
You can redirect stdout into a file
```bash
$./t2m.pl >table.mat
$ cat table.mat
```
You shoul see same result
Good luck! :)
