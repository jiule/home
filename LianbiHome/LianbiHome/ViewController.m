//
//  ViewController.m
//  LianbiHome
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 LianbiHome. All rights reserved.
//

#import "ViewController.h"
#import "DWSearchBarView.h"
#import "DwTableView.h"

@interface ViewController () <DWSearchBarViewDelegate,DwTableViewDelegate,DwTableViewCellDelegate>

@property(nonatomic,retain)DwTableView * tableView;

@end

@implementation ViewController

-(void)createView
{
    DwTableView * tableView = [DwTableView initWithFrame:CGRectMake(0, self.nav_h, SCREEN_WIDTH, SCREEN_HEIGHT - self.nav_h) url:URL(@"s=home/App/zx_list") modelName:@"" cellName:@"" delegate:self];
    [self.view addSubview:[tableView readTableView]];
}


-(void)downWithPage:(int)page
{
     
}


@end
