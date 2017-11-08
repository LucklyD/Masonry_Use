//
//  FirstViewController.m
//  Demo
//
//  Created by Lucky on 2017/11/8.
//  Copyright © 2017年 bg. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self init_UI];
}

- (void)init_UI{
    self.title = @"First";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    CGFloat padding = 10;
    UIView *containerView = [UIView new];
    [scrollView addSubview:containerView];
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView).insets(UIEdgeInsetsMake(padding, padding, padding, padding));
    }];
    
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    [containerView addSubview:redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(containerView).with.offset(padding);
        make.size.mas_equalTo(CGSizeMake(200, 500));
    }];
    
    UIView *blueView = [UIView new];
    blueView.backgroundColor = [UIColor blueColor];
    [containerView addSubview:blueView];
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(containerView).with.offset(padding);
        make.left.equalTo(redView.mas_right).with.offset(padding);
        make.right.mas_equalTo(containerView.mas_right).with.offset(-padding);
        make.size.equalTo(redView);
    }];

    UIView *greenView = [UIView new];
    greenView.backgroundColor = [UIColor greenColor];
    [containerView addSubview:greenView];
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(containerView).with.offset(padding);
        make.top.mas_equalTo(redView.mas_bottom).with.offset(padding);
        make.size.equalTo(redView);
        make.bottom.mas_equalTo(containerView.mas_bottom).with.offset(-padding);
    }];
    
    UIView *yellowView = [UIView new];
    yellowView.backgroundColor = [UIColor yellowColor];
    [containerView addSubview:yellowView];
    [yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(greenView.mas_right).with.offset(padding);
        make.top.mas_equalTo(redView.mas_bottom).with.offset(padding);
        make.size.equalTo(redView);
        make.bottom.mas_equalTo(containerView.mas_bottom).with.offset(-padding);
        make.right.mas_equalTo(containerView.mas_right).with.offset(-padding);
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
