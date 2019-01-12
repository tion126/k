//
//  KTabBarController.m
//  K
//
//  Created by efun on 2019/1/12.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KTabBarController.h"

@interface KTabBarController()<UITabBarControllerDelegate>


@end

@implementation KTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
}

@end
