//
//  KProgressView.m
//  K
//
//  Created by efun on 2019/1/16.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KProgressView.h"

@interface KProgressView()

@property(nonatomic,strong)UILabel          *titleLab;
@property(nonatomic,strong)CAShapeLayer     *progressLayer;
@property(nonatomic,strong)CAEmitterLayer   *noteLayer;
@end

@implementation KProgressView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    [self initialize];
}

-(void)initialize{
    
    self.titleLab           = [UILabel new];
    self.titleLab.textColor = UIColor.whiteColor;
    self.titleLab.font      = MIDDLE_FONT;
    self.titleLab.textAlignment = NSTextAlignmentCenter;
    self.progressLayer = [CAShapeLayer layer];
    self.progressLayer.fillColor = [UIColor clearColor].CGColor;
    self.progressLayer.strokeEnd = 0;
    self.progressLayer.strokeColor = UIColorFromRGB(0xE85854).CGColor;
    
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 20;
    self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.1];
    
    self.noteLayer = [CAEmitterLayer layer];
    self.noteLayer.emitterSize = self.frame.size;
    self.noteLayer.emitterShape = kCAEmitterLayerPoint;
    self.noteLayer.emitterMode = kCAEmitterLayerPoints;
    self.noteLayer.emitterPosition = CGPointMake(500, 20);
    
    CAEmitterCell * noteCell0 = [CAEmitterCell emitterCell];
    CAEmitterCell * noteCell1 = [CAEmitterCell emitterCell];
    NSArray *cellArr = @[noteCell0,noteCell1];
    
    [cellArr enumerateObjectsUsingBlock:^(CAEmitterCell *cell, NSUInteger idx, BOOL * _Nonnull stop) {
       
        cell.name = [NSString stringWithFormat:@"NoteCell%lu",(unsigned long)idx];
        cell.contents = (id)[[UIImage imageNamed:[NSString stringWithFormat:@"note%lu",(unsigned long)idx]] CGImage];
        cell.birthRate = 5.f;
        cell.lifetime = 10.f;
        cell.velocity = 40.f;
        cell.velocityRange = 100.f;
        cell.yAcceleration = 15.f;
        cell.emissionLongitude = M_PI;
        cell.emissionRange = M_PI_4;
        cell.scale = 0.2;
        cell.scaleRange = 0.1;
        cell.scaleSpeed = 0.02;
        cell.alphaRange = 0.2;
        cell.alphaSpeed = -0.1f;
    }];
    
    self.noteLayer.emitterCells = cellArr;
    
    [self.layer addSublayer:self.noteLayer];
    [self.layer addSublayer:self.progressLayer];
    [self addSubview:self.titleLab];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(0);
    }];
}

-(void)setProgress:(CGFloat)progress{
    _progress = progress;
    NSLog(@"%.2f",progress);
    self.titleLab.text = progress >= 1.f ? @"开始" : [NSString stringWithFormat:@"下载中:%.f%%",progress * 100];
    self.progressLayer.strokeEnd = progress;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat width  = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    UIBezierPath *bezierPath = [[UIBezierPath alloc]init];
    [bezierPath moveToPoint:CGPointMake(0, height/2)];
    [bezierPath addLineToPoint:CGPointMake(width + 10, height/2)];
    self.progressLayer.path = bezierPath.CGPath;
    self.progressLayer.lineWidth = height;
    
    [self.noteLayer setValue:[NSValue valueWithCGPoint:CGPointMake(width, height/2)] forKeyPath:@"emitterPosition"];
    [CATransaction commit];
}

@end
