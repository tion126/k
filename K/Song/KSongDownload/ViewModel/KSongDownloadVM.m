//
//  KSongDownloadVM.m
//  K
//
//  Created by efun on 2019/1/15.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KSongDownloadVM.h"

@implementation KSongDownloadVM

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}


-(void)initialize{
    
    @weakify(self)
    self.decryptZrce = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        
        
        return [RACSignal empty];
    }];
}

@end
