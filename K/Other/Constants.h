//
//  Constants.h
//  Copyright © 2016年 MMQ. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

// define
#define kAlphaNum @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
#define kNumAndDot @"0123456789."
#define kNumber    @"0123456789"

#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

// FONT
#define FONT_SIZE_SSMALL    10
#define FONT_SIZE_SMALL     14
#define FONT_SIZE_MIDDLE    15
#define FONT_SIZE_BIG       16
#define FONT_SIZE_SBIG      20

#define SSMALL_FONT        [UIFont systemFontOfSize:FONT_SIZE_SSMALL]
#define SMALL_FONT         [UIFont systemFontOfSize:FONT_SIZE_SMALL]
#define MIDDLE_FONT        [UIFont systemFontOfSize:FONT_SIZE_MIDDLE]
#define BIG_FONT           [UIFont systemFontOfSize:FONT_SIZE_BIG]
#define SBIG_FONT          [UIFont systemFontOfSize:FONT_SIZE_SBIG]

#define SMALL_FONT_BOLD    [UIFont boldSystemFontOfSize:FONT_SIZE_SMALL]
#define MIDDLE_FONT_BOLD   [UIFont boldSystemFontOfSize:FONT_SIZE_MIDDLE]
#define BIG_FONT_BOLD      [UIFont boldSystemFontOfSize:FONT_SIZE_BIG]
#define SBIG_FONT_BOLD     [UIFont boldSystemFontOfSize:FONT_SIZE_SBIG]

// color
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 \
alpha:1.0]

#define CreatImageView(name)  [[UIImageView alloc]initWithImage:[UIImage imageNamed:name]]
#define CreatImage(name) [UIImage imageNamed:name]
#define CreatDivLine CreatImageView(@"divide_line")

//** RGBA
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define IS_IPHONE_5 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )568) < DBL_EPSILON )
#define IS_IPHONE_6 (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )667) < DBL_EPSILON )
#define IS_IPHONE_6_PLUS (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double )960) < DBL_EPSILON )

#define COLOR_F6F6F6 UIColorFromRGB(0xF6F6F6)
#define COLOR_WHITE  UIColorFromRGB(0xFFFFFF)
#define COLOR_EEEEEE UIColorFromRGB(0xEEEEEE)
#define COLOR_DDDDDD UIColorFromRGB(0xDDDDDD)
#define COLOR_CCCCCC UIColorFromRGB(0xCCCCCC)
#define COLOR_333333 UIColorFromRGB(0x333333)
#define COLOR_999999 UIColorFromRGB(0x999999)
#define COLOR_E96145 UIColorFromRGB(0xE96145)
#define COLOR_666666 UIColorFromRGB(0x666666)
#define COLOR_F3F3F3 UIColorFromRGB(0xF3F3F3)
#define COLOR_D2D2D2 UIColorFromRGB(0xD2D2D2)
#define COLOR_F5F5F9 UIColorFromRGB(0xF5F5F9)
#define COLOR_81BE07 UIColorFromRGB(0x81BE07)
#define COLOR_CC0000 UIColorFromRGB(0xCC0000)
#define COLOR_F8E29A UIColorFromRGB(0xF8E29A)
#define COLOR_6B6F76 UIColorFromRGB(0x6B6F76)
#define COLOR_2E7CF0 UIColorFromRGB(0x2E7CF0)
#define COLOR_D83E3E UIColorFromRGB(0xD83E3E)
#define COLOR_FFDDDD UIColorFromRGB(0xFFDDDD)
#define COLOR_DD4929 UIColorFromRGB(0xDD4929)
#define COLOR_0000FF UIColorFromRGB(0x0000FF)
#define COLOR_FF0000 UIColorFromRGB(0xFF0000)
#define COLOR_4CB9E2 UIColorFromRGB(0x4CB9E2)
#define COLOR_00B9E2 UIColorFromRGB(0x00B9E2)

/**
 *  自定义NSLog
 */
#ifdef DEBUG
#define KLog(...) NSLog(__VA_ARGS__)
#else
#define KLog(...)
#endif

#define SAFE_BLOCK(block, ...) \
if (block) { \
block(__VA_ARGS__); \
}


#define IFNULL(string) [NSString IFNULL:string]

#define SAFE_BLOCK(block, ...) \
if (block) { \
block(__VA_ARGS__); \
}

/**
 *单例
 */

#define interfaceSingleton(name)  +(instancetype)share##name

// ARC
#define implementationSingleton(name)  \
+ (instancetype)share##name \
{ \
name *instance = [[self alloc] init]; \
return instance; \
} \
static name *_instance = nil; \
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[super allocWithZone:zone] init]; \
}); \
return _instance; \
} \
- (id)copyWithZone:(NSZone *)zone{ \
return _instance; \
} \
- (id)mutableCopyWithZone:(NSZone *)zone \
{ \
return _instance; \
}

#endif /* Constants_h */
