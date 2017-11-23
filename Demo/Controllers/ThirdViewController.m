//
//  ThirdViewController.m
//  Demo
//
//  Created by Lucky on 2017/11/8.
//  Copyright © 2017年 bg. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (nonatomic, strong) UIView *firstView;
@property (nonatomic, strong) UIView *secondView;
@property (nonatomic, strong) UIScrollView *thirdView;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setFirstView];
    [self setSecondView];
    [self setThirdView];
}

- (void)setFirstView{
    _firstView = [UIView new];
    _firstView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_firstView];
    [_firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).with.offset(100);
        make.left.mas_equalTo(self.view.mas_left).with.offset(20);
        make.right.mas_equalTo(self.view.mas_right).with.offset(-20);
        make.height.mas_greaterThanOrEqualTo(15);
    }];
    
    NSMutableArray *viewList = [NSMutableArray array];
    for (int i = 0; i < 5; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor redColor];
        [_firstView addSubview:view];
        [viewList addObject:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_firstView.mas_left).with.offset(20);
            make.right.mas_equalTo(_firstView.mas_right).with.offset(-20);
            make.height.mas_equalTo(15);
        }];
    }
    [viewList mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:15 leadSpacing:15 tailSpacing:15];
}

- (void)setSecondView{
    _secondView = [UIView new];
    _secondView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_secondView];
    [_secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_firstView.mas_bottom).with.offset(20);
        make.left.mas_equalTo(self.view.mas_left).with.offset(20);
        make.height.mas_equalTo(100);
        make.width.mas_greaterThanOrEqualTo(15);
    }];
    
    UIView *flagView = nil;
    for (int i = 0; i < 9; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor redColor];
        [_secondView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(15);
            make.top.mas_equalTo(_secondView.mas_top).with.offset(20);
            make.bottom.mas_equalTo(_secondView.mas_bottom).with.offset(-20);
            if (flagView) {
                make.left.mas_equalTo(flagView.mas_right).with.offset(20);
            } else {
                make.left.mas_equalTo(_secondView.mas_left).with.offset(20);
            }
        }];
        flagView = view;
    }
    [flagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_secondView.mas_right).with.offset(-20);
    }];
}

- (void)setThirdView{
    _thirdView = [UIScrollView new];
    [self.view addSubview:_thirdView];
    [_thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_secondView.mas_bottom).with.offset(20);
        make.left.mas_equalTo(self.view.mas_left).with.offset(20);
        make.right.mas_equalTo(self.view.mas_right).with.offset(-20);
        make.height.mas_equalTo(100);
    }];
    
    UIView *contentView = [UIView new];
    _thirdView.backgroundColor = [UIColor yellowColor];
    [_thirdView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(_thirdView);
    }];
    
    UIView *flagView = nil;
    for (int i = 0; i < 20; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor redColor];
        [contentView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(15, 60));
            make.top.mas_equalTo(contentView.mas_top).with.offset(20);
            if (flagView) {
                make.left.mas_equalTo(flagView.mas_right).with.offset(20);
            } else {
                make.left.mas_equalTo(contentView.mas_left).with.offset(20);
            }
        }];
        flagView = view;
    }
    [flagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(contentView.mas_right).with.offset(-20);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
