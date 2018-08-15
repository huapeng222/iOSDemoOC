//
//  ViewController.m
//  Demo
//
//  Created by hua on 2018/8/15.
//  Copyright © 2018年 hua. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "HUDLoadingViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *datas;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    datas = @[@"加载gif动画的loading"];
    [self initUI];
}

- (void)initUI{
    UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.dataSource=self;
    tableView.delegate=self;
    [self.view addSubview:tableView];
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return datas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text=datas[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *str=[datas objectAtIndex:indexPath.row];
    if ([str isEqualToString:@"加载gif动画的loading"]) {
        HUDLoadingViewController *hudLoadingVC=[HUDLoadingViewController new];
        [self.navigationController pushViewController:hudLoadingVC animated:YES];
    }
}
@end
