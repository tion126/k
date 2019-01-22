//
//  KSongRecordVC.m
//  K
//
//  Created by efun on 2019/1/17.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KSongRecordVC.h"
#import "KSongRecordVM.h"
#import "KSongRecordTitleView.h"
#import "KRecordToolBar.h"
#import "KLyricData.h"
#import "KLyricTableView.h"

@interface KSongRecordVC ()

@property(nonatomic,strong)KRecordToolBar         *toolBar;
@property(nonatomic,strong)KSongRecordTitleView   *titleView;
@property(nonatomic,strong)UIImageView            *bgView;
@property(strong,nonatomic)KLyricTableView        *lrcTableView;
@property(nonatomic,strong)KSongRecordVM          *viewModel;
@end

@implementation KSongRecordVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)initializeSubviews{
    [super initializeSubviews];
    
    KLyricData *data = [KLyricData lyricData:self.viewModel.entity.decryptedZrce];
    NSLog(@"%@",data);
    self.titleView = [KSongRecordTitleView new];
    self.titleView.titleLab.text = self.viewModel.entity.name;
    self.navigationItem.titleView = self.titleView;
    self.bgView = CreatImageView(@"Recording-bg-r");
    self.toolBar = [KRecordToolBar new];
    self.lrcTableView = [KLyricTableView createWithData:data];
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.toolBar];
    [self.view addSubview:self.lrcTableView];
    
    [self.navigationController.navigationBar setBackgroundImage:UIImage.new forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = UIImage.new;
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : UIColor.whiteColor}];
}


- (void)initializeLayout{
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(150, 44));
    }];
    
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.leading.trailing.bottom.mas_equalTo(0);
        make.height.mas_equalTo(isIphoneX() ? 83 : 49);
    }];
    
    [self.lrcTableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.mas_equalTo(0);
        make.leading.mas_equalTo(30);
        make.trailing.mas_equalTo(-30);
    make.height.mas_equalTo(self.view.mas_height).with.multipliedBy(0.5);
    }];
}

-(void)initializeRAC{
    [super initializeRAC];
    
    [[KAudioManager shareKAudioManager] setData:self.viewModel.entity];
    [[KAudioManager shareKAudioManager] start];
}

@end
