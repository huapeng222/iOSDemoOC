//
//  LocationUtil.m
//  Demo
//
//  Created by hua on 2018/9/10.
//  Copyright © 2018年 hua. All rights reserved.
//

#import "LocationUtil.h"

static LocationUtil *locationUtil = nil;

@implementation LocationUtil

+ (LocationUtil *)sharedLocationUtil{
    if (!locationUtil){
        locationUtil = [LocationUtil new];
    }
    return locationUtil;
    
}

- (instancetype)init{
    self = [super init];
    if (self){
        
    }
    
    return self;
}
- (void)requestLocation:(BMKLocatingCompletionBlock _Nonnull)completionBlock{
    
    if (!_locationManager){
        //初始化实例
        _locationManager = [[BMKLocationManager alloc] init];
        //设置delegate
                _locationManager.delegate = self;
        //设置返回位置的坐标系类型
        _locationManager.coordinateType = BMKLocationCoordinateTypeBMK09LL;
        //设置距离过滤参数
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        //设置预期精度参数
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        //设置应用位置类型
        _locationManager.activityType = CLActivityTypeAutomotiveNavigation;
        //设置是否自动停止位置更新
        _locationManager.pausesLocationUpdatesAutomatically = NO;
        //设置是否允许后台定位
        //_locationManager.allowsBackgroundLocationUpdates = YES;
        //设置位置获取超时时间
        _locationManager.locationTimeout = 5;
        //设置获取地址信息超时时间
        _locationManager.reGeocodeTimeout =5;
    }
    
    
    [_locationManager requestLocationWithReGeocode:YES withNetworkState:YES completionBlock:completionBlock];
}
@end
