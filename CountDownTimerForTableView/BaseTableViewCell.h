//
//  BaseTableViewCell.h
//  CountDownTimerForTableView
//
//  Created by FrankLiu on 15/9/14.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

// 获取table view cell 的indexPath
@property (nonatomic, weak) NSIndexPath *m_indexPath;

@property (nonatomic)       BOOL         m_isDisplayed;

/**
 *  == [子类可以重写] ==
 *
 *  配置cell的默认属性
 */
- (void)defaultConfig;

/**
 *  == [子类可以重写] ==
 *
 *  在cell上面构建views
 */
- (void)buildViews;

/**
 *  == [子类可以重写] ==
 *
 *  加载数据
 *
 *  @param data      数据
 *  @param indexPath 数据编号
 */
- (void)loadData:(id)data indexPath:(NSIndexPath*)indexPath;

@end
