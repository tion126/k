//
//  KSongListCell.h
//  K
//
//  Created by efun on 2019/1/15.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSongListEntity.h"

NS_ASSUME_NONNULL_BEGIN

@protocol KSongListCellDelegate <NSObject>

-(void)didClickButtonAtIndex:(NSInteger)index withEntity:(KSongListEntity *)entity;
@end

@interface KSongListCell : UITableViewCell

@property(nonatomic,weak)id<KSongListCellDelegate>  delegate;
-(void)setEntity:(KSongListEntity *)entity;
@end

NS_ASSUME_NONNULL_END
