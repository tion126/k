//
//  KLyricTableView.h
//  K
//
//  Created by tion126 on 2019/1/18.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KLyricData.h"

NS_ASSUME_NONNULL_BEGIN

@interface KLyricTableView : UITableView

+(instancetype)createWithData:(KLyricData *)data;
@end

NS_ASSUME_NONNULL_END
