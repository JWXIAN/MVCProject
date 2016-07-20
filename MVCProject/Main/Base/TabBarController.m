//
//  TabBarController.m
//  MVCProject
//
//  Created by GJW on 16/7/20.
//  Copyright © 2016年 JW. All rights reserved.
//

#import "TabBarController.h"
#import "NavigationController.h"
#import "HomeVC.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *imageArr = @[@"主页", @"信息", @"搜索", @"个人"];
    for (int i=0; i<imageArr.count; i++) {
        HomeVC *vc = [HomeVC new];
        [self addChildVc:vc title:nil image:imageArr[i] selectedImage:[imageArr[i] stringByAppendingString:@"_select"]];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    // 设置子控制器的图片JWColor(36, 107, 246)
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置文字的样式
//    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
//    textAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
//    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    //选中颜色
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    //默认不显示文件 - 图片居中
    CGFloat offset = 5.0;
    childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
    // 先给外面传进来的小控制器 包装 一个导航控制器
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
}
@end
