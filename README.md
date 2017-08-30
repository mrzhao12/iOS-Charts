# iOS-Charts
iOS-Charts集成和使用

iOS图表库Charts集成与使用(cocosPod版方法集成)
http://www.jianshu.com/p/cc3b600dded3

Charts是一个很优秀的图表库，它支持Android、iOS、tvOS和macOS，这样使用起来，可以节省学习成本，可以从GitHub上了解更多信息。本文记录在iOS项目上的集成与使用。

Charts目前版本是3.0.1，要求使用xcode8和swift3.0，最低支持iOS8.0，如果需要使用2.3.0版本的，需要在xcode8设置使用swift2.3版本的编译器，但是，苹果估计迟早会在后面版本移除2.3版本的支持吧，从Swift发布开始就一路使用过来的同学体会应该很深，每次升级xcode，就要改一次swift代码，感觉掉进了无底深坑有木有~所以，这里就使用3.0.1版本的吧！

iOS-Charts,github链接https://github.com/danielgindi/Charts,这个开源库是用Swift实现的，作者相当🐂，这个项目有n+1个Star,Android也有他写的相应开源库：MPAndroidChart。 本博客原文地址http://lvesli.com/2016/06/06/iOS-Charts/

今天来介绍用cocospod集成Charts，之前查了一下，很多网友反应pod集成失败（后面的打包也失败（最好关掉bitcode）），

1.首先在桌面新建一个文件夹ttcharts


ttcharts
2.然后打开x-code，我的8.3.3版本


8.3.3版本
3.在x-code里新建工程（ttchartspod），保存到桌面的ttcharts文件夹下

4.关闭x-code，打开终端，进行pod的安装工程，

sjhzdeMacBook-Air:desktop zhaotong$ mkdir ttcharts的意思就是在桌面建立一个ttcharts的文件夹


终端
这里的Podfile书写一定要注意：


Podfile
platform :ios,'8.0'

target 'ttchartspod' do

pod 'ZBarSDK', '~> 1.3.1'

use_frameworks!

pod 'Charts'

end

在这里我们使用了两个第三方库，一个ZBarSDK,这是一个二维码扫描库，然后就是我们的重点Charts库文件。特别要注意语法的顺序，不同的顺序会造成不同的结果，因为有的第三方库需要我们指定target，有的第三方库是不需要的，比如说SDWebImage,在以前我们使用的时候可以直接这么写

ZBarSDK并不需要指定使用frameworks，但是本次使用Charts的时候，我们还需要使用本框架，所以我们也要指定使用框架（就是添加了use_frameworks!），

5.打开ttchartspod.xcworkspace工程会出现：

Xcode 8 Convert to Current Swift Syntax，点击cor，下一步更新swift库，和Charts库

若是出错可以参考：http://www.zhimengzhe.com/bianchengjiaocheng/swift/133658.html

6.然后编译成功，在ViewController里添加@import Charts;



demo：https://github.com/mrzhao12/iOS-Charts

若是想手工导入可以参考：

iOS在OC项目中集成Charts绘制图表框架（手工版）


