```
Version  1.97       ------Sequential Output------ --Sequential Input- --Random-
Concurrency   1     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
ceph-admin    8196M   646  97 86208  12 44422   5  2027  97 104162   5 889.7   8
Latency             12279us    1920ms    2462ms    4228us   41355us   43431us
Version  1.97       ------Sequential Create------ --------Random Create--------
ceph-admin          -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16 20285  28 +++++ +++ +++++ +++ 30720  69 +++++ +++ +++++ +++
Latency               727us     406us     431us     121us      35us      61us
1.97,1.97,ceph-admin,1,1466766230,8196M,,646,97,86208,12,44422,5,2027,97,104162,5,889.7,8,16,,,,,20285,28,+++++,+++,+++++,+++,30720,69,+++++,+++,+++++,+++,12279us,1920ms,2462ms,4228us,41355us,43431us,727us,406us,431us,121us,35us,61us
```


```
Version  1.97       ------Sequential Output------ --Sequential Input- --Random-
Concurrency   1     -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
ceph-admin    8196M   499  96 85809  12 44840   5  2656  97 105705   6 935.9   9
Latency               173ms    1945ms    3152ms    5197us   41923us   40840us
Version  1.97       ------Sequential Create------ --------Random Create--------
ceph-admin          -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16 22297  48 +++++ +++ 18147  27 +++++ +++ +++++ +++ 14278  21
Latency              1096us     631us     725us     108us     189us      56us
1.97,1.97,ceph-admin,1,1466778502,8196M,,499,96,85809,12,44840,5,2656,97,105705,6,935.9,9,16,,,,,22297,48,+++++,+++,18147,27,+++++,+++,+++++,+++,14278,21,173ms,1945ms,3152ms,5197us,41923us,40840us,1096us,631us,725us,108us,189us,56us
```
