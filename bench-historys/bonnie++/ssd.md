```
Version  1.97       ------Sequential Output------ --Sequential Input- --Random-
Concurrency   1     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
ceph-admin    8196M   630  94 112045  16 37432   5  2084  98 80393   4 950.7   9
Latency             12352us    1034ms    2232ms    5020us   45519us     229ms
Version  1.97       ------Sequential Create------ --------Random Create--------
ceph-admin          -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16 29005  66 +++++ +++ 30628  57 26771  36 +++++ +++ 30726  56
Latency               612us     667us     735us      66us      32us      63us
1.97,1.97,ceph-admin,1,1466787633,8196M,,630,94,112045,16,37432,5,2084,98,80393,4,950.7,9,16,,,,,29005,66,+++++,+++,30628,57,26771,36,+++++,+++,30726,56,12352us,1034ms,2232ms,5020us,45519us,229ms,612us,667us,735us,66us,32us,63us
```
