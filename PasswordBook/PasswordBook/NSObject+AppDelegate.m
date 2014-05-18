//
//  NSObject+AppDelegate.m
//  PasswordBook
//
//  Created by js on 14-5-18.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "NSObject+AppDelegate.h"
#import "MFLetMenuViewController.h"
#import "MFBaseViewController.h"
#import "MFAppDelegate.h"
@implementation NSObject (AppDelegate)

- (MFAppDelegate *)appDelegate
{
    return (MFAppDelegate *)[UIApplication sharedApplication].delegate;
}
- (MFLetMenuViewController *)leftMenuViewController
{
    return self.appDelegate.leftMenuViewController;
}

- (UINavigationController *)leftNavController
{
    return self.leftMenuViewController.navigationController;
}
- (UINavigationController *)contentNavController
{
    return self.appDelegate.contentNavController;
}

- (UIViewController *)rootViewController
{
    return self.appDelegate.rootViewController;
}
@end
