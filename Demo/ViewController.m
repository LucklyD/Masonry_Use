//
//  ViewController.m
//  Demo
//
//  Created by Lucky on 2017/11/8.
//  Copyright © 2017年 bg. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *lab1 = [UILabel new];
    lab1.backgroundColor = [UIColor redColor];
    lab1.font = [UIFont systemFontOfSize:14];
    lab1.textColor = [UIColor whiteColor];
    lab1.numberOfLines = 0;
    lab1.lineBreakMode = NSLineBreakByWordWrapping;
    lab1.text = @"这是测试的字符串。能看到1、2、3个步骤，第一步当然是上传照片了，要上传正面近照哦。上传后，网站会自动识别你的面部，如果觉得识别的不准，你还可以手动修改一下。左边可以看到16项修改参数，最上面是整体修改，你也可以根据自己的意愿单独修改某项，将鼠标放到选项上面，右边的预览图会显示相应的位置。";
    [self.view addSubview:lab1];
    [lab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view.mas_top).with.offset(120);
        make.width.mas_lessThanOrEqualTo(300);
        make.height.mas_greaterThanOrEqualTo(10);
    }];
    
    /*子视图等高*/
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lab1.mas_bottom).with.offset(20);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(300, 200));
    }];

    UIButton *firstBtn = [UIButton new];
    firstBtn.backgroundColor = [UIColor yellowColor];
    [firstBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [firstBtn setTitle:@"First" forState:UIControlStateNormal];
    firstBtn.tag = ActionType_First;
    [firstBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:firstBtn];
    
    UIButton *secondBtn = [UIButton new];
    secondBtn.backgroundColor = [UIColor blueColor];
    [secondBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [secondBtn setTitle:@"Second" forState:UIControlStateNormal];
    secondBtn.tag = ActionType_Second;
    [secondBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:secondBtn];
    
    UIButton *thirdBtn = [UIButton new];
    thirdBtn.backgroundColor = [UIColor greenColor];
    [thirdBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [thirdBtn setTitle:@"Third" forState:UIControlStateNormal];
    thirdBtn.tag = ActionType_Third;
    [thirdBtn addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:thirdBtn];
    
    [firstBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(bgView).insets(UIEdgeInsetsMake(10, 10, 0, 10));
        make.bottom.mas_equalTo(secondBtn.mas_top).with.offset(-10);
    }];
    [secondBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgView).insets(UIEdgeInsetsMake(0, 10, 0, 10));
        make.bottom.mas_equalTo(thirdBtn.mas_top).with.offset(-10);
    }];
    [thirdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(bgView).insets(UIEdgeInsetsMake(0, 10, 10, 10));
        make.height.equalTo(@[firstBtn,secondBtn]);
    }];
    
    /*子视图垂直居中*/
    UIView *bgView1 = [UIView new];
    bgView1.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView1];
    [bgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bgView.mas_bottom).with.offset(20);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(300, 150));
    }];
    
    UIView *purpleView = [UIView new];
    purpleView.backgroundColor = [UIColor purpleColor];
    [bgView1 addSubview:purpleView];
    
    UIView *orangeView = [UIView new];
    orangeView.backgroundColor = [UIColor orangeColor];
    [bgView1 addSubview:orangeView];
    
    [purpleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bgView1);
        make.left.mas_equalTo(bgView1).with.offset(50);
        make.right.mas_equalTo(orangeView.mas_left).with.offset(-10);
        make.width.mas_equalTo(orangeView);
        make.height.mas_equalTo(120);
    }];
    [orangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bgView1);
        make.right.mas_equalTo(bgView1.mas_right).with.offset(-50);
        make.width.mas_equalTo(purpleView);
        make.height.mas_equalTo(120);
    }];
}

- (void)clickAction:(UIButton *)sender{
    switch (sender.tag) {
        case ActionType_First:{
            FirstViewController *vc = [[FirstViewController alloc]init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
//        case ActionType_Second:{
//            SecondViewController *vc = [[SecondViewController alloc]init];
//            [self.navigationController pushViewController:vc animated:YES];
//        }
//            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
