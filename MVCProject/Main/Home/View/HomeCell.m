//
//  HomeCell.m
//  MVCProject
//
//  Created by GJW on 16/7/22.
//  Copyright © 2016年 JW. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    // 1. 可重用标示符
    static NSString *ID = @"HomeCell";
    // 2. tableView查询可重用Cell
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 3. 如果没有可重用cell
    if (cell == nil) {
        //4. 从XIB加载自定义视图
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HomeCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
@end
