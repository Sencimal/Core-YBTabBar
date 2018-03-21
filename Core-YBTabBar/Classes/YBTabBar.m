//
//  YBTabBar.m
//  CartMall
//
//  Created by 吴满乐 on 2018/1/25.
//  Copyright © 2018年 Hangzhou YunBao Technology Co., Ltd. All rights reserved.
//

#import "YBTabBar.h"

@interface YBTabBar ()

@property (strong, nonatomic) NSMutableArray *tabBarItems;

@end


@implementation YBTabBar


#pragma mark - Lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self config];
    }
    
    return self;
}

#pragma mark - Private Method

- (void)config {
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *topLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, -5, [UIScreen mainScreen].bounds.size.width, 5)];
    topLine.image = [UIImage imageNamed:@"tapbar_top_line"];
    [self addSubview:topLine];
}


- (void)setSelectedIndex:(NSInteger)index {
    for (YBTabBarItem *item in self.tabBarItems) {
        if (item.tag == index) {
            item.selected = YES;
        } else {
            item.selected = NO;
        }
    }
}


#pragma mark - Touch Event

- (void)itemSelected:(YBTabBarItem *)sender {
    
    
    if (sender.tabBarItemType != YBTabBarItemRise) {
        [self setSelectedIndex:sender.tag];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabBarDidSelectedButtonWithIndex:title:)]) {
        [self.delegate tabBarDidSelectedButtonWithIndex:sender.tag title:sender.titleLabel.text];
    }
}

#pragma mark - Setter

- (void)setTabBarItemAttributes:(NSArray<NSDictionary *> *)tabBarItemAttributes {
    _tabBarItemAttributes = tabBarItemAttributes.copy;
    
    CGFloat itemWidth = [UIScreen mainScreen].bounds.size.width / _tabBarItemAttributes.count;
    CGFloat tabBarHeight = CGRectGetHeight(self.frame);
    NSInteger itemTag = 0;
    
    _tabBarItems = [NSMutableArray arrayWithCapacity:_tabBarItemAttributes.count];
    for (id item in _tabBarItemAttributes) {
        if ([item isKindOfClass:[NSDictionary class]]) {
            NSDictionary *itemDict = (NSDictionary *)item;
            
            YBTabBarItemType type = [itemDict[kYBTabBarItemAttributeType] integerValue];
            
            CGRect frame = CGRectMake(itemTag * itemWidth, 0, itemWidth, tabBarHeight);
            
            
            
            YBTabBarItem *tabBarItem = [self tabBarItemWithFrame:frame
                                                    title:itemDict[kYBTabBarItemAttributeTitle]
                                normalImageName:itemDict[kYBTabBarItemAttributeNormalImageName]
                               selectedImageName:itemDict[kYBTabBarItemAttributeSelectedImageName] tabBarItemType:type];
            if (itemTag == 0) {
                tabBarItem.selected = YES;
                //tabBarItem.backgroundColor = [UIColor yellowColor];
            }
            
//            if (itemTag == 1) {
//                tabBarItem.backgroundColor = [UIColor cyanColor];
//            }
//
//            if (itemTag == 2) {
//                tabBarItem.backgroundColor = [UIColor blueColor];
//            }
//
//            if (itemTag == 3) {
//                tabBarItem.backgroundColor = [UIColor redColor];
//            }
            
            
            [tabBarItem addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchUpInside];
            
            tabBarItem.tag = itemTag;
            itemTag++;
            
            [_tabBarItems addObject:tabBarItem];
            [self addSubview:tabBarItem];
        }
    }
}


- (YBTabBarItem *)tabBarItemWithFrame:(CGRect)frame title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName tabBarItemType:(YBTabBarItemType)tabBarItemType {
    YBTabBarItem *item = [[YBTabBarItem alloc] initWithFrame:frame];
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateSelected];
    item.titleLabel.font = [UIFont systemFontOfSize:12];
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    [item setImage:normalImage forState:UIControlStateNormal];
    [item setImage:selectedImage forState:UIControlStateSelected];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateNormal];
    //[item setTitleColor:CM_COLOR_MAIN forState:UIControlStateSelected];
    item.tabBarItemType = tabBarItemType;
    
    return item;
}


@end
