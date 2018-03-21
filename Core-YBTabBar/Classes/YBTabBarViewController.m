//
//  CMTabBarViewController.m
//  CartMall
//
//  Created by 吴满乐 on 2018/1/25.
//  Copyright © 2018年 Hangzhou YunBao Technology Co., Ltd. All rights reserved.
//

#import "YBTabBarViewController.h"
#import "YBTabBar.h"

//配置TabBar
//#import "CMHomePageViewController.h"
//#import "CMChooseViewController.h"
//#import "CMMessageViewController.h"
//#import "CMMineViewController.h"

@interface YBTabBarViewController ()<YBTabBarDelegate>

@end

@implementation YBTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupTabbar];
}

- (void)setupTabbar {
    
//    CMHomePageViewController *homePageViewController = [[CMHomePageViewController alloc] init];
//
//    CMChooseViewController *chooseViewController = [[CMChooseViewController alloc] init];
//
//    CMMessageViewController *messageViewController = [[CMMessageViewController alloc] init];
//
//    CMMineViewController *mineViewController = [[CMMineViewController alloc] init];
//
//    self.viewControllers = @[homePageViewController, chooseViewController, messageViewController, mineViewController];
//
//    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
//    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
//
//    YBTabBar *tabBar = [[YBTabBar alloc] initWithFrame:self.tabBar.bounds];
//
//    tabBar.tabBarItemAttributes = @[@{kYBTabBarItemAttributeTitle : @"首页", kYBTabBarItemAttributeNormalImageName : @"tabbar_home_normal", kYBTabBarItemAttributeSelectedImageName : @"tabbar_home_select", kYBTabBarItemAttributeType : @(YBTabBarItemNormal)},
//                                    @{kYBTabBarItemAttributeTitle : @"选购", kYBTabBarItemAttributeNormalImageName : @"tabbar_choosetobuy_normal", kYBTabBarItemAttributeSelectedImageName : @"tabbar_choosetobuy_select", kYBTabBarItemAttributeType : @(YBTabBarItemNormal)},
//                                    @{kYBTabBarItemAttributeTitle : @"消息", kYBTabBarItemAttributeNormalImageName : @"tabbar_shoppingcart_normal", kYBTabBarItemAttributeSelectedImageName : @"tabbar_shoppingcart_select", kYBTabBarItemAttributeType : @(YBTabBarItemNormal)},
//                                    @{kYBTabBarItemAttributeTitle : @"我的", kYBTabBarItemAttributeNormalImageName : @"tabbar_mine_normal", kYBTabBarItemAttributeSelectedImageName : @"tabbar_mine_select", kYBTabBarItemAttributeType : @(YBTabBarItemNormal)},
//                                    ];
//
//    tabBar.delegate = self;
//
    //[self.navigationController setNavigationBarHidden:YES];
    
    //self.title = @"首页";
    //self.navigationItem.rightBarButtonItem = homepageViewController.navigationItem.rightBarButtonItem;
    //self.navigationItem.leftBarButtonItem = homepageViewController.navigationItem.leftBarButtonItem;
    //[self.tabBar addSubview:tabBar];
    
}

- (void)tabBarDidSelectedButtonWithIndex:(NSInteger)index title:(NSString *)title {
    
    UIViewController *viewController = self.viewControllers[index];
    self.selectedViewController = viewController;
    self.title = title;
    
    self.navigationItem.rightBarButtonItem = viewController.navigationItem.rightBarButtonItem;
    self.navigationItem.leftBarButtonItem = viewController.navigationItem.leftBarButtonItem;
    NSLog(@"%@", NSStringFromClass([viewController class]));
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

@end
