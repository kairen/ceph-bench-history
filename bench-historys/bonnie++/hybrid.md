```
Version  1.97       ------Sequential Output------ --Sequential Input- --Random-
Concurrency   1     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
ceph-admin    8196M   446  98 113486  17 43190   5  2063  98 85495   4  1292  12
Latency             21900us     735ms    2056ms    5119us   41625us     208ms
Version  1.97       ------Sequential Create------ --------Random Create--------
ceph-admin          -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16 +++++ +++ +++++ +++ 31949  59 28909  64 +++++ +++ 30901  56
Latency              2366us     688us     718us     113us      89us      64us
1.97,1.97,ceph-admin,1,1466783576,8196M,,446,98,113486,17,43190,5,2063,98,85495,4,1292,12,16,,,,,+++++,+++,+++++,+++,31949,59,28909,64,+++++,+++,30901,56,21900us,735ms,2056ms,5119us,41625us,208ms,2366us,688us,718us,113us,89us,64us
```
