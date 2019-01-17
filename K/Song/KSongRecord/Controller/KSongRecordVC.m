//
//  KSongRecordVC.m
//  K
//
//  Created by efun on 2019/1/17.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KSongRecordVC.h"
#import "KSongRecordVM.h"

@interface KSongRecordVC ()

@property(nonatomic,strong)UIImageView      *bgView;
@property(nonatomic,strong)KSongRecordVM    *viewModel;
@end

@implementation KSongRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)initializeSubviews{
    [super initializeSubviews];
    
    self.title = self.viewModel.entity.name;
    [self.navigationController.navigationBar setBackgroundImage:UIImage.new forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = UIImage.new;
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{
                              NSForegroundColorAttributeName : UIColor.whiteColor,
                              NSFontAttributeName : BIG_FONT_BOLD}];
    self.bgView = CreatImageView(@"Recording-bg");
    [self.view addSubview:self.bgView];
}


- (void)initializeLayout{
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

@end
