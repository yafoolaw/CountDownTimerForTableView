//
//  CommonMacro.h
//  CountDownTimerForTableView
//
//  Created by FrankLiu on 15/9/10.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#ifndef CountDownTimerForTableView_CommonMacro_h
#define CountDownTimerForTableView_CommonMacro_h

// 宽度
#define  Width                             [UIScreen mainScreen].bounds.size.width

// 高度
#define  Height                            [UIScreen mainScreen].bounds.size.height

// 状态栏高度
#define  StatusBarHeight                   20.f

// 导航栏高度
#define  NavigationBarHeight               44.f

// 标签栏高度
#define  TabbarHeight                      49.f

// 状态栏高度 + 导航栏高度
#define  StatusBarAndNavigationBarHeight   (20.f + 44.f)

#define  iPhone4_4s   (Width == 320.f && Height == 480.f ? YES : NO)
#define  iPhone5_5s   (Width == 320.f && Height == 568.f ? YES : NO)
#define  iPhone6      (Width == 375.f && Height == 667.f ? YES : NO)
#define  iPhone6_plus (Width == 414.f && Height == 736.f ? YES : NO)


#endif
