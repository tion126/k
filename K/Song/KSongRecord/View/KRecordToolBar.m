//
//  KRecordToolBar.m
//  K
//
//  Created by efun on 2019/1/18.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KRecordToolBar.h"

@interface KRecordToolButton : UIButton

@end

@implementation KRecordToolButton

+(instancetype)button{
    
    KRecordToolButton *button = [KRecordToolButton buttonWithType:UIButtonTypeCustom];
    return button;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat btnW = self.frame.size.width;
    CGFloat labH = self.titleLabel.frame.size.height;
    CGFloat imgW =self.imageView.frame.size.width;
    CGFloat imgH =self.imageView.frame.size.height;
    
    self.imageView.frame =CGRectMake((btnW - imgW)/2,5, imgW, imgH);
    self.titleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.imageView.frame) + 5, btnW, labH);
}
@end

@interface KRecordToolBar()

@end

@implementation KRecordToolBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void)initialize{
    
    self.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    NSMutableArray *buttons = [NSMutableArray arrayWithCapacity:4];
    NSArray *titleData = @[@"原唱",@"调音台",@"重唱",@"完成"];
    for (NSInteger index = 0; index < 4; index ++) {
        NSString *imageName1 = [NSString stringWithFormat:@"RecordView_item%li",(long)index + 1];
        NSString *imageName2 = [NSString stringWithFormat:@"RecordView_item%li_sel",(long)index + 1];
        KRecordToolButton *button = [KRecordToolButton button];
        [button setImage:CreatImage(imageName1) forState:UIControlStateNormal];
        [button setImage:CreatImage(imageName2) forState:UIControlStateSelected];
        [button setTitle:titleData[index] forState:UIControlStateNormal];
        button.titleLabel.font = SMALL_FONT;
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button addTarget:self action:@selector(didTapItem:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = index;
        [buttons addObject:button];
        [self.contentView addSubview:button];
    }
    
    [buttons mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:SCREEN_WIDTH/4 leadSpacing:0 tailSpacing:0];
    [buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(49);
    }];
}

-(void)didTapItem:(UIBarButtonItem *)item{
    
    NSLog(@"%li_____",(long)item.tag);
}

@end
