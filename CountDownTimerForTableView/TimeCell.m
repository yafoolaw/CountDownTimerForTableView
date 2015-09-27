//
//  TimeCell.m
//  CountDownTimerForTableView
//
//  Created by FrankLiu on 15/9/14.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import "TimeCell.h"
#import "TimeModel.h"
#import "CommonMacro.h"

@interface TimeCell ()

@property (nonatomic, strong) UIView      *m_backgroundView;
@property (nonatomic, strong) UILabel     *m_titleLabel;
@property (nonatomic, strong) UILabel     *m_timeLabel;

@property (nonatomic, weak)   id           m_data;
@property (nonatomic, weak)   NSIndexPath *m_tmpIndexPath;


@end

@implementation TimeCell

- (void)defaultConfig {

    [self registerNSNotificationCenter];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.2];
    
}

- (void)buildViews {

    self.m_backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Width, 99.5)];
    [self addSubview:_m_backgroundView];
    
    _m_backgroundView.backgroundColor = [UIColor whiteColor];
    
    // 标题
    self.m_titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, Width-20, 30)];
    [_m_backgroundView addSubview:_m_titleLabel];
    
    _m_titleLabel.textColor = [UIColor blackColor];
    _m_titleLabel.font      = [UIFont fontWithName:@"Avenir-Light" size:20];
    
    // 倒计时
    self.m_timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, Width-20, 40)];
    [_m_backgroundView addSubview:_m_timeLabel];
    
    _m_timeLabel.textColor     = [UIColor redColor];
    _m_timeLabel.textAlignment = NSTextAlignmentRight;
    _m_timeLabel.font          = [UIFont fontWithName:@"AvenirNext-UltraLight" size:30];
    
    
}

- (void)loadData:(id)data indexPath:(NSIndexPath *)indexPath {
    
    if ([data isMemberOfClass:[TimeModel class]]) {
        
        [self storeWeakValueWithData:data indexPath:indexPath];
        
        TimeModel *model = (TimeModel*)data;
        
        _m_titleLabel.text = model.m_titleStr;
        _m_timeLabel.text  = [NSString stringWithFormat:@"%@",[model currentTimeString]];
    }
    
}

- (void)storeWeakValueWithData:(id)data indexPath:(NSIndexPath *)indexPath {
    
    self.m_data         = data;
    self.m_tmpIndexPath = indexPath;
}

- (void)dealloc {
    
    [self removeNSNotificationCenter];
}

#pragma mark - 通知中心
- (void)registerNSNotificationCenter {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notificationCenterEvent:)
                                                 name:NOTIFICATION_TIME_CELL
                                               object:nil];
}

- (void)removeNSNotificationCenter {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:NOTIFICATION_TIME_CELL object:nil];
}

- (void)notificationCenterEvent:(id)sender {
    
    if (self.m_isDisplayed) {
        [self loadData:self.m_data indexPath:self.m_tmpIndexPath];
    }
}



@end
