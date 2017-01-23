//
//  BYTabBarVC.m
//  demo
//
//  Created by Baleen.Y on 1/23/17.
//  Copyright © 2017 Baleen.Y. All rights reserved.
//

#import "BYTabBarVC.h"
#import "BYChildVCItem.h"
#import "BYNaviVC.h"
#import "BYPublishVC.h"

@interface BYTabBarVC ()

@property (nonatomic, weak) UIButton *publishBtn;
@property (nonatomic, strong) UIWindow *window;
@end

@implementation BYTabBarVC

/**
 viewDidLoad
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupChildVC];
}

/**
 懒加载 window
 */
- (UIWindow *)window {
    if (_window == nil) {
        BYPublishVC *publishVC = [[BYPublishVC alloc] init];
        UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        window.windowLevel = UIWindowLevelStatusBar;
        window.backgroundColor = [UIColor clearColor];
        window.rootViewController = publishVC;
        _window = window;
    }
    return _window;
}

/**
 懒加载 publishBtn
 */
- (UIButton *)publishBtn {
    if (_publishBtn == nil) {
        CGFloat centerX = self.tabBar.bounds.size.width * 0.5;
        CGFloat centerY = self.tabBar.bounds.size.height * 0.5;
        UIButton *btn = [[UIButton alloc] init];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [btn sizeToFit];
        btn.center = CGPointMake(centerX, centerY);
        [self.tabBar addSubview:btn];
        [btn addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        _publishBtn = btn;
    }
    return _publishBtn;
}

/**
 publishClick
 */
- (void)publishClick {
//    self.window.alpha = 1;
    self.window.rootViewController.view.alpha = 1;
    self.window.hidden = NO;
//    [self.window makeKeyAndVisible];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clearWindow) name:@"publishClick" object:nil];
 
}
//
//- (void)clearWindow {
//    self.window = nil;
//}

/**
 setupChildVC
 */
- (void)setupChildVC {
    // 1. 加载子控制器
    NSArray *arr = [BYChildVCItem getChildVCArr];
    // 2. 添加子控制器
    for (BYChildVCItem *vcItem in arr) {
        // 0. 判断是否是发布
        if ([vcItem.className isEqualToString:@"BYPublishVC"]) {
            UIViewController *vc = [[NSClassFromString(vcItem.className) alloc] init];
            vc.tabBarItem.enabled =  NO;
            [self publishBtn];
            [self addChildViewController:vc];
            
        } else {
            // 1.创建导航控制器
            UIViewController *vc = [[NSClassFromString(vcItem.className) alloc] init];
            BYNaviVC *naviVC = [[BYNaviVC alloc] initWithRootViewController:vc];
            vc.title = vcItem.title;
            vc.view.backgroundColor = [UIColor greenColor];
            [self addChildViewController:naviVC];
        }
    }
}

@end
