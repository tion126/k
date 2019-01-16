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
    
    self.navigationController.navigationBarHidden = YES;
    self.bgView = CreatImageView(@"Recording-bg");
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
}

@end
