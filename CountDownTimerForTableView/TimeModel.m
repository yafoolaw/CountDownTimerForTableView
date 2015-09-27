//
//  TimeModel.m
//  CountDownTimerForTableView
//
//  Created by FrankLiu on 15/9/10.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import "TimeModel.h"

@implementation TimeModel

+ (instancetype)timeModelWithTitle:(NSString*)title time:(int)time {

    TimeModel *model = [self new];
    
    model.m_titleStr = title;
    model.m_countNum = time;
    
    return model;
}

- (void)countDown {

    _m_countNum -= 1;
}

- (NSString*)currentTimeString {

    if (_m_countNum <= 0) {
        
        return @"00:00:00";
        
    } else {
        
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",(long)_m_countNum/3600,(long)_m_countNum%3600/60,(long)_m_countNum%60];
    }
}

@end
