//
//  UIView+IBDesignable.m
//  Pinder
//
//  Created by Anton Bukov on 31.10.15.
//  Copyright (c) 2015 Happy Santa. All rights reserved.
//

#import "UIView+IBDesignable.h"

@implementation UIView (IBDesignable)

- (BOOL)layerShouldRasterize {
    return self.layer.shouldRasterize;
}

- (void)setLayerShouldRasterize:(BOOL)layerShouldRasterize {
    self.layer.shouldRasterize = layerShouldRasterize;
    if (layerShouldRasterize) {
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
}

- (BOOL)layerMasksToBounds {
    return self.layer.masksToBounds;
}

- (void)setLayerMasksToBounds:(BOOL)layerMasksToBounds {
    self.layer.masksToBounds = layerMasksToBounds;
}

- (CGFloat)layerCornerRadius {
    return self.layer.cornerRadius;
}

- (void)setLayerCornerRadius:(CGFloat)layerCornerRadius {
    self.layer.cornerRadius = layerCornerRadius;
}

- (UIColor *)layerBorderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setLayerBorderColor:(UIColor *)layerBorderColor {
    self.layer.borderColor = layerBorderColor.CGColor;
}

- (CGFloat)layerBorderWidth {
    return self.layer.borderWidth;
}

- (void)setLayerBorderWidth:(CGFloat)layerBorderWidth {
    self.layer.borderWidth = layerBorderWidth;
}

#pragma mark - Shadow

- (UIColor *)layerShadowColor {
    return [UIColor colorWithCGColor:self.layer.shadowColor];
}

- (void)setLayerShadowColor:(UIColor *)layerShadowColor {
    self.layer.shadowColor = layerShadowColor.CGColor;
}

- (CGFloat)layerShadowOpacity {
    return self.layer.shadowOpacity;
}

- (void)setLayerShadowOpacity:(CGFloat)layerShadowOpacity {
    self.layer.shadowOpacity = layerShadowOpacity;
}

- (CGFloat)layerShadowRadius {
    return self.layer.shadowRadius;
}

- (void)setLayerShadowRadius:(CGFloat)layerShadowRadius {
    self.layer.shadowRadius = layerShadowRadius;
}

- (CGSize)layerShadowOffset {
    return self.layer.shadowOffset;
}

- (void)setLayerShadowOffset:(CGSize)layerShadowOffset {
    self.layer.shadowOffset = layerShadowOffset;
}

@end

