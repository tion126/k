//
//  KLyricData.m
//  K
//
//  Created by efun on 2019/1/18.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KLyricData.h"

@implementation KLyricWordEntity

+(instancetype)lyricWordEntity:(NSString *)lyric{
    
    KLyricWordEntity *entity = [KLyricWordEntity new];
    return entity;
}
@end

@implementation KLyricLineEntity

+(instancetype)lyricLineEntity:(NSString *)lyric{
    
    KLyricLineEntity *entity = [KLyricLineEntity new];
    
    NSString *timeString = [Utils substring:lyric withinBoundsLeft:@"[" right:@"]"];
    NSRange range = [timeString rangeOfString:@","];
    entity.beginTime = [[timeString substringToIndex:range.location] floatValue];
    entity.duration = [[timeString substringFromIndex:range.location + 1] floatValue];
    
    NSString *pattern = @"<\\d+\\,\\d+\\,\\d+>[^<]+";
    NSRegularExpression *regularExp = [[NSRegularExpression alloc]initWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSArray<NSTextCheckingResult*>* results = [regularExp matchesInString:lyric options:NSMatchingReportProgress range:NSMakeRange(0, lyric.length)];
    
    NSMutableArray<KLyricWordEntity *> *parts = [NSMutableArray array];
    NSMutableString *lineLyric = [NSMutableString string];
    for (NSTextCheckingResult *result in results) {
        
        NSString *linePartString = [lyric substringWithRange:result.range];
        KLyricWordEntity *linePart = [KLyricWordEntity lyricWordEntity:linePartString];
        [parts addObject:linePart];
        [lineLyric appendString:linePartString];
    }
    entity.lyric = lineLyric.copy;
    entity.words = parts.copy;
    
    return entity;
}
@end

@implementation KLyricData

+(instancetype)lyricData:(NSString *)lyric{
    
    KLyricData *data = [KLyricData new];
    data.lyric = lyric;
    NSArray *lyricArr = [lyric componentsSeparatedByString:@"\n"];
    NSPredicate *filter = [NSPredicate predicateWithFormat:@"!(self BEGINSWITH '[chorus:' || self BEGINSWITH '[ar:' || self BEGINSWITH '[ti:' || self BEGINSWITH '[total:')"];
    lyricArr = [lyricArr filteredArrayUsingPredicate:filter];
    NSMutableArray *lines = [NSMutableArray array];
    for (NSString *lineLyric in lyricArr) {
        KLyricLineEntity *entity = [KLyricLineEntity lyricLineEntity:lineLyric];
        [lines addObject:entity];
    }
    data.lines = lines;
    
    return data;
}
@end
