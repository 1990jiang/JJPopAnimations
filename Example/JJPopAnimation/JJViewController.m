//
//  JJViewController.m
//  JJPopAnimation
//
//  Created by 1990jiang on 03/23/2017.
//  Copyright (c) 2017 1990jiang. All rights reserved.
//

#import "JJViewController.h"
#import "JJTestViewController.h"
#import "PopoverAnimator.h"


@interface JJViewController ()
/**测试btn*/
@property (nonatomic , strong) UIButton *testBtn;

/**弹出框架*/
@property (nonatomic , strong) PopoverAnimator *popoverAnimator;
@end

@implementation JJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.testBtn setTitle:@"弹出视图" forState:UIControlStateNormal];
    self.testBtn.frame = CGRectMake(0, 0, 100, 100);
    self.testBtn.center = CGPointMake(self.view.center.x, self.view.center.y);
    [self.testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.testBtn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.testBtn];
    
}

//点击事件
-(void)clickBtn{
    //1.创建弹出控制器
    JJTestViewController *popover = [[JJTestViewController alloc]init];
    
    //2. 设置modal样式--因为不设置的话会造成popoverVc弹出的时候，打底的首页和tabBarVc全部被移除掉了，而我的popoverVc不是遮住整个屏幕的，所以不能让底部的控制器移除掉了
    popover.modalPresentationStyle = UIModalPresentationCustom; //设置成这个就不会移除了
    
    //3.设置转场代理
    
    self.popoverAnimator = [[PopoverAnimator alloc]init];
    self.popoverAnimator.timeAnimator = 0.8;
    self.popoverAnimator.popAnchorPoint = CGPointMake(0.5, 0);
    
    
    
    popover.transitioningDelegate = self.popoverAnimator;
   //4.弹出控制器
    [self presentViewController:popover animated:YES completion:nil];
    
    
}


    
    

























- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
