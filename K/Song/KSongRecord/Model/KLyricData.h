//
//  KLyricData.h
//  K
//
//  Created by efun on 2019/1/18.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KLyricWordEntity : NSObject

@property(nonatomic, copy )NSString         *text;
@property(nonatomic,assign)NSTimeInterval   beginTime;
@property(nonatomic,assign)NSTimeInterval   duration;
@property(nonatomic, copy )NSString         *lyric;
+(instancetype)lyricWordEntity:(NSString *)lyric;
@end

@interface KLyricLineEntity : NSObject

@property(nonatomic,strong)NSMutableArray   <KLyricWordEntity *>*words;
@property(nonatomic,assign)NSTimeInterval   beginTime;
@property(nonatomic,assign)NSTimeInterval   duration;
@property(nonatomic, copy )NSString         *lyric;

+(instancetype)lyricLineEntity:(NSString *)lyric;
@end

@interface KLyricData : NSObject

@property(nonatomic,strong)NSMutableArray      <KLyricLineEntity *>*lines;
@property(nonatomic, copy )NSString            *lyric;

+(instancetype)lyricData:(NSString *)lyric;
@end

NS_ASSUME_NONNULL_END
