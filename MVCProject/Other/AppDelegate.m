//
//  AppDelegate.m
//  MVCProject
//
//  Created by GJW on 16/7/20.
//  Copyright © 2016年 JW. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import "JWLaunchAd.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initProject];
    return YES;
}

- (void)initProject{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [TabBarController new];
    [self.window makeKeyAndVisible];
    //启动页广告
    [self launchAd];
}

#pragma mark - 启动页广告
- (void)launchAd{
    //1.设置启动页广告图片的url
    NSString *imgUrlString =@"http://imgstore.cdn.sogou.com/app/a/100540002/714860.jpg";
    //2.初始化启动页广告(初始化后,自动添加至视图,不用手动添加)
    [JWLaunchAd initImageWithAttribute:5.0 hideSkip:NO setLaunchAd:^(JWLaunchAd *launchAd) {
        __block JWLaunchAd *weakSelf = launchAd;
        [launchAd setWebImageWithURL:imgUrlString options:JWWebImageDefault result:^(UIImage *image, NSURL *url) {
            //3.异步加载图片完成回调(设置图片尺寸)
            weakSelf.adFrame = CGRectMake(0, 0, kScreen_Width, kScreen_Height-150);
        } adClickBlock:^{
            //4.点击广告回调
            NSString *url = @"https://www.baidu.com";
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
        }];
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
