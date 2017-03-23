//
//  JJPresentationController.m
//  (2017-3-18)自定义弹出视图
//
//  Created by 蒋俊 on 17/3/16.
//  Copyright © 2017年 蒋俊. All rights reserved.
//

#import "JJPresentationController.h"

@implementation JJPresentationController

//Modal出来的控制器实际上都是先加到一个容器上的，我们重写这个即将布局容器的子控制器的方法来控制modal出来的控制器的大小
-(void)containerViewWillLayoutSubviews{
    [super containerViewWillLayoutSubviews];
     //1.拿到被弹出的控制器设置其大小
    self.presentedView.frame = CGRectMake(100, 55, 200, 300);
    self.presentedView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, 55);
    //2.设置蒙版
    [self setupCoverView];
    
    
}

//设置蒙版View
-(void)setupCoverView{
    
    //1.添加蒙版
    //如果用addSubview会将我们弹出控制器的view一并遮住了
    //把coverView添加到容器view的最底层
    
    self.coverView = [[UIView alloc]init];
    [self.containerView insertSubview:self.coverView atIndex:0];
    
    //设置coverView的大小
    self.coverView.frame = self.containerView.bounds;
    self.coverView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    //给coverView添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [self.coverView addGestureRecognizer:tap];
    
    
    
}

#pragma mark -- 点击手势的监听方法
-(void)tapClick:(UITapGestureRecognizer *)tap{
      //直接可以拿到弹出的控制器，然后dismiss就好了
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
   // NSLog(@"点击蒙版了");
}

@end
