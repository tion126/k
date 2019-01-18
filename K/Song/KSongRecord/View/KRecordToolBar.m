//
//  KRecordToolBar.m
//  K
//
//  Created by efun on 2019/1/18.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KRecordToolBar.h"

@interface KRecordToolBar()

@end

@implementation KRecordToolBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

-(void)initialize{
    
    self.barStyle = UIBarStyleBlackTranslucent;
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:4];
    for (NSInteger index = 0; index < 4; index ++) {
        NSString *imageName = [NSString stringWithFormat:@"RecordView_item%li",(long)index + 1];
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:CreatImage(imageName) style:UIBarButtonItemStylePlain target:self action:@selector(didTapItem:)];
        item.tag = index;
        item.width = SCREEN_WIDTH/4;
        [items addObject:item];
    }
    self.items = items;
}

-(void)didTapItem:(UIBarButtonItem *)item{
    
    NSLog(@"%li_____",(long)item.tag);
}

@end
