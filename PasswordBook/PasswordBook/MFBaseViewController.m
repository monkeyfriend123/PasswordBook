//
//  MFBaseViewController.m
//  PasswordBook
//
//  Created by js on 14-5-18.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "MFBaseViewController.h"

@interface MFBaseViewController ()
/* 在视图的四分之一拖拽可以移动 */
@property (nonatomic, assign) BOOL canOpen;
@property (nonatomic, assign) SlideSide slideSide;
@end

@implementation MFBaseViewController
- (void)dealloc
{
    
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [self.view addGestureRecognizer:panGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)handlePan:(UIPanGestureRecognizer *)gesture
{
    CGPoint touchPoint = [gesture locationInView:self.rootViewController.view];
    
    CGPoint touchPointInContentView = [gesture locationInView:self.contentNavController.view];
    
    CGFloat screenWidth= [UIScreen mainScreen].bounds.size.width;
    
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            
            if (touchPointInContentView.x < screenWidth /4) {
                self.canOpen = YES;
            }
            else
            {
                self.canOpen = NO;
            }
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            if (self.canOpen) {
                CGPoint translation = [gesture translationInView:self.contentNavController.view];
                if (translation.x > 0)
                {
                    self.slideSide = SlideSideRight;
                    [self slideView:self.navigationController.view slideSide:SlideSideRight toXPosition:touchPoint.x];
                }
                else
                {
                    self.slideSide = SlideSideLeft;
                    [self slideView:self.navigationController.view slideSide:SlideSideLeft toXPosition:touchPoint.x];
                }
            }
            break;
        }
        case UIGestureRecognizerStateEnded:
        {
            if (self.contentNavController.view.frame.origin.x > SlideMenuWidth / 2) {
                [self endSlide:SlideSideRight];
            }
            else
            {
                [self endSlide:SlideSideLeft];
                
            }
            break;
        }
        default:
            break;
    }
}

- (void)slideView:(UIView *)view slideSide:(SlideSide)slideSide toXPosition:(CGFloat)positionX
{
    CGRect frame = view.frame;
    if (slideSide == SlideSideRight) {
        CGFloat x = MIN(SlideMenuWidth, positionX);
        frame.origin = CGPointMake(x, frame.origin.y);
    }
    else if (slideSide == SlideSideLeft)
    {
        CGFloat x = MAX(0, positionX);
        frame.origin = CGPointMake(x, frame.origin.y);
    }
    [UIView animateWithDuration:0.25 animations:^{
        view.frame = frame;
    }];
}
/* 结束的的时候滚动的方向*/
- (void)endSlide:(SlideSide)slideSide
{
    if (slideSide == SlideSideRight) {
        
        [self slideView:self.contentNavController.view slideSide:SlideSideRight toXPosition:SlideMenuWidth];
    
    
    }
    else if (slideSide == SlideSideLeft)
    {
        [self slideView:self.contentNavController.view slideSide:SlideSideLeft toXPosition:0];
        
    }
}
@end
