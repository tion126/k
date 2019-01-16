//
//  KSongListEntity.m
//  K
//
//  Created by efun on 2019/1/15.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KSongListEntity.h"

@implementation KSongListEntity

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic{
    
    NSString *localPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    self.localMp3 = [NSURL fileURLWithPath:[localPath  stringByAppendingPathComponent:self.mp3.lastPathComponent] isDirectory:NO];
    self.localMusic = [NSURL fileURLWithPath:[localPath  stringByAppendingPathComponent:self.music.lastPathComponent] isDirectory:NO];
    self.localZrc = [NSURL fileURLWithPath:[localPath  stringByAppendingPathComponent:self.zrc.lastPathComponent] isDirectory:NO];
    
    return YES;
}

@end
