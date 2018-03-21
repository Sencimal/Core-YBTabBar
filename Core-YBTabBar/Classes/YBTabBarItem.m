//
//  YBTabBarItem.m
//  CartMall
//
//  Created by 吴满乐 on 2018/1/25.
//  Copyright © 2018年 Hangzhou YunBao Technology Co., Ltd. All rights reserved.
//

#import "YBTabBarItem.h"
#import "UIView+Layout.h"

NSString *const kYBTabBarItemAttributeTitle             = @"kYBTabBarItemAttributeTitle";
NSString *const kYBTabBarItemAttributeNormalImageName   = @"kYBTabBarItemAttributeNormalImageName";
NSString *const kYBTabBarItemAttributeSelectedImageName = @"kYBTabBarItemAttributeSelectedImageName";
NSString *const kYBTabBarItemAttributeType              = @"kYBTabBarItemAttributeType";

@implementation YBTabBarItem

- (instancetype)init {
    self = [super init];
    if (self) {
        [self config];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self config];
    }
    return self;
}

- (void)config {
    self.adjustsImageWhenHighlighted = NO;
    self.imageView.contentMode = UIViewContentModeScaleToFill;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    CGSize titleSize = self.titleLabel.frame.size;
    
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    
    CGFloat imageViewCenterY = 0;
    
    if (imageSize.width != 0 && imageSize.height != 0) {
        if (_tabBarItemType == YBTabBarItemRise) {
            imageViewCenterY = CGRectGetHeight(self.frame) - titleSize.height - imageSize.height / 2 - 3;
            self.imageView.width = 55;
            self.imageView.height = 55;
        }else{
            imageViewCenterY = CGRectGetHeight(self.frame) - 3 - titleSize.height - imageSize.height / 2 - 3;
        }
        self.imageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, imageViewCenterY);
        
    }else{
        CGPoint imageViewCenter = self.imageView.center;
        imageViewCenter.x = CGRectGetWidth(self.frame) / 2;
        imageViewCenter.y = (CGRectGetWidth(self.frame) - titleSize.height) / 2;
        self.imageView.center = imageViewCenter;
    }
    
    CGPoint labelCenter = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) - titleSize.height / 2);
    self.titleLabel.center = labelCenter;
}


@end
