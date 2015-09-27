//
//  ViewController.m
//  CountDownTimerForTableView
//
//  Created by FrankLiu on 15/9/8.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import "ViewController.h"
#import "CommonMacro.h"
#import "TimeCell.h"
#import "TimeModel.h"
#import "BaseTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView    *m_tableView;
@property (nonatomic, strong) NSArray        *m_dataArray;
@property (nonatomic, strong) NSTimer        *m_timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.m_dataArray = @[[TimeModel timeModelWithTitle:@"Aaron"     time:31],
                         [TimeModel timeModelWithTitle:@"Nicholas"  time:1003],
                         [TimeModel timeModelWithTitle:@"Nathaniel" time:8089],
                         [TimeModel timeModelWithTitle:@"Quentin"   time:394],
                         [TimeModel timeModelWithTitle:@"Samirah"   time:345345],
                         [TimeModel timeModelWithTitle:@"Serafina"  time:233],
                         [TimeModel timeModelWithTitle:@"Shanon"    time:4649],
                         [TimeModel timeModelWithTitle:@"Sophie"    time:3454],
                         [TimeModel timeModelWithTitle:@"Steven"    time:54524],
                         [TimeModel timeModelWithTitle:@"Saadiya"   time:235]
                         ];
    

    [self initTableView];
    [self createTimer];
}

- (void)createTimer {
    
   self.m_timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerEvent) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_m_timer forMode:NSRunLoopCommonModes];
}

- (void)timerEvent {
    
    for (int count = 0; count < _m_dataArray.count; count++) {
        
        TimeModel *model = _m_dataArray[count];
        [model countDown];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_TIME_CELL object:nil];
}


#pragma mark - TableView

- (void)initTableView {
    
    self.m_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,Width, Height) style:UITableViewStylePlain];
    [self.view addSubview:_m_tableView];
    
    _m_tableView.delegate       = self;
    _m_tableView.dataSource     = self;
    _m_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [_m_tableView registerClass:[TimeCell class] forCellReuseIdentifier:TIME_CELL];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.m_dataArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    BaseTableViewCell * cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:TIME_CELL];
    
    TimeModel * model = _m_dataArray[indexPath.row];
    
    [cell loadData:model indexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 100;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    BaseTableViewCell *tmpCell = (BaseTableViewCell *)cell;
    tmpCell.m_isDisplayed            = YES;
    
    [tmpCell loadData:_m_dataArray[indexPath.row] indexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath {
    
    BaseTableViewCell *tmpCell = (BaseTableViewCell *)cell;
    
    tmpCell.m_isDisplayed = NO;
}



@end
