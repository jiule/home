//
//  InformationViewController.m
//  LianbiHome
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 LianbiHome. All rights reserved.
//

#import "InformationViewController.h"
#import "DWSearchBarView.h"
#import "DwTableView.h"
#import "ShufflingView.h"
#import "InformationView.h"



@interface InformationViewController () <DWSearchBarViewDelegate,DwTableViewDelegate,DwTableViewCellDelegate>
{
    ShufflingView * _ffilingView;
    InformationView * _informationView;
}


@property(nonatomic,retain)DwTableView * tableView;
@end

@implementation InformationViewController




-(void)createView
{
    UIView * hearView = JnUIView(CGRectMake(0, 0, SCREEN_WIDTH, JN_HH(170)), COLOR_B5);
    _ffilingView = [[ShufflingView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, JN_HH(170)) BgColor:COLOR_WHITE];
    [hearView addSubview:_ffilingView];

    InformationView * inforMarinView = [[InformationView alloc]initWithFrame:CGRectMake(0, JN_HH(170), SCREEN_WIDTH, JN_HH(60))];
    [hearView addSubview:inforMarinView];


    DwTableView * tableView = [DwTableView initWithFrame:CGRectMake(0, self.nav_h, SCREEN_WIDTH, SCREEN_HEIGHT - self.nav_h) url:URL(@"home/App/zx_list") modelName:@"InformationModel" cellName:@"InformationCell" delegate:self];
    tableView.is_up = NO;
    tableView.data1 = @"list";
    tableView.is_data = YES;
    [tableView setTableViewHearView:hearView];
    [self.view addSubview:[tableView readTableView]];

    self.tableView = tableView;
}

-(void)downData
{
    [self downWithPage:0];
  //  [self postdownDatas:@"s=home/App/zx_list" adddict:@{} index:1];
   // [self getDownDatas:@"home/App/zx_list" withdict:@{} index:502 type:0];
}

-(void)readDowndatawithResponseDict:(NSDictionary *)responseDict index:(int)index
{
    NSLog(@"%@",responseDict);
}


-(void)downWithPage:(int)page
{
    [self.tableView downWithdict:@{} index:0];
}
-(void)DwtableView:(DwTableView *)tableView downDatasWithDict:(NSDictionary *)dict index:(int)index
{
    NSLog(@"%@",dict[@"data"]);

    if (index == 0) {
        NSDictionary * dict1 = dict[@"data"];
        NSArray * array = dict1[@"pic"];
        NSMutableArray * ffilingArray = [NSMutableArray array];
        for ( int i = 0 ; i < array.count; i++) {
            NSDictionary * arrayDict = array[i];
            [ffilingArray addObject:TUPIANURL(arrayDict[@"image"])];
        }
        [_ffilingView showWithImageUrlPaths:ffilingArray didShuffling:^(ShufflingView *shufflingView, int index) {

        }];
    }
}


@end
