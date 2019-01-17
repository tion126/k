//
//  Utils.m
//  K
//
//  Created by efun on 2019/1/16.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(UIImage *)imageWithR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B A:(CGFloat)A{
    
    UIColor *color=[UIColor colorWithRed:R/255.0f green:G/255 blue:B/255 alpha:A];
    CGSize colorSize=CGSizeMake(1, 1);
    UIGraphicsBeginImageContext(colorSize);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    
    UIImage *img=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return img;
}

+(void)batchDownloadFileWithEntity:(KSongListEntity *)entity progress:(DowningProgress)progressCom success:(SuccessBlock)success failure:(DownLoadfailBlock)failure{
    
    NSArray <NSDictionary *>*urlArr = @[
                                        @{
                                            @"url":entity.mp3,
                                            @"local":entity.localMp3
                                            },
                                        @{
                                            @"url":entity.music,
                                            @"local":entity.localMusic
                                            },
                                        @{
                                            @"url":entity.zrc,
                                            @"local":entity.localZrc
                                            }
                                        ];
    
    dispatch_group_t batch_api_group = dispatch_group_create();
    [urlArr enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull dict, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_group_enter(batch_api_group);
        [[QDNetServerDownLoadTool sharedTool]AFDownLoadFileWithUrl:dict[@"url"] progress:^(CGFloat progress) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"%@______%.2f",[dict[@"url"] lastPathComponent],progress);
                progressCom(progress);
            });
        } fileLocalUrl:dict[@"local"] success:^(NSURL *fileUrlPath, NSURLResponse *response) {
            NSLog(@"%@>>>>>>>>",batch_api_group);
            NSLog(@"%@----------+",fileUrlPath.absoluteString);
            dispatch_group_leave(batch_api_group);
        } failure:failure];
    }];
    
    dispatch_group_notify(batch_api_group, dispatch_get_main_queue(), ^{
        
        success();
    });
}

+(NSString *)decryptZrce:(NSURL *)path{

    NSData *data = [NSData dataWithContentsOfURL:path];
    NSInteger index = 0;
    Byte *bytes = (Byte *)[data bytes];
    NSArray *tmp = @[@(-50),@(-45),@(110),@(105),@(64),@(90),@(97),@(119),@(94),@(50),@(116),@(71),@(81),@(54),@(-91),@(-68)];
    while (index < data.length) {
        bytes[index] = bytes[index] ^ [tmp[index % 16] integerValue];
        index++;
    }
    NSString *zrce = [[NSString alloc] initWithBytes:bytes length:data.length encoding:NSUTF8StringEncoding];
    return zrce;
}

@end
