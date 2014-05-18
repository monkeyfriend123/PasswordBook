//
//  NSObject+AppDelegate.h
//  PasswordBook
//
//  Created by js on 14-5-18.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MFLetMenuViewController;
@class MFBaseViewController;
@class MFAppDelegate;
@interface NSObject (AppDelegate)
@property (nonatomic, strong,readonly) MFAppDelegate *appDelegate;
@property (nonatomic , strong)MFLetMenuViewController * leftMenuViewController;
@property (nonatomic, strong)UINavigationController *leftNavController;


@property (nonatomic, strong)UINavigationController *contentNavController;

@property (nonatomic, strong,readonly ) UIViewController *rootViewController;
@end
