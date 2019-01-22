//
//  KAudioManager.h
//  K
//
//  Created by efun on 2019/1/18.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSongListEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface KAudioManager : NSObject
interfaceSingleton(KAudioManager);

-(void)setData:(KSongListEntity *)data;

-(void)start;

-(void)stop;

-(void)requestPermission;
@end

NS_ASSUME_NONNULL_END
