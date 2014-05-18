//
//  MFAccountListViewController.m
//  PasswordBook
//
//  Created by js on 14-5-18.
//  Copyright (c) 2014年 monkeyfriendofchina. All rights reserved.
//

#import "MFAccountListViewController.h"

@interface MFAccountListViewController ()<UITableViewDataSource>

@end

@implementation MFAccountListViewController
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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Identity = @"MenuCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identity];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identity];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Account %ld",(long)indexPath.row];
    return cell;
}
@end
