//
//  SecondViewController.m
//  Demo
//
//  Created by Lucky on 2017/11/8.
//  Copyright © 2017年 bg. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondTCell.h"

@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self init_UI];
}

- (void)init_UI{
    self.title = @"Second";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UITableView *tableView = [UITableView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    // 设置tableView自动高度
    tableView.rowHeight = UITableViewAutomaticDimension;
    [tableView registerClass:[SecondTCell class] forCellReuseIdentifier:@"SecondTCellID"];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondTCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecondTCellID"];
    NSString *title = @"对，没错，我就是一行文本，标准的一行文本。";
    for (int i = 0; i < indexPath.row; i++) {
        title = [title stringByAppendingString:@"\n对，没错，我就是一行文本，标准的一行文本。"];
    }
    cell.titleLab.text = title;
    return cell;
}

// 需要注意的是，这个代理方法和直接返回当前Cell高度的代理方法并不一样。
// 这个代理方法会将当前所有Cell的高度都预估出来，而不是只计算显示的Cell，所以这种方式对性能消耗还是很大的。
// 所以通过设置estimatedRowHeight属性的方式，和这种代理方法的方式，最后性能消耗都是一样的。
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"estimatedHeightForRow");
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondTCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@",cell.titleLab.text);
    return 24 * (indexPath.row + 1);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
