```
Version  1.97       ------Sequential Output------ --Sequential Input- --Random-
Concurrency   1     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
ceph-admin    8196M   627  95 107864  16 48505   6  3505  97 111419   6 710.5   6
Latency             12428us     713ms    1317ms    3376us   41545us     230ms
Version  1.97       ------Sequential Create------ --------Random Create--------
ceph-admin          -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16 +++++ +++ +++++ +++ +++++ +++ +++++ +++ +++++ +++ +++++ +++
Latency              1214us     679us     709us     129us      30us      53us
1.97,1.97,ceph-admin,1,1466783481,8196M,,627,95,107864,16,48505,6,3505,97,111419,6,710.5,6,16,,,,,+++++,+++,+++++,+++,+++++,+++,+++++,+++,+++++,+++,+++++,+++,12428us,713ms,1317ms,3376us,41545us,230ms,1214us,679us,709us,129us,30us,53us
```
