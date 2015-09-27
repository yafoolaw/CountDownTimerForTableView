//
//  TimeModel.h
//  CountDownTimerForTableView
//
//  Created by FrankLiu on 15/9/10.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeModel : NSObject

@property (nonatomic, strong) NSString *m_titleStr;
@property (nonatomic)         int       m_countNum;

/**
 *  便利构造器
 *
 *  @param title         标题
 *  @param countdownTime 倒计时
 *
 *  @return 实例对象
 */
+ (instancetype)timeModelWithTitle:(NSString*)title time:(int)time;

/**
 *  计数减1(countdownTime - 1)
 */
- (void)countDown;

/**
 *  将当前的countdownTime信息转换成字符串
 */
- (NSString *)currentTimeString;

@end
