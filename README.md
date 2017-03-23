# JJPopAnimation

[![CI Status](http://img.shields.io/travis/1990jiang/JJPopAnimation.svg?style=flat)](https://travis-ci.org/1990jiang/JJPopAnimation)
[![Version](https://img.shields.io/cocoapods/v/JJPopAnimation.svg?style=flat)](http://cocoapods.org/pods/JJPopAnimation)
[![License](https://img.shields.io/cocoapods/l/JJPopAnimation.svg?style=flat)](http://cocoapods.org/pods/JJPopAnimation)
[![Platform](https://img.shields.io/cocoapods/p/JJPopAnimation.svg?style=flat)](http://cocoapods.org/pods/JJPopAnimation)


## 目录
* [背景介绍](#背景介绍)
* [项目介绍](#项目介绍)
* [使用说明](#使用说明)
  * [获取代码](#获取代码)
  * [开发插件](#开发插件)
  * [使用ShurnimStorage接口](#使用ShurnimStorage接口)
       * [接口介绍](#接口介绍)
       * [使用样例](#使用样例)
* [其他](#其他)


## 背景介绍:
##### 这是我自己上传的第一个开源框架，目前的版本还不适合使用，还有许多地方值得修改
## 使用说明:

###### 使用 pod 'JJPopAnimation'可以直接使用这个框架。 当然你也可以下载框架，然后将JJPopAnimation文件夹拖入工程中
 ```
 导入框架 #import "PopoverAnimator.h"
 //点击事件
-(void)clickBtn{
    //1.创建你需要modal出来的控制器
    JJTestViewController *popover = [[JJTestViewController alloc]init];
    
    //2. 设置modal样式--因为不设置的话会造成popoverVc弹出的时候，打底的首页和tabBarVc全部被移除掉了，而我的popoverVc不是遮住整个屏幕的，所以不能让底部的控制器移除掉了
    popover.modalPresentationStyle = UIModalPresentationCustom; //设置成这个就不会移除了
    
    //3.设置转场代理
  
   self.popoverAnimator = [[PopoverAnimator alloc]init];
   // 设置动画执行时间
   self.popoverAnimator.timeAnimator = 0.8;
   //  设置转场视图的锚点
   self.popoverAnimator.popAnchorPoint = CGPointMake(0.5, 0);
    
    
    //  设置转场协议
    popover.transitioningDelegate = self.popoverAnimator;
   //4.弹出控制器
    [self presentViewController:popover animated:YES completion:nil];
    
    
}

 
 
 ```
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

JJPopAnimation is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JJPopAnimation"
```

## Author

1990jiang, 562752212@qq.com

## License

JJPopAnimation is available under the MIT license. See the LICENSE file for more info.
