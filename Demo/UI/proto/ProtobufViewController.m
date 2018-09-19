//
//  ProtobufViewController.m
//  Demo
//
//  Created by hua on 2018/9/19.
//  Copyright © 2018年 hua. All rights reserved.
//

#import "ProtobufViewController.h"
#import "Person.pbobjc.h"

@interface ProtobufViewController ()

@end

@implementation ProtobufViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication];
    self.view.backgroundColor=[UIColor whiteColor];
    
    // Do any additional setup after loading the view.
    
    Person *person = [[Person alloc] init];
    person.age = 100;
    person.username = @"huang";
    person.phone = @"10086";
    NSData *data = [person data];
    Person *p = [Person parseFromData:data error:nil];
    
    
    NSLog(@"1,%@",p.description);
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
