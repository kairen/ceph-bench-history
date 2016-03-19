# Ceph Bench
主要整理自己測試用的相關資料，方便之後重複利用。目前測試環境為以下幾個項目。

#### SSD Nodes
本 OSD 節點採用兩個固態硬碟給 OSD daemon 使用，其中固態硬碟採用```Intel 535系列 120GB 2.5吋 7mm```：
```sh
+-------+----------+       +--------+---------+       
| [ 固態硬碟(SSD)]  |       |  [ 固態硬碟(SSD)]  |       
|  System   disk   +-------+  System   disk   +
|    (/dev/sdb)    |       |    (/dev/sdc)    |
+------------------+       +------------------+
```

#### HDD Nodes
本 HDD 節點採用兩個傳統硬碟給 OSD daemon 使用，其中傳統硬碟採用```WD 1TB 3.5吋 SATAIII 硬碟(WD10EZEX)```：
```sh
+-------+----------+       +--------+---------+       
| [ 傳統硬碟(HDD)]  |       |  [ 傳統硬碟(HDD)]  |       
|  System   disk   +-------+  System   disk   +
|    (/dev/sdb)    |       |    (/dev/sdc)    |
+------------------+       +------------------+
```

#### Hybrid Nodes
本 Hybrid 節點採用固態硬碟與傳統硬碟各一顆，並使用一些快取工具製作快取儲存給 OSD daemon 使用，其中固態硬碟採用```Intel 535系列 120GB 2.5吋 7mm ```，傳統硬碟採用```WD 1TB 3.5吋 SATAIII 硬碟(WD10EZEX)```：
```sh
              +--------+---------+     
              | [ 快取層(Cache)]  |      
              |  System   disk   +
              |   (/dev/cache)   |
              +--------+---------+
                       |
        +--------------+------------+
        |                           |          
+-------+----------+       +--------+---------+       
| [ 固態硬碟(SSD)]  |       |  [ 傳統硬碟(HDD)]  |       
|  System   disk   +-------+  System   disk   +
|    (/dev/sdb)    |       |    (/dev/sdc)    |
+------------------+       +------------------+
```


# 參考資源整理
* [Ceph: How to Test if Your SSD Is Suitable as a Journal Device?](http://www.sebastien-han.fr/blog/2014/10/10/ceph-how-to-test-if-your-ssd-is-suitable-as-a-journal-device/)
* []
