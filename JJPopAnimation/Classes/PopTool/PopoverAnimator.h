//
//  PopoverAnimator.h
//  (2017-3-18)自定义弹出视图
//
//  Created by 蒋俊 on 17/3/17.
//  Copyright © 2017年 蒋俊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//遵守协议
@interface PopoverAnimator : NSObject <UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning>



/**记录是弹出还是消失动画*/
@property (nonatomic , assign) BOOL isPresented ;

/**动画时间*/
@property (nonatomic , assign) CGFloat timeAnimator;

/**弹出视图锚点*/
@property (nonatomic , assign) CGPoint popAnchorPoint;


@end
