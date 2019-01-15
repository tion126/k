//
//  KSongDownloadVM.h
//  K
//
//  Created by efun on 2019/1/15.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSongListEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSongDownloadVM : NSObject

@property(nonatomic,strong)KSongListEntity   *entity;
@property(nonatomic,strong)RACCommand        *decryptZrce;
@end

NS_ASSUME_NONNULL_END
