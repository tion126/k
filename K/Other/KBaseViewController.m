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

- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action{
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"button_close_white_22x22_"] forState:UIControlStateNormal];
    
    if (@available(iOS 11.0, *)) {
        
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(22, 22));
        }];
    } else {
        backBtn.bounds = CGRectMake(0, 0, 22, 22);
    }
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    return backItem;
}

@end
