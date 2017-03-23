//
//  PopoverAnimator.m
//  (2017-3-18)自定义弹出视图
//
//  Created by 蒋俊 on 17/3/17.
//  Copyright © 2017年 蒋俊. All rights reserved.
//

#import "PopoverAnimator.h"
#import "JJPresentationController.h"


@implementation PopoverAnimator

#pragma mark -- 代理方法

-(UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source{
    
    JJPresentationController *presentVc = [[JJPresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    
    return presentVc;
    
}


#pragma mark -- 自定义弹出动画
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    self.isPresented = YES;
    //返回值是转场动画协议，我们直接返回就好
    return self;
    
}

#pragma mark -- 自定义消失动画
-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    self.isPresented = NO;
    return self;
}

// MARK:- 自定义弹出动画遵守的协议(报错是因为这个协议里面有必须实现的方法)
#pragma mark -- UIViewControllerAnimatedTransitioning 实现这个协议的代理方法
//返回动画时间
-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    return  self.timeAnimator;
    
}

///transitionContext:转场上下文:可以获得弹出的view和消失的view
-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //三目运算
    self.isPresented ? [self animationForPresentedView:transitionContext] : [self animationToPresentedView:transitionContext];
    
    
}

#pragma mark -- 自定义弹出动画
-(void)animationForPresentedView:(id<UIViewControllerContextTransitioning>)transitionContext{
    //1.获取弹出的view
    //UITransitionContextFromViewKey:消失的view
    //UITransitionContextToViewKey:弹出的view
    UIView *presentedView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    //2.将弹出的view添加到containerView中
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:presentedView];
    
    //3.执行我们自定义的动画--将弹出视图的高度隐藏
    presentedView.transform = CGAffineTransformMakeScale(1.0, 0);
    
    //转场动画的时间，我们直接调用第一个动画执行时间的方法，获得的返回值就是那个时间了
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        //恢复原有大小
        presentedView.transform = CGAffineTransformIdentity;
        //设置锚点，不然动画不是从上面开始弹出的
        presentedView.layer.anchorPoint = self.popAnchorPoint;
        
    } completion:^(BOOL finished) {
        //必须告诉转场已经完成了自定义动画
        [transitionContext completeTransition:YES];
        
    }];
    
}

#pragma mark -- 自定义消失动画
-(void)animationToPresentedView:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //1.获取消失的View
    UIView *dismissView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    //2.执行动画
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        //这里不能把y方向缩放，直接置为0,这样的话会直接消失，效果不好
        dismissView.transform = CGAffineTransformMakeScale(1.0, 0.000001);
        
        
        
    } completion:^(BOOL finished) {
        
        //将消失View从父控件中移除
        [dismissView removeFromSuperview];
        //告诉其转场动画结束
        [transitionContext completeTransition:YES];
        
    }];
    
    
    
}


@end
