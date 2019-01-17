//
//  KSongListEntity.h
//  K
//
//  Created by efun on 2019/1/15.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSongListEntity : NSObject

@property(nonatomic, copy )NSString     *songid;
@property(nonatomic, copy )NSString     *name;
@property(nonatomic, copy )NSString     *artist;
@property(nonatomic, copy )NSString     *mp3;
@property(nonatomic, copy )NSString     *music;
@property(nonatomic, copy )NSString     *zbd;
@property(nonatomic, copy )NSString     *zrc;
@property(nonatomic, copy )NSString     *mel;
@property(nonatomic, copy )NSString     *secondAdditionInfo;
@property(nonatomic, copy )NSString     *icon;

@property(nonatomic,strong)NSURL        *localMp3;
@property(nonatomic,strong)NSURL        *localMusic;
@property(nonatomic,strong)NSURL        *localZrc;
@property(nonatomic, copy )NSString     *decryptedZrce;

@end

NS_ASSUME_NONNULL_END
