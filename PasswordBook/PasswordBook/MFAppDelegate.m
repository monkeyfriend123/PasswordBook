//
//  MFAppDelegate.m
//  PasswordBook
//
//  Created by js on 14-5-18.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "MFAppDelegate.h"
#import "MFLetMenuViewController.h"
#import "MFBaseViewController.h"
#import "MFAccountListViewController.h"
@implementation MFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.rootViewController = [[UIViewController alloc] init];
    self.window.rootViewController = self.rootViewController;
    /* 添加左边的菜单控制器 */
    self.leftMenuViewController  = [[MFLetMenuViewController alloc] init];
    UINavigationController *leftNavController = [[UINavigationController alloc] initWithRootViewController:self.leftMenuViewController];
    [self.rootViewController addChildViewController:leftNavController];
    [self.rootViewController.view addSubview:leftNavController.view];
    
    
    /* 初始化右边的账户列表 */
     MFBaseViewController * contentViewController = [[MFAccountListViewController alloc] init];
    self.contentNavController = [[UINavigationController alloc] initWithRootViewController:contentViewController];
    [self.rootViewController addChildViewController:self.contentNavController];
    [self.rootViewController.view addSubview:self.contentNavController.view];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
