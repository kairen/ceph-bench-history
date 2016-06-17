# rados block device using rbd-bench

- [4096 bytes 100 object 100 get](#4096-bytes-100-object-100-get)
- [4096 bytes 500 object 100 get](#4096-bytes-500-object-100-get)
- [4096 bytes 1000 object 100 get](#4096-bytes-1000-object-100-get)
- [40960 bytes 100 object 100 get](#40960-bytes-100-object-100-get)
- [40960 bytes 500 object 100 get](#40960-bytes-500-object-100-get)
- [40960 bytes 1000 object 100 get](#40960-bytes-1000-object-100-get)

## 4096 bytes 100 object 100 get
------------------------ Test 1 ------------------------
```
swift-bench 2016-06-16 22:16:50,746 INFO Auth version: 1.0
swift-bench 2016-06-16 22:16:51,794 INFO Auth version: 1.0
swift-bench 2016-06-16 22:16:52,253 INFO 100 PUTS **FINAL** [0 failures], 223.3/s
swift-bench 2016-06-16 22:16:52,253 INFO Auth version: 1.0
swift-bench 2016-06-16 22:17:22,066 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:17:22,067 INFO Auth version: 1.0
swift-bench 2016-06-16 22:17:22,746 INFO 100 DEL **FINAL** [0 failures], 151.2/s
swift-bench 2016-06-16 22:17:22,747 INFO Auth version: 1.0
```

------------------------ Test 2 ------------------------
```
swift-bench 2016-06-16 22:15:48,734 INFO Auth version: 1.0
swift-bench 2016-06-16 22:15:50,033 INFO Auth version: 1.0
swift-bench 2016-06-16 22:15:50,540 INFO 100 PUTS **FINAL** [0 failures], 202.7/s
swift-bench 2016-06-16 22:15:50,540 INFO Auth version: 1.0
swift-bench 2016-06-16 22:16:20,322 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:16:20,322 INFO Auth version: 1.0
swift-bench 2016-06-16 22:16:21,019 INFO 100 DEL **FINAL** [0 failures], 146.7/s
swift-bench 2016-06-16 22:16:21,019 INFO Auth version: 1.0
```

------------------------ Test 3 ------------------------
```
swift-bench 2016-06-16 22:14:46,943 INFO Auth version: 1.0
swift-bench 2016-06-16 22:14:47,999 INFO Auth version: 1.0
swift-bench 2016-06-16 22:14:48,495 INFO 100 PUTS **FINAL** [0 failures], 207.0/s
swift-bench 2016-06-16 22:14:48,495 INFO Auth version: 1.0
swift-bench 2016-06-16 22:15:18,308 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:15:18,308 INFO Auth version: 1.0
swift-bench 2016-06-16 22:15:18,912 INFO 100 DEL **FINAL** [0 failures], 169.7/s
swift-bench 2016-06-16 22:15:18,912 INFO Auth version: 1.0
```

------------------------ Test 4 ------------------------
```
swift-bench 2016-06-16 22:13:45,216 INFO Auth version: 1.0
swift-bench 2016-06-16 22:13:46,270 INFO Auth version: 1.0
swift-bench 2016-06-16 22:13:46,673 INFO 100 PUTS **FINAL** [0 failures], 255.0/s
swift-bench 2016-06-16 22:13:46,673 INFO Auth version: 1.0
swift-bench 2016-06-16 22:14:16,538 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:14:16,539 INFO Auth version: 1.0
swift-bench 2016-06-16 22:14:17,072 INFO 100 DEL **FINAL** [0 failures], 193.6/s
swift-bench 2016-06-16 22:14:17,072 INFO Auth version: 1.0
```

------------------------ Test 5 ------------------------
```
swift-bench 2016-06-16 22:12:42,533 INFO Auth version: 1.0
swift-bench 2016-06-16 22:12:44,561 INFO Auth version: 1.0
swift-bench 2016-06-16 22:12:44,955 INFO 100 PUTS **FINAL** [0 failures], 260.9/s
swift-bench 2016-06-16 22:12:44,955 INFO Auth version: 1.0
swift-bench 2016-06-16 22:13:14,829 INFO 100 GETS **FINAL** [0 failures], 3.3/s
swift-bench 2016-06-16 22:13:14,829 INFO Auth version: 1.0
swift-bench 2016-06-16 22:13:15,525 INFO 100 DEL **FINAL** [0 failures], 146.4/s
swift-bench 2016-06-16 22:13:15,525 INFO Auth version: 1.0
```

## 4096 bytes 500 object 100 get
------------------------ Test 1 ------------------------
```
swift-bench 2016-06-16 22:21:46,658 INFO Auth version: 1.0
swift-bench 2016-06-16 22:21:47,783 INFO Auth version: 1.0
swift-bench 2016-06-16 22:21:49,549 INFO 500 PUTS **FINAL** [0 failures], 285.1/s
swift-bench 2016-06-16 22:21:49,549 INFO Auth version: 1.0
swift-bench 2016-06-16 22:22:19,238 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:22:19,239 INFO Auth version: 1.0
swift-bench 2016-06-16 22:22:21,209 INFO 500 DEL **FINAL** [0 failures], 255.8/s
swift-bench 2016-06-16 22:22:21,209 INFO Auth version: 1.0
```

------------------------ Test 2 ------------------------
```
swift-bench 2016-06-16 22:21:11,790 INFO Auth version: 1.0
swift-bench 2016-06-16 22:21:12,923 INFO Auth version: 1.0
swift-bench 2016-06-16 22:21:14,627 INFO 500 PUTS **FINAL** [0 failures], 295.4/s
swift-bench 2016-06-16 22:21:14,627 INFO Auth version: 1.0
swift-bench 2016-06-16 22:21:44,407 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:21:44,407 INFO Auth version: 1.0
swift-bench 2016-06-16 22:21:46,217 INFO 500 DEL **FINAL** [0 failures], 279.0/s
swift-bench 2016-06-16 22:21:46,217 INFO Auth version: 1.0
```

------------------------ Test 3 ------------------------
```
swift-bench 2016-06-16 22:20:36,832 INFO Auth version: 1.0
swift-bench 2016-06-16 22:20:37,902 INFO Auth version: 1.0
swift-bench 2016-06-16 22:20:39,628 INFO 500 PUTS **FINAL** [0 failures], 291.5/s
swift-bench 2016-06-16 22:20:39,628 INFO Auth version: 1.0
swift-bench 2016-06-16 22:21:09,379 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:21:09,380 INFO Auth version: 1.0
swift-bench 2016-06-16 22:21:11,369 INFO 500 DEL **FINAL** [0 failures], 253.1/s
swift-bench 2016-06-16 22:21:11,369 INFO Auth version: 1.0
```

------------------------ Test 4 ------------------------
```
swift-bench 2016-06-16 22:20:02,013 INFO Auth version: 1.0
swift-bench 2016-06-16 22:20:03,117 INFO Auth version: 1.0
swift-bench 2016-06-16 22:20:04,672 INFO 500 PUTS **FINAL** [0 failures], 324.3/s
swift-bench 2016-06-16 22:20:04,673 INFO Auth version: 1.0
swift-bench 2016-06-16 22:20:34,498 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:20:34,499 INFO Auth version: 1.0
swift-bench 2016-06-16 22:20:36,348 INFO 500 DEL **FINAL** [0 failures], 272.5/s
swift-bench 2016-06-16 22:20:36,348 INFO Auth version: 1.0
```

------------------------ Test 5 ------------------------
```
swift-bench 2016-06-16 22:19:26,148 INFO Auth version: 1.0
swift-bench 2016-06-16 22:19:27,952 INFO Auth version: 1.0
swift-bench 2016-06-16 22:19:29,646 INFO 500 PUTS **FINAL** [0 failures], 296.9/s
swift-bench 2016-06-16 22:19:29,646 INFO Auth version: 1.0
swift-bench 2016-06-16 22:19:59,391 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:19:59,391 INFO Auth version: 1.0
swift-bench 2016-06-16 22:20:01,590 INFO 500 DEL **FINAL** [0 failures], 229.9/s
swift-bench 2016-06-16 22:20:01,591 INFO Auth version: 1.0
```

## 4096 bytes 1000 object 100 get
------------------------ Test 1 ------------------------
```
swift-bench 2016-06-16 22:27:30,764 INFO Auth version: 1.0
swift-bench 2016-06-16 22:27:32,020 INFO Auth version: 1.0
swift-bench 2016-06-16 22:27:34,037 INFO 666 PUTS [0 failures], 332.5/s
swift-bench 2016-06-16 22:27:36,446 INFO 1000 PUTS **FINAL** [0 failures], 226.7/s
swift-bench 2016-06-16 22:27:36,446 INFO Auth version: 1.0
swift-bench 2016-06-16 22:28:06,239 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:28:06,239 INFO Auth version: 1.0
swift-bench 2016-06-16 22:28:08,258 INFO 581 DEL [0 failures], 290.5/s
swift-bench 2016-06-16 22:28:09,812 INFO 1000 DEL **FINAL** [0 failures], 281.4/s
swift-bench 2016-06-16 22:28:09,812 INFO Auth version: 1.0
```

------------------------ Test 2 ------------------------
```
swift-bench 2016-06-16 22:26:23,993 INFO Auth version: 1.0
swift-bench 2016-06-16 22:26:25,073 INFO Auth version: 1.0
swift-bench 2016-06-16 22:26:27,087 INFO 657 PUTS [0 failures], 328.5/s
swift-bench 2016-06-16 22:26:30,725 INFO 1000 PUTS **FINAL** [0 failures], 177.4/s
swift-bench 2016-06-16 22:26:30,726 INFO Auth version: 1.0
swift-bench 2016-06-16 22:27:00,311 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:27:00,311 INFO Auth version: 1.0
swift-bench 2016-06-16 22:27:02,328 INFO 588 DEL [0 failures], 293.9/s
swift-bench 2016-06-16 22:27:03,838 INFO 1000 DEL **FINAL** [0 failures], 284.8/s
swift-bench 2016-06-16 22:27:03,839 INFO Auth version: 1.0
```

------------------------ Test 3 ------------------------
```
swift-bench 2016-06-16 22:25:44,659 INFO Auth version: 1.0
swift-bench 2016-06-16 22:25:45,723 INFO Auth version: 1.0
swift-bench 2016-06-16 22:25:47,739 INFO 690 PUTS [0 failures], 344.8/s
swift-bench 2016-06-16 22:25:50,396 INFO 1000 PUTS **FINAL** [0 failures], 214.7/s
swift-bench 2016-06-16 22:25:50,397 INFO Auth version: 1.0
swift-bench 2016-06-16 22:26:19,923 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:26:19,924 INFO Auth version: 1.0
swift-bench 2016-06-16 22:26:21,943 INFO 539 DEL [0 failures], 269.1/s
swift-bench 2016-06-16 22:26:23,513 INFO 1000 DEL **FINAL** [0 failures], 279.9/s
swift-bench 2016-06-16 22:26:23,513 INFO Auth version: 1.0
```

------------------------ Test 4 ------------------------
```
swift-bench 2016-06-16 22:24:38,660 INFO Auth version: 1.0
swift-bench 2016-06-16 22:24:39,744 INFO Auth version: 1.0
swift-bench 2016-06-16 22:24:41,762 INFO 656 PUTS [0 failures], 327.7/s
swift-bench 2016-06-16 22:24:44,473 INFO 1000 PUTS **FINAL** [0 failures], 212.2/s
swift-bench 2016-06-16 22:24:44,473 INFO Auth version: 1.0
swift-bench 2016-06-16 22:25:14,172 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:25:14,172 INFO Auth version: 1.0
swift-bench 2016-06-16 22:25:16,194 INFO 558 DEL [0 failures], 278.4/s
swift-bench 2016-06-16 22:25:17,918 INFO 1000 DEL **FINAL** [0 failures], 268.3/s
swift-bench 2016-06-16 22:25:17,918 INFO Auth version: 1.0
```

------------------------ Test 5 ------------------------
```
swift-bench 2016-06-16 22:23:31,450 INFO Auth version: 1.0
swift-bench 2016-06-16 22:23:33,138 INFO Auth version: 1.0
swift-bench 2016-06-16 22:23:35,154 INFO 700 PUTS [0 failures], 349.6/s
swift-bench 2016-06-16 22:23:38,513 INFO 1000 PUTS **FINAL** [0 failures], 186.5/s
swift-bench 2016-06-16 22:23:38,513 INFO Auth version: 1.0
swift-bench 2016-06-16 22:24:08,218 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 22:24:08,218 INFO Auth version: 1.0
swift-bench 2016-06-16 22:24:10,233 INFO 583 DEL [0 failures], 291.3/s
swift-bench 2016-06-16 22:24:11,803 INFO 1000 DEL **FINAL** [0 failures], 280.0/s
swift-bench 2016-06-16 22:24:11,803 INFO Auth version: 1.0
```

## 40960 bytes 100 object 100 get
------------------------ Test 1 ------------------------
```
swift-bench 2016-06-16 23:16:55,225 INFO Auth version: 1.0
swift-bench 2016-06-16 23:16:56,333 INFO Auth version: 1.0
swift-bench 2016-06-16 23:16:56,788 INFO 100 PUTS **FINAL** [0 failures], 224.4/s
swift-bench 2016-06-16 23:16:56,789 INFO Auth version: 1.0
swift-bench 2016-06-16 23:17:26,617 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 23:17:26,617 INFO Auth version: 1.0
swift-bench 2016-06-16 23:17:27,268 INFO 100 DEL **FINAL** [0 failures], 158.0/s
swift-bench 2016-06-16 23:17:27,268 INFO Auth version: 1.0
```

------------------------ Test 2 ------------------------
```
swift-bench 2016-06-16 23:15:53,425 INFO Auth version: 1.0
swift-bench 2016-06-16 23:15:54,512 INFO Auth version: 1.0
swift-bench 2016-06-16 23:15:54,868 INFO 100 PUTS **FINAL** [0 failures], 293.2/s
swift-bench 2016-06-16 23:15:54,868 INFO Auth version: 1.0
swift-bench 2016-06-16 23:16:24,771 INFO 100 GETS **FINAL** [0 failures], 3.3/s
swift-bench 2016-06-16 23:16:24,771 INFO Auth version: 1.0
swift-bench 2016-06-16 23:16:25,289 INFO 100 DEL **FINAL** [0 failures], 199.3/s
swift-bench 2016-06-16 23:16:25,290 INFO Auth version: 1.0
```

------------------------ Test 3 ------------------------
```
swift-bench 2016-06-16 23:14:51,610 INFO Auth version: 1.0
swift-bench 2016-06-16 23:14:52,717 INFO Auth version: 1.0
swift-bench 2016-06-16 23:14:53,071 INFO 100 PUTS **FINAL** [0 failures], 291.6/s
swift-bench 2016-06-16 23:14:53,071 INFO Auth version: 1.0
swift-bench 2016-06-16 23:15:23,004 INFO 100 GETS **FINAL** [0 failures], 3.3/s
swift-bench 2016-06-16 23:15:23,005 INFO Auth version: 1.0
swift-bench 2016-06-16 23:15:23,532 INFO 100 DEL **FINAL** [0 failures], 194.3/s
swift-bench 2016-06-16 23:15:23,533 INFO Auth version: 1.0
```

------------------------ Test 4 ------------------------
```
swift-bench 2016-06-16 23:13:49,686 INFO Auth version: 1.0
swift-bench 2016-06-16 23:13:50,822 INFO Auth version: 1.0
swift-bench 2016-06-16 23:13:51,257 INFO 100 PUTS **FINAL** [0 failures], 238.2/s
swift-bench 2016-06-16 23:13:51,257 INFO Auth version: 1.0
swift-bench 2016-06-16 23:14:21,127 INFO 100 GETS **FINAL** [0 failures], 3.3/s
swift-bench 2016-06-16 23:14:21,128 INFO Auth version: 1.0
swift-bench 2016-06-16 23:14:21,681 INFO 100 DEL **FINAL** [0 failures], 187.1/s
swift-bench 2016-06-16 23:14:21,681 INFO Auth version: 1.0
```

------------------------ Test 5 ------------------------
```
swift-bench 2016-06-16 23:12:47,149 INFO Auth version: 1.0
swift-bench 2016-06-16 23:12:48,973 INFO Auth version: 1.0
swift-bench 2016-06-16 23:12:49,378 INFO 100 PUTS **FINAL** [0 failures], 254.9/s
swift-bench 2016-06-16 23:12:49,378 INFO Auth version: 1.0
swift-bench 2016-06-16 23:13:19,264 INFO 100 GETS **FINAL** [0 failures], 3.3/s
swift-bench 2016-06-16 23:13:19,264 INFO Auth version: 1.0
swift-bench 2016-06-16 23:13:19,833 INFO 100 DEL **FINAL** [0 failures], 181.0/s
swift-bench 2016-06-16 23:13:19,834 INFO Auth version: 1.0
```

## 40960 bytes 500 object 100 get
------------------------ Test 1 ------------------------
```
swift-bench 2016-06-16 23:23:30,590 INFO Auth version: 1.0
swift-bench 2016-06-16 23:23:31,684 INFO Auth version: 1.0
swift-bench 2016-06-16 23:23:33,451 INFO 500 PUTS **FINAL** [0 failures], 285.4/s
swift-bench 2016-06-16 23:23:33,451 INFO Auth version: 1.0
swift-bench 2016-06-16 23:24:03,144 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 23:24:03,145 INFO Auth version: 1.0
swift-bench 2016-06-16 23:24:05,076 INFO 500 DEL **FINAL** [0 failures], 260.7/s
swift-bench 2016-06-16 23:24:05,076 INFO Auth version: 1.0
```

------------------------ Test 2 ------------------------
```
swift-bench 2016-06-16 23:22:55,534 INFO Auth version: 1.0
swift-bench 2016-06-16 23:22:56,628 INFO Auth version: 1.0
swift-bench 2016-06-16 23:22:58,457 INFO 500 PUTS **FINAL** [0 failures], 275.1/s
swift-bench 2016-06-16 23:22:58,457 INFO Auth version: 1.0
swift-bench 2016-06-16 23:23:28,110 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 23:23:28,110 INFO Auth version: 1.0
swift-bench 2016-06-16 23:23:30,150 INFO 500 DEL **FINAL** [0 failures], 247.0/s
swift-bench 2016-06-16 23:23:30,150 INFO Auth version: 1.0
```

------------------------ Test 3 ------------------------
```
swift-bench 2016-06-16 23:22:20,557 INFO Auth version: 1.0
swift-bench 2016-06-16 23:22:21,681 INFO Auth version: 1.0
swift-bench 2016-06-16 23:22:23,416 INFO 500 PUTS **FINAL** [0 failures], 290.3/s
swift-bench 2016-06-16 23:22:23,416 INFO Auth version: 1.0
swift-bench 2016-06-16 23:22:53,085 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 23:22:53,085 INFO Auth version: 1.0
swift-bench 2016-06-16 23:22:55,072 INFO 500 DEL **FINAL** [0 failures], 254.7/s
swift-bench 2016-06-16 23:22:55,073 INFO Auth version: 1.0
```

------------------------ Test 4 ------------------------
```
swift-bench 2016-06-16 23:21:45,825 INFO Auth version: 1.0
swift-bench 2016-06-16 23:21:46,933 INFO Auth version: 1.0
swift-bench 2016-06-16 23:21:48,635 INFO 500 PUTS **FINAL** [0 failures], 295.8/s
swift-bench 2016-06-16 23:21:48,635 INFO Auth version: 1.0
swift-bench 2016-06-16 23:22:18,289 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 23:22:18,289 INFO Auth version: 1.0
swift-bench 2016-06-16 23:22:20,105 INFO 500 DEL **FINAL** [0 failures], 277.7/s
swift-bench 2016-06-16 23:22:20,105 INFO Auth version: 1.0
```

------------------------ Test 5 ------------------------
```
swift-bench 2016-06-16 23:21:10,034 INFO Auth version: 1.0
swift-bench 2016-06-16 23:21:11,953 INFO Auth version: 1.0
swift-bench 2016-06-16 23:21:13,806 INFO 500 PUTS **FINAL** [0 failures], 271.9/s
swift-bench 2016-06-16 23:21:13,807 INFO Auth version: 1.0
swift-bench 2016-06-16 23:21:43,487 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 23:21:43,487 INFO Auth version: 1.0
swift-bench 2016-06-16 23:21:45,390 INFO 500 DEL **FINAL** [0 failures], 264.5/s
swift-bench 2016-06-16 23:21:45,390 INFO Auth version: 1.0
```

## 40960 bytes 1000 object 100 get
------------------------ Test 1 ------------------------
```
swift-bench 2016-06-16 23:24:20,230 INFO Auth version: 1.0
swift-bench 2016-06-16 23:24:22,244 INFO Auth version: 1.0
swift-bench 2016-06-16 23:24:24,265 INFO 695 PUTS [0 failures], 346.4/s
swift-bench 2016-06-16 23:24:27,682 INFO 1000 PUTS **FINAL** [0 failures], 184.4/s
swift-bench 2016-06-16 23:24:27,683 INFO Auth version: 1.0
swift-bench 2016-06-16 23:24:57,208 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 23:24:57,208 INFO Auth version: 1.0
swift-bench 2016-06-16 23:24:59,240 INFO 543 DEL [0 failures], 271.1/s
swift-bench 2016-06-16 23:25:00,966 INFO 1000 DEL **FINAL** [0 failures], 268.2/s
swift-bench 2016-06-16 23:25:00,966 INFO Auth version: 1.0
```

------------------------ Test 2 ------------------------
```
swift-bench 2016-06-16 23:25:01,368 INFO Auth version: 1.0
swift-bench 2016-06-16 23:25:02,448 INFO Auth version: 1.0
swift-bench 2016-06-16 23:25:04,464 INFO 697 PUTS [0 failures], 347.7/s
swift-bench 2016-06-16 23:25:08,414 INFO 1000 PUTS **FINAL** [0 failures], 167.9/s
swift-bench 2016-06-16 23:25:08,414 INFO Auth version: 1.0
swift-bench 2016-06-16 23:25:38,085 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 23:25:38,085 INFO Auth version: 1.0
swift-bench 2016-06-16 23:25:40,102 INFO 567 DEL [0 failures], 283.4/s
swift-bench 2016-06-16 23:25:41,564 INFO 1000 DEL **FINAL** [0 failures], 288.8/s
swift-bench 2016-06-16 23:25:41,565 INFO Auth version: 1.0
```

------------------------ Test 3 ------------------------
```
swift-bench 2016-06-16 23:25:42,000 INFO Auth version: 1.0
swift-bench 2016-06-16 23:25:43,063 INFO Auth version: 1.0
swift-bench 2016-06-16 23:25:45,077 INFO 709 PUTS [0 failures], 354.4/s
swift-bench 2016-06-16 23:25:48,429 INFO 1000 PUTS **FINAL** [0 failures], 186.8/s
swift-bench 2016-06-16 23:25:48,430 INFO Auth version: 1.0
swift-bench 2016-06-16 23:26:17,126 INFO 100 GETS **FINAL** [0 failures], 3.5/s
swift-bench 2016-06-16 23:26:17,127 INFO Auth version: 1.0
swift-bench 2016-06-16 23:26:19,145 INFO 480 DEL [0 failures], 239.1/s
swift-bench 2016-06-16 23:26:20,890 INFO 1000 DEL **FINAL** [0 failures], 266.5/s
swift-bench 2016-06-16 23:26:20,890 INFO Auth version: 1.0
```

------------------------ Test 4 ------------------------
```
swift-bench 2016-06-16 23:26:21,306 INFO Auth version: 1.0
swift-bench 2016-06-16 23:26:22,459 INFO Auth version: 1.0
swift-bench 2016-06-16 23:26:24,476 INFO 605 PUTS [0 failures], 301.9/s
swift-bench 2016-06-16 23:26:26,546 INFO 1000 PUTS **FINAL** [0 failures], 245.5/s
swift-bench 2016-06-16 23:26:26,546 INFO Auth version: 1.0
swift-bench 2016-06-16 23:26:55,937 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 23:26:55,937 INFO Auth version: 1.0
swift-bench 2016-06-16 23:26:57,954 INFO 506 DEL [0 failures], 252.9/s
swift-bench 2016-06-16 23:26:59,858 INFO 1000 DEL **FINAL** [0 failures], 256.1/s
swift-bench 2016-06-16 23:26:59,858 INFO Auth version: 1.0
```

------------------------ Test 5 ------------------------
```
swift-bench 2016-06-16 23:27:00,323 INFO Auth version: 1.0
swift-bench 2016-06-16 23:27:01,470 INFO Auth version: 1.0
swift-bench 2016-06-16 23:27:03,482 INFO 544 PUTS [0 failures], 271.8/s
swift-bench 2016-06-16 23:27:06,414 INFO 1000 PUTS **FINAL** [0 failures], 202.7/s
swift-bench 2016-06-16 23:27:06,414 INFO Auth version: 1.0
swift-bench 2016-06-16 23:27:36,243 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-16 23:27:36,243 INFO Auth version: 1.0
swift-bench 2016-06-16 23:27:38,263 INFO 546 DEL [0 failures], 272.5/s
swift-bench 2016-06-16 23:27:40,180 INFO 1000 DEL **FINAL** [0 failures], 255.1/s
swift-bench 2016-06-16 23:27:40,180 INFO Auth version: 1.0
```
