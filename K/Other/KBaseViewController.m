//
//  KSongDownloadVC.h
//  K
//
//  Created by TION126 on 2019/1/15.
//  Copyright © 2019 com.tion126. All rights reserved.
//


#import "KBaseViewController.h"

@interface KBaseViewController()

@property(nonatomic,strong)KBaseViewModel  *viewModel;
@end

@implementation KBaseViewController


- (instancetype)initWithViewModel:(KBaseViewModel *)viewModel{
    
    if (self = [super init]) {
    
        self.viewModel = viewModel;
    }
    
    return self;
}

+(instancetype)viewController{
    
    return [[self alloc]init];
}

+(instancetype)viewControllerWithVM:(KBaseViewModel *)viewModel{
    
    KBaseViewController *baseVC = [self new];
    baseVC.viewModel = viewModel;
    
    return baseVC;
}


- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.rt_disableInteractivePop = NO;
    
    [self initializeSubviews];
    
    [self initializeLayout];
    
    [self initializeRAC];
}

- (void)initializeSubviews{}

- (void)initializeLayout{}

- (void)initializeRAC{}

- (void)dealloc
{
    NSLog(@"dealloc_______%@",NSStringFromClass([self class]));
}

@end
