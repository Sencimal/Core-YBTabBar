//
//  YBTabBar.h
//  CartMall
//
//  Created by 吴满乐 on 2018/1/25.
//  Copyright © 2018年 Hangzhou YunBao Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YBTabBarItem.h"

@protocol YBTabBarDelegate <NSObject>

- (void)tabBarDidSelectedButtonWithIndex:(NSInteger)index title:(NSString *)title;

@end


@interface YBTabBar : UIView

@property (nonatomic, copy) NSArray<NSDictionary *> *tabBarItemAttributes;
@property (nonatomic, weak) id <YBTabBarDelegate> delegate;

@end
