//
//  KSongRecordVM.h
//  K
//
//  Created by efun on 2019/1/17.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KBaseViewModel.h"
#import "KSongListEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface KSongRecordVM : KBaseViewModel

@property(nonatomic,strong)KSongListEntity   *entity;
@end

NS_ASSUME_NONNULL_END
