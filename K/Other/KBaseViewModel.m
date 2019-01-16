//
//  KSongDownloadVC.h
//  K
//
//  Created by TION126 on 2019/1/15.
//  Copyright © 2019 com.tion126. All rights reserved.
//


#import "KBaseViewModel.h"

@implementation KBaseViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self initialize];
    }
    return self;
}


-(void)initialize{}


- (void)dealloc
{
    NSLog(@"dealloc_______%@",NSStringFromClass([self class]));
}

@end
