//
//  MFLetMenuViewController.m
//  PasswordBook
//
//  Created by js on 14-5-18.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "MFLetMenuViewController.h"
#import "MFAccountListViewController.h"
#import "MFTestViewController.h"
@interface MFLetMenuViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
/* 当前页面对应选择的第几行 */
@property (nonatomic, assign) NSInteger currentIndex;
@end

@implementation MFLetMenuViewController

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
    // Do any additional setup after loading the view from its nib.
    
    UIView *footerView = [[UIView alloc] init];
    footerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableFooterView = footerView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identity = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identity];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identity];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Menu %ld",(long)indexPath.row];
    cell.backgroundColor = [UIColor lightGrayColor];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.currentIndex != indexPath.row) {
        self.currentIndex = indexPath.row;
        for (UIViewController * vc in self.contentNavController.childViewControllers)
        {
            [vc removeFromParentViewController];
        }
        if (indexPath.row == 0) {
            MFAccountListViewController * accountViewController = [[MFAccountListViewController alloc] init];
            [self.contentNavController addChildViewController:accountViewController];
            [self.contentNavController.view addSubview:accountViewController.view];
        }
        else if (indexPath.row == 1)
        {
            MFTestViewController *testVc = [[MFTestViewController alloc] init];
            [self.contentNavController addChildViewController:testVc];
            [self.contentNavController.view addSubview:testVc.view];
        }

    }
    
    CGRect frame = self.contentNavController.view.frame;
    frame.origin = CGPointMake(0, frame.origin.y);
    [UIView animateWithDuration:0.25 animations:^{
        self.contentNavController.view.frame = frame;
    }];
}

@end
