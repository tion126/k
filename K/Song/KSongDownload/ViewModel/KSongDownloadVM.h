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

@interface KSongDownloadVM : KBaseViewModel

@property(nonatomic,assign)CGFloat            progress;
@property(nonatomic,strong)KSongListEntity   *entity;
@property(nonatomic,strong)RACCommand        *decryptZrce;
@property(nonatomic,strong)RACCommand        *download;
@end

NS_ASSUME_NONNULL_END
