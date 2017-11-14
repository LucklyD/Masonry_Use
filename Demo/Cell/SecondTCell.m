//
//  SecondTCell.m
//  Demo
//
//  Created by Lucky on 2017/11/8.
//  Copyright © 2017年 bg. All rights reserved.
//

#import "SecondTCell.h"

@interface SecondTCell()

@property (nonatomic, strong) UILabel *titleLab;

@end

@implementation SecondTCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLab = [UILabel new];
        _titleLab.backgroundColor = [UIColor redColor];
        _titleLab.font = [UIFont systemFontOfSize:14];
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.numberOfLines = 0;
        _titleLab.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).with.offset(15);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.mas_lessThanOrEqualTo(DE_W - 30);
            make.height.mas_greaterThanOrEqualTo(14);
        }];
        
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.contentView);
            make.height.mas_equalTo(0.8);
        }];
    }
    return self;
}

- (void)setData:(SecondModel *)model{
    // 设置文字属性 要和label的一致
    NSDictionary *attrs = @{NSFontAttributeName : _titleLab.font};
    CGSize maxSize = CGSizeMake((DE_W - 30), MAXFLOAT);
    // 计算文字占据的高度
    CGSize size = [model.title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    _titleLab.text = model.title;
    model.cellHeight = size.height + 20;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
