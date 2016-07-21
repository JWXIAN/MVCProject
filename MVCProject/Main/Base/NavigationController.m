//
//  NavigationController.m
//  MVCProject
//
//  Created by GJW on 16/7/20.
//  Copyright © 2016年 JW. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()
@end

#define kBarTintColor   [UIColor whiteColor]
#define kTintColor      [UIColor blackColor]
#define kTitleColor     [UIColor whiteColor]
#define kItemTextColor  [UIColor blackColor]
#define kItemTextFont   13
@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = kBarTintColor;
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = kTitleColor;
    self.navigationBar.titleTextAttributes = textAttrs;
    self.navigationBar.tintColor = kTintColor;
    //将返回按钮的文字position设置不在屏幕上显示
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
+ (void)initialize{
    // 设置整个项目所有item的主题样式
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = kItemTextColor;
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:kItemTextFont];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = kItemTextColor;
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:kItemTextFont];
    [item setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
}
/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        //隐藏TabBarItem
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
@end
