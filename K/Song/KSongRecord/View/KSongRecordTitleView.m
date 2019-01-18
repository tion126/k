//
//  KSongRecordTitleView.m
//  K
//
//  Created by efun on 2019/1/18.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KSongRecordTitleView.h"

@interface KSongRecordTitleView()

@property(nonatomic,strong)UIView     *dotView;
@end

@implementation KSongRecordTitleView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self initialize];
    }
    return self;
}

-(void)initialize{
  
    self.titleLab = [UILabel new];
    self.titleLab.font = MIDDLE_FONT;
    self.titleLab.textColor = UIColor.whiteColor;
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.dotView  = [UIView new];
    self.dotView.backgroundColor = UIColorFromRGB(0xE85854);
    self.dotView.clipsToBounds = YES;
    self.dotView.layer.cornerRadius = 2.5;
    self.progressLab = [UILabel new];
    self.progressLab.font = SMALL_FONT;
    self.progressLab.textColor = UIColor.whiteColor;
    
    //test
    self.titleLab.text = @"xxxxxxxx";
    self.progressLab.text = @"录制中：xxxxxxxxxx";
    
    [self addSubview:self.titleLab];
    [self addSubview:self.dotView];
    [self addSubview:self.progressLab];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.leading.trailing.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    
    [self.dotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(5, 5));
        make.centerY.mas_equalTo(self.progressLab);
        make.trailing.mas_equalTo(self.progressLab.mas_leading).with.offset(-5);
    }];
    
    [self.progressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.titleLab.mas_bottom);
    }];
}

@end
