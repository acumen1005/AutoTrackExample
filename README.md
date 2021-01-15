
# AutoTrack

无痕埋点的简单 Demo

三个问题需要解决：

1. 如何尽量不侵入业务代码？ 

主要通过 Method Swizzling 替换方法和 isa Swizzling 处理 cell 的点击事件，或者一些 AOP 的库也可以只使用

2. 如何确定视图路径的唯一性？

目前的方法是通过增加视图控件的分类（autoTrackReferer 该属性为页面的路径标示），这部分需要结合一些业务场景，广告位的 id 等等。通过 superView / nextResponse 等方法遍历出视图结构。

3. 业务相关的数据维护

在业务埋点数据增加（帖子feedID，阅读数等等），可以通过链式的调用的方法来维护。如果通过 NSDictionary 字段硬编码比较容易出错；通过方法参数约束字段，ObjC 方法不支持参数默认值，且参数过多不够优雅。

