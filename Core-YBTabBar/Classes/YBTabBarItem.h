//
//  YBTabBarItem.h
//  CartMall
//
//  Created by 吴满乐 on 2018/1/25.
//  Copyright © 2018年 Hangzhou YunBao Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YBTabBarItemType) {
    YBTabBarItemNormal = 0,
    YBTabBarItemRise,
};

extern NSString *const kYBTabBarItemAttributeTitle;
extern NSString *const kYBTabBarItemAttributeNormalImageName;
extern NSString *const kYBTabBarItemAttributeSelectedImageName;
extern NSString *const kYBTabBarItemAttributeType;

@interface YBTabBarItem : UIButton

@property (nonatomic, assign) YBTabBarItemType tabBarItemType;

@end
