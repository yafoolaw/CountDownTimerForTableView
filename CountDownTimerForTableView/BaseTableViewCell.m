//
//  BaseTableViewCell.m
//  CountDownTimerForTableView
//
//  Created by FrankLiu on 15/9/14.
//  Copyright (c) 2015年 FrankLiu. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self defaultConfig];
        
        [self buildViews];
    }
    
    return self;
}

- (void)defaultConfig {
    
}

- (void)buildViews {
    
}

- (void)loadData:(id)data indexPath:(NSIndexPath *)indexPath {
    
}

@end
