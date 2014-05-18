//
//  MFAppDelegate.h
//  PasswordBook
//
//  Created by js on 14-5-18.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MFLetMenuViewController;
@class MFBaseViewController;
@interface MFAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/* 最下面的容器视图 */
@property (strong, nonatomic) UIViewController *rootViewController;

/* 菜单导航视图 */
@property (strong, nonatomic) MFLetMenuViewController *leftMenuViewController;

/* 右边的窗口  */
//@property (strong, nonatomic) MFBaseViewController * contentViewController;

@property (strong, nonatomic) UINavigationController *contentNavController;
@end
