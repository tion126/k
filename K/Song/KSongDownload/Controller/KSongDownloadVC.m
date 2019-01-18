//
//  KSongDownloadVC.m
//  K
//
//  Created by efun on 2019/1/15.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KSongDownloadVC.h"
#import "KProgressView.h"
#import "KSongDownloadVM.h"
#import "KSongRecordVC.h"
#import "KSongRecordVM.h"

@interface KSongDownloadVC ()

@property(nonatomic,strong)KProgressView     *progressView;
@property(nonatomic,strong)UIImageView       *bgView;
@property(nonatomic,strong)KSongDownloadVM   *viewModel;
@end

@implementation KSongDownloadVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)initializeSubviews{
    
    self.title = self.viewModel.entity.name;
    [self.navigationController.navigationBar setBackgroundImage:UIImage.new forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = UIImage.new;
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{
                              NSForegroundColorAttributeName : UIColor.whiteColor,
                              NSFontAttributeName : BIG_FONT_BOLD}];
    self.bgView = CreatImageView(@"Recording-bg-r");
    [self.view addSubview:self.bgView];
    self.progressView = [KProgressView new];
    [self.view addSubview:self.progressView];
}

- (void)initializeLayout{
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.progressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
        make.leading.mas_equalTo(50);
        make.trailing.mas_equalTo(-50);
        make.height.mas_equalTo(40);
    }];
}

-(void)initializeRAC{
    
    [self.viewModel.download execute:nil];
    RAC(self.progressView,progress) = RACObserve(self.viewModel, progress);
    @weakify(self)
    [[[[self.progressView rac_signalForControlEvents:UIControlEventTouchUpInside] takeUntil:self.rac_willDeallocSignal] filter:^BOOL(id value) {
     @strongify(self)
        return self.progressView.progress >= 1.f;
    }] subscribeNext:^(id x) {
     @strongify(self)
        KSongRecordVM *recordVM = [KSongRecordVM new];
        recordVM.entity = self.viewModel.entity;
        KSongRecordVC *recordVC = [KSongRecordVC viewControllerWithVM:recordVM];
        [self.navigationController pushViewController:recordVC animated:YES];
        
        //test
        [[NSUserDefaults standardUserDefaults] setObject:[self.viewModel.entity yy_modelToJSONString] forKey:@"kTestEntity"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }];
}

@end
