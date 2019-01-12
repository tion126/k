//
//  KTabBarController.m
//  K
//
//  Created by efun on 2019/1/12.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KTabBarController.h"
#import "KHomeViewController.h"
#import "KDiscovertViewController.h"
#import "KSongViewController.h"
#import "KMessageViewController.h"
#import "KMeViewController.h"

@interface KTabBarController()<UITabBarControllerDelegate>

@end

@implementation KTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    KHomeViewController *homeVC = [KHomeViewController  new];
    UITabBarItem *homeItem = [[UITabBarItem alloc] initWithTitle:@"动态" image:[UIImage imageNamed:@"trends_trends_normal_28x28_"] selectedImage:[UIImage imageNamed:@"trends_trends_click_28x28_"]];
    homeVC.tabBarItem = homeItem;
    
    KDiscovertViewController *discoveryVC = [KDiscovertViewController  new];
    UITabBarItem *discoveryItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:[UIImage imageNamed:@"trends_find_normal_28x28_"] selectedImage:[UIImage imageNamed:@"trends_find_click_28x28_"]];
    discoveryVC.tabBarItem = discoveryItem;
    
    KSongViewController *songVC = [KSongViewController  new];
    UITabBarItem *songItem = [[UITabBarItem alloc] initWithTitle:@"点歌" image:[UIImage imageNamed:@"ksong"] selectedImage:[UIImage imageNamed:@"ksong"]];
    songItem.imageInsets = UIEdgeInsetsMake(-20, 0, 5, 0);
    songVC.tabBarItem = songItem;
    
    KMessageViewController *messageVC = [KMessageViewController  new];
    UITabBarItem *messageItem = [[UITabBarItem alloc] initWithTitle:@"消息" image:[UIImage imageNamed:@"trends_message_normal_28x28_"] selectedImage:[UIImage imageNamed:@"trends_message_click_28x28_"]];
    messageVC.tabBarItem = messageItem;
    
    KMeViewController *meVC = [KMeViewController  new];
    UITabBarItem *meItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[UIImage imageNamed:@"trends_my_normal_28x28_"] selectedImage:[UIImage imageNamed:@"trends_my_click_28x28_"]];
    meVC.tabBarItem = meItem;
    
    self.viewControllers = @[homeVC,discoveryVC,songVC,messageVC,meVC];
    self.tabBar.tintColor = UIColorFromRGB(0xDC4663);
    
}

@end
