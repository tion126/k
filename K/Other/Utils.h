//
//  Utils.h
//  K
//
//  Created by efun on 2019/1/16.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QDNetServerDownLoadTool.h"
#import "KSongListEntity.h"

typedef void (^SuccessBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface Utils : NSObject

+(UIImage *)imageWithR:(CGFloat)R G:(CGFloat)G B:(CGFloat)B A:(CGFloat)A;

+(void)batchDownloadFileWithEntity:(KSongListEntity *)entity
                       progress:(DowningProgress)progress
                        success:(SuccessBlock)success
                        failure:(DownLoadfailBlock)failure;

+(NSString *)decryptZrce:(NSURL *)path;
@end

NS_ASSUME_NONNULL_END
