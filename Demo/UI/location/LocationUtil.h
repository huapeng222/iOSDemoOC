//
//  LocationUtil.h
//  Demo
//
//  Created by hua on 2018/9/10.
//  Copyright © 2018年 hua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <BMKLocationkit/BMKLocationComponent.h>

@interface LocationUtil : NSObject<BMKLocationManagerDelegate>{
    BMKLocationManager *_locationManager;
}

+ (LocationUtil *)sharedLocationUtil;
- (void)requestLocation:(BMKLocatingCompletionBlock _Nonnull)completionBlock;
@end
