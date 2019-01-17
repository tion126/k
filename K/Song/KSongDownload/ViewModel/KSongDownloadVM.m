//
//  KSongDownloadVM.m
//  K
//
//  Created by efun on 2019/1/15.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KSongDownloadVM.h"

@implementation KSongDownloadVM

-(void)initialize{
    @weakify(self)
    self.decryptZrce = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
        self.entity.decryptedZrce = [Utils decryptZrce:self.entity.localZrc];
        return [RACSignal empty];
    }];
    
    self.download = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self)
    
        @weakify(self)
        [Utils batchDownloadFileWithEntity:self.entity progress:^(CGFloat progress) {
            @strongify(self)
            self.progress = progress;
        } success:^{
            @strongify(self)
            NSLog(@"ALL SUCCESS");
            [self.decryptZrce execute:nil];
        } failure:^(NSError *error, NSInteger statusCode) {
            
        }];
        
        return [RACSignal empty];
    }];
}

@end
