//
//  SecondTCell.m
//  Demo
//
//  Created by Lucky on 2017/11/8.
//  Copyright © 2017年 bg. All rights reserved.
//

#import "SecondTCell.h"

@implementation SecondTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLab = [UILabel new];
        _titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab.textColor = [UIColor grayColor];
        _titleLab.numberOfLines = 0;
        _titleLab.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(15);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.mas_lessThanOrEqualTo(DE_W - 30);
            make.height.mas_greaterThanOrEqualTo(14);
        }];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
