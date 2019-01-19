//
//  KLyricTableViewCell.m
//  K
//
//  Created by tion126 on 2019/1/18.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KLyricTableViewCell.h"

@interface KlrcLable : UILabel

@property(nonatomic,assign)double   width;
@end

@implementation KlrcLable

-(void)setWidth:(double)width{
    _width = width;
    [self setNeedsDisplay];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    if (self.width > 0) {
        [UIColorFromRGB(0xE85854) set];
        UIRectFillUsingBlendMode(CGRectMake(0, 0, self.width, rect.size.height), kCGBlendModeSourceIn);
    }
}

@end


@interface KLyricTableViewCell()

@property (strong,nonatomic) KlrcLable        *lrcLab;
@property (strong,nonatomic) KLyricLineEntity *entity;
@end

@implementation KLyricTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self initialize];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initialize];
    }
    return self;
}

-(void)initialize{
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.backgroundColor = UIColor.clearColor;
    self.backgroundColor = UIColor.clearColor;
    self.lrcLab = [KlrcLable new];
    self.lrcLab.font = [UIFont boldSystemFontOfSize:23];
    self.lrcLab.textColor = UIColor.whiteColor;
    self.lrcLab.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.lrcLab];
    [self.lrcLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 0, 10));
    }];
}

-(void)setEntity:(KLyricLineEntity *)entity{
    _entity = entity;
    
    self.lrcLab.text = entity.lyric;
}

@end
