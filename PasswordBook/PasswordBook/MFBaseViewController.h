//
//  MFBaseViewController.h
//  PasswordBook
//  中间内容窗口的基视图
//  Created by js on 14-5-18.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, SlideSide)
{
    SlideSideDefault = 0,
    SlideSideLeft, /* 向左滑动 */
    SlideSideRight,/* 向右滑动 */
};
@interface MFBaseViewController : UIViewController

@end
