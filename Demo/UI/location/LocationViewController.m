//
//  LocationViewController.m
//  Demo
//
//  Created by hua on 2018/9/7.
//  Copyright © 2018年 hua. All rights reserved.
//

#import "LocationViewController.h"
#import "Masonry.h"
#import <CoreLocation/CoreLocation.h>
#import <BMKLocationkit/BMKLocationAuth.h>
#import <BMKLocationkit/BMKLocationComponent.h>
#import "LocationUtil.h"

void showAlertView(NSString  *title,NSString  *message,NSString  *cancelTiele,NSArray *otherTitles){
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancelTiele otherButtonTitles:nil];
    for (NSString *str in otherTitles) {
        [alert addButtonWithTitle:str];
    }
    [alert show];
    
}

@interface LocationViewController ()<UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate,BMKLocationManagerDelegate>{
    NSArray *datas;
    
    CLLocationManager *locationM;
    
    BMKLocationManager *_locationManager;
}

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    datas = @[@"获取当前位置(系统)",@"获取当前位置(百度)"];
    
    UITableView *tableView=[[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.dataSource=self;
    tableView.delegate=self;
    [self.view addSubview:tableView];
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    
    locationM = [[CLLocationManager alloc] init];
    locationM.delegate=self;
    
    
    
    if ([CLLocationManager locationServicesEnabled]) {
        if ([CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedWhenInUse || [CLLocationManager authorizationStatus]==kCLAuthorizationStatusAuthorizedAlways) {
            NSLog(@"定位权限正常");
        }else{
            if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
                showAlertView(@"提示", @"未打开定位", @"ok", nil);
            }else {
                [locationM requestWhenInUseAuthorization];
            }
            
        }
    }else {
        NSLog(@"未正确添加plist值");
    }
    
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
//    NSString *str=[datas objectAtIndex:indexPath.row];
    if (indexPath.row==0) {
        
        [locationM requestLocation];
    }else if (indexPath.row == 1){
        [[LocationUtil sharedLocationUtil] requestLocation:^(BMKLocation * _Nullable location, BMKLocationNetworkState state, NSError * _Nullable error) {
            NSLog(@"1");
            if (!error) {
                NSString *str = [NSString stringWithFormat:@"%@,%@,%@,%@,%@",location.rgcData.country,location.rgcData.province,location.rgcData.city,location.rgcData.district,location.rgcData.street];
                showAlertView(@"提示", str, @"ok", nil);
            }
        }];

        
    }
    
}


-(void)locationManager:(nonnull CLLocationManager *)manager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations {
    NSLog(@"1");
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"2");
}

@end
