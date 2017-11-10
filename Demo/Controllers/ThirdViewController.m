//
//  ThirdViewController.m
//  Demo
//
//  Created by Lucky on 2017/11/8.
//  Copyright © 2017年 bg. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIView+Masory.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self init_UI];
}

- (void)init_UI{
    self.title = @"Third";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.view.mas_top).with.offset(150);
        make.size.mas_equalTo(CGSizeMake(300, 100));
    }];
    
    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    [sv addSubview:sv11];
    [sv addSubview:sv12];
    [sv addSubview:sv13];
    //等宽排列，宽度自动计算
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(sv).insets(UIEdgeInsetsMake(30, 20, 30, 0));
        make.right.mas_equalTo(sv12.mas_left).with.offset(-30);
    }];
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(sv).insets(UIEdgeInsetsMake(30, 0, 30, 0));
        make.right.mas_equalTo(sv13.mas_left).with.offset(-30);
    }];
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(sv).insets(UIEdgeInsetsMake(30, 0, 30, 20));
        make.width.equalTo(@[sv11,sv12]);
    }];
    
    //等间距排列
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:scrollView];
    UIView *containView = [UIView new];
    [scrollView addSubview:containView];
    
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(sv.mas_bottom).with.offset(80);
        make.size.mas_equalTo(CGSizeMake(300, 100));
    }];
    [containView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
    }];
    
    float leftPadding = 30;//左右间距
    float centerPadding = 20;//中间间距
    UIView *lastView = nil;
    for (int i = 0; i < 12; i++) {
        UILabel *view = [UILabel new];
        view.backgroundColor = [UIColor redColor];
        view.font = [UIFont boldSystemFontOfSize:28];
        view.textColor = [UIColor blackColor];
        view.textAlignment = NSTextAlignmentCenter;
        view.text = [NSString stringWithFormat:@"%d",i+1];
        [containView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(scrollView.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(84, 50));
            if (lastView) {
                make.left.mas_equalTo(lastView.mas_right).with.offset(centerPadding);
            } else {
                make.left.mas_equalTo(containView.mas_left).with.offset(leftPadding);
            }
        }];
        lastView = view;
    }
    [lastView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(containView.mas_right).with.offset(-leftPadding);
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
