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

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self init_UI];
    [self init_Data];
}

- (void)init_UI{
    self.title = @"Second";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    // 设置tableView自动高度
//    tableView.rowHeight = UITableViewAutomaticDimension;
    [_tableView setSeparatorColor:[UIColor clearColor]];
    [_tableView registerClass:[SecondTCell class] forCellReuseIdentifier:@"SecondTCellID"];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.view);
    }];
}

- (void)init_Data{
    _dataArray = [NSMutableArray array];
    NSString *title = @"对，没错，我就是一行文本，标准的一行文本。";
    for (int i = 0; i < 12; i++) {
        title = [title stringByAppendingString:@"\n对，没错，我就是一行文本，标准的一行文本。"];
        SecondModel *model = [[SecondModel alloc]init];
        model.title = title;
        [_dataArray addObject:model];
    }
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SecondTCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SecondTCellID"];
    [cell setData:_dataArray[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    SecondModel *model = _dataArray[indexPath.row];
    return model.cellHeight;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
