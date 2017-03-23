//
//  JJPresentationController.h
//  (2017-3-18)自定义弹出视图
//
//  Created by 蒋俊 on 17/3/16.
//  Copyright © 2017年 蒋俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJPresentationController : UIPresentationController

/**蒙版View*/
@property (nonatomic , strong) UIView *coverView;

///**弹出控制器的大小*/
//@property (nonatomic , assign) CGRect popViewFrame;



@end
