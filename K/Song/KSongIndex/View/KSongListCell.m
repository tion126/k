//
//  KSongListCell.m
//  K
//
//  Created by efun on 2019/1/15.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KSongListCell.h"

@interface KSongListCell()
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel     *nameLab;
@property (weak, nonatomic) IBOutlet UILabel     *cntLab;
@property (weak, nonatomic) IBOutlet UILabel     *authorLab;
@property(nonatomic,strong) KSongListEntity      *entity;
@end

@implementation KSongListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    @weakify(self)
    [RACObserve(self, entity) subscribeNext:^(id x) {
     @strongify(self)
        
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:self.entity.icon]];
        self.nameLab.text = self.entity.name;
        self.authorLab.text = self.entity.artist;
        self.cntLab.text  = self.entity.secondAdditionInfo;
    }];
}

- (IBAction)didClick:(id)sender {
  
    if ([self.delegate respondsToSelector:@selector(didClickButtonAtIndex:withEntity:)]) {
        [self.delegate didClickButtonAtIndex:[sender tag] withEntity:self.entity];
    }
}

@end
