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
swift-bench 2016-06-18 01:40:50,562 INFO Auth version: 1.0
swift-bench 2016-06-18 01:40:51,753 INFO Auth version: 1.0
swift-bench 2016-06-18 01:40:52,367 INFO 100 PUTS **FINAL** [0 failures], 166.3/s
swift-bench 2016-06-18 01:40:52,367 INFO Auth version: 1.0
swift-bench 2016-06-18 01:41:22,022 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 01:41:22,023 INFO Auth version: 1.0
swift-bench 2016-06-18 01:41:22,876 INFO 100 DEL **FINAL** [0 failures], 119.4/s
swift-bench 2016-06-18 01:41:22,877 INFO Auth version: 1.0
```

------------------------ Test 2 ------------------------
```
swift-bench 2016-06-18 01:39:48,633 INFO Auth version: 1.0
swift-bench 2016-06-18 01:39:49,772 INFO Auth version: 1.0
swift-bench 2016-06-18 01:39:50,283 INFO 100 PUTS **FINAL** [0 failures], 200.9/s
swift-bench 2016-06-18 01:39:50,284 INFO Auth version: 1.0
swift-bench 2016-06-18 01:40:20,181 INFO 100 GETS **FINAL** [0 failures], 3.3/s
swift-bench 2016-06-18 01:40:20,181 INFO Auth version: 1.0
swift-bench 2016-06-18 01:40:20,661 INFO 100 DEL **FINAL** [0 failures], 216.3/s
swift-bench 2016-06-18 01:40:20,662 INFO Auth version: 1.0
```

------------------------ Test 3 ------------------------
```
swift-bench 2016-06-18 01:38:47,025 INFO Auth version: 1.0
swift-bench 2016-06-18 01:38:48,075 INFO Auth version: 1.0
swift-bench 2016-06-18 01:38:48,730 INFO 100 PUTS **FINAL** [0 failures], 156.0/s
swift-bench 2016-06-18 01:38:48,731 INFO Auth version: 1.0
swift-bench 2016-06-18 01:39:18,319 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 01:39:18,319 INFO Auth version: 1.0
swift-bench 2016-06-18 01:39:19,156 INFO 100 DEL **FINAL** [0 failures], 121.6/s
swift-bench 2016-06-18 01:39:19,156 INFO Auth version: 1.0
```

------------------------ Test 4 ------------------------
```
swift-bench 2016-06-18 01:37:44,881 INFO Auth version: 1.0
swift-bench 2016-06-18 01:37:46,331 INFO Auth version: 1.0
swift-bench 2016-06-18 01:37:46,819 INFO 100 PUTS **FINAL** [0 failures], 209.6/s
swift-bench 2016-06-18 01:37:46,819 INFO Auth version: 1.0
swift-bench 2016-06-18 01:38:16,695 INFO 100 GETS **FINAL** [0 failures], 3.3/s
swift-bench 2016-06-18 01:38:16,695 INFO Auth version: 1.0
swift-bench 2016-06-18 01:38:17,395 INFO 100 DEL **FINAL** [0 failures], 146.2/s
swift-bench 2016-06-18 01:38:17,395 INFO Auth version: 1.0
```

------------------------ Test 5 ------------------------
```
swift-bench 2016-06-18 01:43:15,923 INFO Auth version: 1.0
swift-bench 2016-06-18 01:43:17,264 INFO Auth version: 1.0
swift-bench 2016-06-18 01:43:17,709 INFO 100 PUTS **FINAL** [0 failures], 231.1/s
swift-bench 2016-06-18 01:43:17,709 INFO Auth version: 1.0
swift-bench 2016-06-18 01:43:47,549 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 01:43:47,549 INFO Auth version: 1.0
swift-bench 2016-06-18 01:43:48,041 INFO 100 DEL **FINAL** [0 failures], 209.6/s
swift-bench 2016-06-18 01:43:48,042 INFO Auth version: 1.0
```

## 4096 bytes 500 object 100 get
------------------------ Test 1 ------------------------
```
swift-bench 2016-06-18 01:47:50,888 INFO Auth version: 1.0
swift-bench 2016-06-18 01:47:52,536 INFO Auth version: 1.0
swift-bench 2016-06-18 01:47:54,534 INFO 500 PUTS **FINAL** [0 failures], 252.2/s
swift-bench 2016-06-18 01:47:54,534 INFO Auth version: 1.0
swift-bench 2016-06-18 01:48:24,386 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 01:48:24,386 INFO Auth version: 1.0
swift-bench 2016-06-18 01:48:26,301 INFO 500 DEL **FINAL** [0 failures], 263.2/s
swift-bench 2016-06-18 01:48:26,301 INFO Auth version: 1.0
```

------------------------ Test 2 ------------------------
```
swift-bench 2016-06-18 01:47:14,412 INFO Auth version: 1.0
swift-bench 2016-06-18 01:47:16,266 INFO Auth version: 1.0
swift-bench 2016-06-18 01:47:18,383 INFO 500 PUTS **FINAL** [0 failures], 237.6/s
swift-bench 2016-06-18 01:47:18,383 INFO Auth version: 1.0
swift-bench 2016-06-18 01:47:47,702 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 01:47:47,703 INFO Auth version: 1.0
swift-bench 2016-06-18 01:47:49,765 INFO 500 DEL **FINAL** [0 failures], 248.4/s
swift-bench 2016-06-18 01:47:49,765 INFO Auth version: 1.0
```

------------------------ Test 3 ------------------------
```
swift-bench 2016-06-18 01:46:38,774 INFO Auth version: 1.0
swift-bench 2016-06-18 01:46:39,977 INFO Auth version: 1.0
swift-bench 2016-06-18 01:46:41,779 INFO 500 PUTS **FINAL** [0 failures], 279.6/s
swift-bench 2016-06-18 01:46:41,779 INFO Auth version: 1.0
swift-bench 2016-06-18 01:47:11,629 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 01:47:11,629 INFO Auth version: 1.0
swift-bench 2016-06-18 01:47:13,547 INFO 500 DEL **FINAL** [0 failures], 263.3/s
swift-bench 2016-06-18 01:47:13,547 INFO Auth version: 1.0
```

------------------------ Test 4 ------------------------
```
swift-bench 2016-06-18 01:46:01,569 INFO Auth version: 1.0
swift-bench 2016-06-18 01:46:02,974 INFO Auth version: 1.0
swift-bench 2016-06-18 01:46:05,029 INFO 408 PUTS [0 failures], 199.6/s
swift-bench 2016-06-18 01:46:06,469 INFO 500 PUTS **FINAL** [0 failures], 143.5/s
swift-bench 2016-06-18 01:46:06,470 INFO Auth version: 1.0
swift-bench 2016-06-18 01:46:35,589 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 01:46:35,589 INFO Auth version: 1.0
swift-bench 2016-06-18 01:46:37,791 INFO 500 DEL **FINAL** [0 failures], 228.8/s
swift-bench 2016-06-18 01:46:37,792 INFO Auth version: 1.0
```

------------------------ Test 5 ------------------------
```
swift-bench 2016-06-18 01:45:25,094 INFO Auth version: 1.0
swift-bench 2016-06-18 01:45:26,482 INFO Auth version: 1.0
swift-bench 2016-06-18 01:45:28,587 INFO 435 PUTS [0 failures], 207.8/s
swift-bench 2016-06-18 01:45:29,925 INFO 500 PUTS **FINAL** [0 failures], 145.7/s
swift-bench 2016-06-18 01:45:29,926 INFO Auth version: 1.0
swift-bench 2016-06-18 01:45:58,821 INFO 100 GETS **FINAL** [0 failures], 3.5/s
swift-bench 2016-06-18 01:45:58,821 INFO Auth version: 1.0
swift-bench 2016-06-18 01:46:00,574 INFO 500 DEL **FINAL** [0 failures], 292.8/s
swift-bench 2016-06-18 01:46:00,574 INFO Auth version: 1.0
```

## 4096 bytes 1000 object 100 get
------------------------ Test 1 ------------------------
```
swift-bench 2016-06-18 01:52:33,380 INFO Auth version: 1.0
swift-bench 2016-06-18 01:52:34,732 INFO Auth version: 1.0
swift-bench 2016-06-18 01:52:36,829 INFO 410 PUTS [0 failures], 196.8/s
swift-bench 2016-06-18 01:52:41,130 INFO 1000 PUTS **FINAL** [0 failures], 156.6/s
swift-bench 2016-06-18 01:52:41,130 INFO Auth version: 1.0
swift-bench 2016-06-18 01:53:10,674 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 01:53:10,674 INFO Auth version: 1.0
swift-bench 2016-06-18 01:53:12,696 INFO 570 DEL [0 failures], 284.0/s
swift-bench 2016-06-18 01:53:15,238 INFO 1000 DEL **FINAL** [0 failures], 219.8/s
swift-bench 2016-06-18 01:53:15,239 INFO Auth version: 1.0
```

------------------------ Test 2 ------------------------
```
swift-bench 2016-06-18 01:51:51,393 INFO Auth version: 1.0
swift-bench 2016-06-18 01:51:52,628 INFO Auth version: 1.0
swift-bench 2016-06-18 01:51:54,649 INFO 524 PUTS [0 failures], 260.9/s
swift-bench 2016-06-18 01:51:58,406 INFO 1000 PUTS **FINAL** [0 failures], 173.5/s
swift-bench 2016-06-18 01:51:58,406 INFO Auth version: 1.0
swift-bench 2016-06-18 01:52:27,857 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 01:52:27,857 INFO Auth version: 1.0
swift-bench 2016-06-18 01:52:29,872 INFO 497 DEL [0 failures], 248.4/s
swift-bench 2016-06-18 01:52:32,662 INFO 1000 DEL **FINAL** [0 failures], 208.7/s
swift-bench 2016-06-18 01:52:32,662 INFO Auth version: 1.0
```

------------------------ Test 3 ------------------------
```
swift-bench 2016-06-18 01:50:43,991 INFO Auth version: 1.0
swift-bench 2016-06-18 01:50:45,066 INFO Auth version: 1.0
swift-bench 2016-06-18 01:50:47,100 INFO 531 PUTS [0 failures], 263.0/s
swift-bench 2016-06-18 01:50:51,559 INFO 1000 PUTS **FINAL** [0 failures], 154.4/s
swift-bench 2016-06-18 01:50:51,560 INFO Auth version: 1.0
swift-bench 2016-06-18 01:51:21,069 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 01:51:21,069 INFO Auth version: 1.0
swift-bench 2016-06-18 01:51:23,104 INFO 489 DEL [0 failures], 242.5/s
swift-bench 2016-06-18 01:51:26,003 INFO 1000 DEL **FINAL** [0 failures], 203.4/s
swift-bench 2016-06-18 01:51:26,003 INFO Auth version: 1.0
```

------------------------ Test 4 ------------------------
```
swift-bench 2016-06-18 01:50:01,446 INFO Auth version: 1.0
swift-bench 2016-06-18 01:50:03,381 INFO Auth version: 1.0
swift-bench 2016-06-18 01:50:05,397 INFO 477 PUTS [0 failures], 238.0/s
swift-bench 2016-06-18 01:50:09,592 INFO 1000 PUTS **FINAL** [0 failures], 161.3/s
swift-bench 2016-06-18 01:50:09,592 INFO Auth version: 1.0
swift-bench 2016-06-18 01:50:39,269 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 01:50:39,269 INFO Auth version: 1.0
swift-bench 2016-06-18 01:50:41,296 INFO 567 DEL [0 failures], 283.0/s
swift-bench 2016-06-18 01:50:43,566 INFO 1000 DEL **FINAL** [0 failures], 234.0/s
swift-bench 2016-06-18 01:50:43,566 INFO Auth version: 1.0
```

------------------------ Test 5 ------------------------
```
swift-bench 2016-06-18 01:49:18,362 INFO Auth version: 1.0
swift-bench 2016-06-18 01:49:19,687 INFO Auth version: 1.0
swift-bench 2016-06-18 01:49:21,702 INFO 398 PUTS [0 failures], 198.7/s
swift-bench 2016-06-18 01:49:27,813 INFO 1000 PUTS **FINAL** [0 failures], 123.3/s
swift-bench 2016-06-18 01:49:27,813 INFO Auth version: 1.0
swift-bench 2016-06-18 01:49:55,801 INFO 100 GETS **FINAL** [0 failures], 3.6/s
swift-bench 2016-06-18 01:49:55,801 INFO Auth version: 1.0
swift-bench 2016-06-18 01:49:57,865 INFO 381 DEL [0 failures], 190.4/s
swift-bench 2016-06-18 01:50:00,546 INFO 1000 DEL **FINAL** [0 failures], 213.6/s
swift-bench 2016-06-18 01:50:00,546 INFO Auth version: 1.0
```

## 40960 bytes 100 object 100 get
------------------------ Test 1 ------------------------
```
swift-bench 2016-06-18 01:59:17,957 INFO Auth version: 1.0
swift-bench 2016-06-18 01:59:19,061 INFO Auth version: 1.0
swift-bench 2016-06-18 01:59:19,730 INFO 100 PUTS **FINAL** [0 failures], 152.5/s
swift-bench 2016-06-18 01:59:19,731 INFO Auth version: 1.0
swift-bench 2016-06-18 01:59:49,365 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 01:59:49,366 INFO Auth version: 1.0
swift-bench 2016-06-18 01:59:49,979 INFO 100 DEL **FINAL** [0 failures], 167.5/s
swift-bench 2016-06-18 01:59:49,979 INFO Auth version: 1.0
```

------------------------ Test 2 ------------------------
```
swift-bench 2016-06-18 01:58:16,292 INFO Auth version: 1.0
swift-bench 2016-06-18 01:58:17,384 INFO Auth version: 1.0
swift-bench 2016-06-18 01:58:17,771 INFO 100 PUTS **FINAL** [0 failures], 268.0/s
swift-bench 2016-06-18 01:58:17,771 INFO Auth version: 1.0
swift-bench 2016-06-18 01:58:47,643 INFO 100 GETS **FINAL** [0 failures], 3.3/s
swift-bench 2016-06-18 01:58:47,643 INFO Auth version: 1.0
swift-bench 2016-06-18 01:58:48,156 INFO 100 DEL **FINAL** [0 failures], 199.2/s
swift-bench 2016-06-18 01:58:48,157 INFO Auth version: 1.0
```

------------------------ Test 3 ------------------------
```
swift-bench 2016-06-18 01:57:14,505 INFO Auth version: 1.0
swift-bench 2016-06-18 01:57:15,701 INFO Auth version: 1.0
swift-bench 2016-06-18 01:57:16,082 INFO 100 PUTS **FINAL** [0 failures], 271.8/s
swift-bench 2016-06-18 01:57:16,082 INFO Auth version: 1.0
swift-bench 2016-06-18 01:57:45,970 INFO 100 GETS **FINAL** [0 failures], 3.3/s
swift-bench 2016-06-18 01:57:45,970 INFO Auth version: 1.0
swift-bench 2016-06-18 01:57:46,619 INFO 100 DEL **FINAL** [0 failures], 158.4/s
swift-bench 2016-06-18 01:57:46,619 INFO Auth version: 1.0
```

------------------------ Test 4 ------------------------
```
swift-bench 2016-06-18 01:56:12,777 INFO Auth version: 1.0
swift-bench 2016-06-18 01:56:13,939 INFO Auth version: 1.0
swift-bench 2016-06-18 01:56:14,255 INFO 100 PUTS **FINAL** [0 failures], 329.8/s
swift-bench 2016-06-18 01:56:14,255 INFO Auth version: 1.0
swift-bench 2016-06-18 01:56:44,192 INFO 100 GETS **FINAL** [0 failures], 3.3/s
swift-bench 2016-06-18 01:56:44,192 INFO Auth version: 1.0
swift-bench 2016-06-18 01:56:44,655 INFO 100 DEL **FINAL** [0 failures], 224.1/s
swift-bench 2016-06-18 01:56:44,655 INFO Auth version: 1.0
```

------------------------ Test 5 ------------------------
```
swift-bench 2016-06-18 01:55:10,979 INFO Auth version: 1.0
swift-bench 2016-06-18 01:55:12,136 INFO Auth version: 1.0
swift-bench 2016-06-18 01:55:12,771 INFO 100 PUTS **FINAL** [0 failures], 160.9/s
swift-bench 2016-06-18 01:55:12,772 INFO Auth version: 1.0
swift-bench 2016-06-18 01:55:42,405 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 01:55:42,405 INFO Auth version: 1.0
swift-bench 2016-06-18 01:55:43,065 INFO 100 DEL **FINAL** [0 failures], 155.2/s
swift-bench 2016-06-18 01:55:43,065 INFO Auth version: 1.0
```

## 40960 bytes 500 object 100 get
------------------------ Test 1 ------------------------
```
swift-bench 2016-06-18 02:03:30,859 INFO Auth version: 1.0
swift-bench 2016-06-18 02:03:32,494 INFO Auth version: 1.0
swift-bench 2016-06-18 02:03:35,639 INFO 500 PUTS **FINAL** [0 failures], 159.6/s
swift-bench 2016-06-18 02:03:35,639 INFO Auth version: 1.0
swift-bench 2016-06-18 02:04:04,390 INFO 100 GETS **FINAL** [0 failures], 3.5/s
swift-bench 2016-06-18 02:04:04,390 INFO Auth version: 1.0
swift-bench 2016-06-18 02:04:07,019 INFO 500 DEL **FINAL** [0 failures], 191.5/s
swift-bench 2016-06-18 02:04:07,019 INFO Auth version: 1.0
```

------------------------ Test 2 ------------------------
```
swift-bench 2016-06-18 02:02:53,335 INFO Auth version: 1.0
swift-bench 2016-06-18 02:02:54,579 INFO Auth version: 1.0
swift-bench 2016-06-18 02:02:56,603 INFO 269 PUTS [0 failures], 133.9/s
swift-bench 2016-06-18 02:02:57,889 INFO 500 PUTS **FINAL** [0 failures], 151.7/s
swift-bench 2016-06-18 02:02:57,889 INFO Auth version: 1.0
swift-bench 2016-06-18 02:03:27,699 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 02:03:27,699 INFO Auth version: 1.0
swift-bench 2016-06-18 02:03:30,355 INFO 500 DEL **FINAL** [0 failures], 189.3/s
swift-bench 2016-06-18 02:03:30,355 INFO Auth version: 1.0
```

------------------------ Test 3 ------------------------
```
swift-bench 2016-06-18 02:02:16,916 INFO Auth version: 1.0
swift-bench 2016-06-18 02:02:18,312 INFO Auth version: 1.0
swift-bench 2016-06-18 02:02:20,909 INFO 500 PUTS **FINAL** [0 failures], 193.8/s
swift-bench 2016-06-18 02:02:20,909 INFO Auth version: 1.0
swift-bench 2016-06-18 02:02:50,514 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 02:02:50,515 INFO Auth version: 1.0
swift-bench 2016-06-18 02:02:52,437 INFO 500 DEL **FINAL** [0 failures], 262.2/s
swift-bench 2016-06-18 02:02:52,437 INFO Auth version: 1.0
```

------------------------ Test 4 ------------------------
```
swift-bench 2016-06-18 02:01:39,821 INFO Auth version: 1.0
swift-bench 2016-06-18 02:01:41,142 INFO Auth version: 1.0
swift-bench 2016-06-18 02:01:43,158 INFO 366 PUTS [0 failures], 182.9/s
swift-bench 2016-06-18 02:01:44,409 INFO 500 PUTS **FINAL** [0 failures], 153.7/s
swift-bench 2016-06-18 02:01:44,409 INFO Auth version: 1.0
swift-bench 2016-06-18 02:02:13,488 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 02:02:13,488 INFO Auth version: 1.0
swift-bench 2016-06-18 02:02:15,533 INFO 415 DEL [0 failures], 204.6/s
swift-bench 2016-06-18 02:02:16,284 INFO 500 DEL **FINAL** [0 failures], 179.9/s
swift-bench 2016-06-18 02:02:16,284 INFO Auth version: 1.0
```

------------------------ Test 5 ------------------------
```
swift-bench 2016-06-18 02:01:02,789 INFO Auth version: 1.0
swift-bench 2016-06-18 02:01:04,336 INFO Auth version: 1.0
swift-bench 2016-06-18 02:01:07,065 INFO 500 PUTS **FINAL** [0 failures], 184.2/s
swift-bench 2016-06-18 02:01:07,065 INFO Auth version: 1.0
swift-bench 2016-06-18 02:01:36,771 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 02:01:36,771 INFO Auth version: 1.0
swift-bench 2016-06-18 02:01:39,044 INFO 500 DEL **FINAL** [0 failures], 221.4/s
swift-bench 2016-06-18 02:01:39,044 INFO Auth version: 1.0
```

## 40960 bytes 1000 object 100 get
------------------------ Test 1 ------------------------
```
swift-bench 2016-06-18 02:11:00,241 INFO Auth version: 1.0
swift-bench 2016-06-18 02:11:01,645 INFO Auth version: 1.0
swift-bench 2016-06-18 02:11:03,670 INFO 329 PUTS [0 failures], 163.7/s
swift-bench 2016-06-18 02:11:09,708 INFO 1000 PUTS **FINAL** [0 failures], 124.3/s
swift-bench 2016-06-18 02:11:09,709 INFO Auth version: 1.0
swift-bench 2016-06-18 02:11:37,073 INFO 100 GETS **FINAL** [0 failures], 3.7/s
swift-bench 2016-06-18 02:11:37,074 INFO Auth version: 1.0
swift-bench 2016-06-18 02:11:39,104 INFO 439 DEL [0 failures], 219.0/s
swift-bench 2016-06-18 02:11:41,694 INFO 1000 DEL **FINAL** [0 failures], 217.7/s
swift-bench 2016-06-18 02:11:41,694 INFO Auth version: 1.0
```

------------------------ Test 2 ------------------------
```
swift-bench 2016-06-18 02:10:16,904 INFO Auth version: 1.0
swift-bench 2016-06-18 02:10:18,183 INFO Auth version: 1.0
swift-bench 2016-06-18 02:10:20,201 INFO 495 PUTS [0 failures], 247.0/s
swift-bench 2016-06-18 02:10:24,624 INFO 1000 PUTS **FINAL** [0 failures], 155.6/s
swift-bench 2016-06-18 02:10:24,624 INFO Auth version: 1.0
swift-bench 2016-06-18 02:10:54,209 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 02:10:54,210 INFO Auth version: 1.0
swift-bench 2016-06-18 02:10:56,225 INFO 526 DEL [0 failures], 263.0/s
swift-bench 2016-06-18 02:10:59,425 INFO 1000 DEL **FINAL** [0 failures], 192.3/s
swift-bench 2016-06-18 02:10:59,425 INFO Auth version: 1.0
```

------------------------ Test 3 ------------------------
```
swift-bench 2016-06-18 02:09:09,444 INFO Auth version: 1.0
swift-bench 2016-06-18 02:09:10,384 INFO Auth version: 1.0
swift-bench 2016-06-18 02:09:12,407 INFO 402 PUTS [0 failures], 200.1/s
swift-bench 2016-06-18 02:09:17,275 INFO 1000 PUTS **FINAL** [0 failures], 145.4/s
swift-bench 2016-06-18 02:09:17,276 INFO Auth version: 1.0
swift-bench 2016-06-18 02:09:46,798 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 02:09:46,798 INFO Auth version: 1.0
swift-bench 2016-06-18 02:09:48,817 INFO 587 DEL [0 failures], 293.0/s
swift-bench 2016-06-18 02:09:50,079 INFO 1000 DEL **FINAL** [0 failures], 306.2/s
swift-bench 2016-06-18 02:09:50,079 INFO Auth version: 1.0
```

------------------------ Test 4 ------------------------
```
swift-bench 2016-06-18 02:08:00,885 INFO Auth version: 1.0
swift-bench 2016-06-18 02:08:01,773 INFO Auth version: 1.0
swift-bench 2016-06-18 02:08:03,785 INFO 377 PUTS [0 failures], 188.5/s
swift-bench 2016-06-18 02:08:09,415 INFO 1000 PUTS **FINAL** [0 failures], 131.1/s
swift-bench 2016-06-18 02:08:09,415 INFO Auth version: 1.0
swift-bench 2016-06-18 02:08:39,187 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 02:08:39,187 INFO Auth version: 1.0
swift-bench 2016-06-18 02:08:41,204 INFO 496 DEL [0 failures], 247.7/s
swift-bench 2016-06-18 02:08:43,523 INFO 1000 DEL **FINAL** [0 failures], 231.4/s
swift-bench 2016-06-18 02:08:43,523 INFO Auth version: 1.0
```

------------------------ Test 5 ------------------------
```
swift-bench 2016-06-18 02:06:53,463 INFO Auth version: 1.0
swift-bench 2016-06-18 02:06:54,821 INFO Auth version: 1.0
swift-bench 2016-06-18 02:06:56,861 INFO 452 PUTS [0 failures], 223.0/s
swift-bench 2016-06-18 02:07:00,765 INFO 1000 PUTS **FINAL** [0 failures], 168.6/s
swift-bench 2016-06-18 02:07:00,766 INFO Auth version: 1.0
swift-bench 2016-06-18 02:07:30,570 INFO 100 GETS **FINAL** [0 failures], 3.4/s
swift-bench 2016-06-18 02:07:30,570 INFO Auth version: 1.0
swift-bench 2016-06-18 02:07:32,586 INFO 574 DEL [0 failures], 286.8/s
swift-bench 2016-06-18 02:07:34,947 INFO 1000 DEL **FINAL** [0 failures], 229.3/s
swift-bench 2016-06-18 02:07:34,947 INFO Auth version: 1.0
```
