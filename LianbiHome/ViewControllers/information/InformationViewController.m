//
//  InformationViewController.m
//  LianbiHome
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 LianbiHome. All rights reserved.
//

#import "InformationViewController.h"
#import "DWSearchBarView.h"
#import "ShufflingView.h"
#import "InformationView.h"



@interface InformationViewController () <DWSearchBarViewDelegate,UIScrollViewDelegate>
{
    ShufflingView * _ffilingView;
    InformationView * _informationView;

}

@property(nonatomic,retain)NSMutableArray * arrayDatas1;

@property(nonatomic,retain)NSMutableArray * arrayDatas2;

@property(nonatomic,retain)UIScrollView * downScrollView;

@property(nonatomic,retain)UIScrollView * downScrollView1;

@property(nonatomic,retain)UIScrollView * downScrollView11;

@property(nonatomic,retain)UIScrollView * downScrollView12;
@end


@implementation InformationViewController




-(void)createView
{
    UIScrollView * scrollView = JnScrollView(CGRectMake(0, self.nav_h, SCREEN_WIDTH, SCREEN_HEIGHT - self.nav_h), COLOR_WHITE);
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    self.downScrollView = scrollView;


    UIView * hearView = JnUIView(CGRectMake(0, 0, SCREEN_WIDTH, JN_HH(170)), COLOR_B5);
    _ffilingView = [[ShufflingView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, JN_HH(170)) BgColor:COLOR_WHITE];
    [hearView addSubview:_ffilingView];

    InformationView * inforMarinView = [[InformationView alloc]initWithFrame:CGRectMake(0, JN_HH(170), SCREEN_WIDTH, JN_HH(60))];
    [hearView addSubview:inforMarinView];
    [self.downScrollView addSubview:hearView];

    UIScrollView * scrollView1 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, hearView.height, SCREEN_WIDTH * 2, self.downScrollView.height - hearView.height)];
    [self.downScrollView addSubview:scrollView1];
    self.downScrollView1 = scrollView1;

    self.downScrollView11 = JnScrollView(CGRectMake(0, 0, SCREEN_WIDTH, scrollView1.height), COLOR_WHITE);
    self.downScrollView11.delegate = self;
    self.downScrollView11.backgroundColor = [UIColor greenColor];
    [self.downScrollView1 addSubview: self.downScrollView11];

    self.downScrollView12 = JnScrollView(CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, scrollView1.height), COLOR_WHITE);
    self.downScrollView12.delegate = self;
    self.downScrollView12.backgroundColor = [UIColor redColor];
    [self.downScrollView12 addSubview: self.downScrollView12];


}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.downScrollView) {

    }else if(scrollView == self.downScrollView1)
    {

    }else if(scrollView == self.downScrollView11)
    {

    }else if(scrollView == self.downScrollView12)
    {

    }
}

-(void)load
{

}
-(void)downData
{

    [self getDownDatas:@"home/App/zx_list" withdict:@{} index:1 type:0];
}

-(void)readDowndatawithResponseDict:(NSDictionary *)responseDict index:(int)index
{
    if (index == 1) {
        NSArray * array = responseDict[@"pic"];
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
