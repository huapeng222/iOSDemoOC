//
//  HUDLoadingCustomImageView.m
//  Demo
//
//  Created by hua on 2018/8/15.
//  Copyright © 2018年 hua. All rights reserved.
//

#import "HUDLoadingCustomImageView.h"

@implementation HUDLoadingCustomImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGSize)intrinsicContentSize{
    return _size;
}

@end
