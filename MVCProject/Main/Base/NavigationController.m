//
//  NavigationController.m
//  MVCProject
//
//  Created by GJW on 16/7/20.
//  Copyright © 2016年 JW. All rights reserved.
//
//  Github:https://github.com/JWXIAN/MVCProject
//

#import "NavigationController.h"

@interface NavigationController ()
@end

#define kBarTintColor   [UIColor whiteColor]    //导航背景色
#define kTintColor      [UIColor grayColor]    //字体颜色
#define kTitleColor     [UIColor whiteColor]    //按钮颜色
#define kBarItemTextColor  [UIColor whiteColor] //字体颜色
#define kBarItemTextFont   13                   //字体大小
@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = kBarTintColor;
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = kTitleColor;
    self.navigationBar.titleTextAttributes = textAttrs;
    self.navigationBar.tintColor = kTintColor;
    //导航栏的背景色是黑色, 字体为白色
    self.navigationBar.barStyle = UIBarStyleDefault;
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
    textAttrs[NSForegroundColorAttributeName] = kBarItemTextColor;
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:kBarItemTextFont];
    [item setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    // 设置不可用状态
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = kBarItemTextColor;
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:kBarItemTextFont];
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
