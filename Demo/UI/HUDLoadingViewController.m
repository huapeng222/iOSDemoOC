//
//  HUDLoadingViewController.m
//  Demo
//
//  Created by hua on 2018/8/15.
//  Copyright © 2018年 hua. All rights reserved.
//

#import "HUDLoadingViewController.h"
#import "MBProgressHUD.h"
#import "UIImage+GIF.h"
#import "HUDLoadingCustomImageView.h"

@interface HUDLoadingViewController ()

@end

@implementation HUDLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"加载gif动画的loading";
    self.view.backgroundColor=[UIColor whiteColor];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    [self.view addSubview:hud];
    
    HUDLoadingCustomImageView *imageView=[HUDLoadingCustomImageView new];
    imageView.frame=CGRectMake(0, 0, 200, 200);
    imageView.contentMode=UIViewContentModeScaleAspectFit;
    NSString *gifPath=[[NSBundle mainBundle] pathForResource:@"loading" ofType:@"gif"];
    imageView.image=[UIImage sd_animatedGIFWithData:[NSData dataWithContentsOfFile:gifPath]];
    imageView.size=CGSizeMake(80/2, 45/2);
    
    UIView *redView=[UIView new];
    redView.frame=CGRectMake(0, 0, 200, 200);
    redView.backgroundColor=[UIColor redColor];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView=imageView;
    hud.graceTime = 0.5;
    hud.removeFromSuperViewOnHide = YES;
    //detailsLabel不支持换行
    hud.label.text=@"正在加载中...";
    //detailsLabel支持换行
    hud.detailsLabel.text=@"加\n载\n中\n.\n.";
    //设置背景色
    hud.bezelView.color=[UIColor clearColor];
    [hud showAnimated:YES];
    
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
