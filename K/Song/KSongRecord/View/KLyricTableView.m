//
//  KLyricTableView.m
//  K
//
//  Created by tion126 on 2019/1/18.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KLyricTableView.h"
#import "KLyricTableViewCell.h"

static NSString *KKLyricTableViewCell = @"KLyricTableViewCell";
@interface KLyricTableView()<UITableViewDataSource>

@property (strong,nonatomic) KLyricData *data;
@end

@implementation KLyricTableView

+(instancetype)createWithData:(KLyricData *)data{
    
    KLyricTableView *tableView = [[KLyricTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.data = data;
    [tableView reloadData];
    return tableView;
}

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        
        self.separatorStyle  = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = UIColor.clearColor;
        self.clipsToBounds   = YES;
        self.dataSource      = self;
        self.rowHeight       = 60.f;
        self.showsVerticalScrollIndicator = NO;
        [self registerClass:KLyricTableViewCell.class forCellReuseIdentifier:KKLyricTableViewCell];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.lines.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KLyricTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:KKLyricTableViewCell];
    [cell setEntity:self.data.lines[indexPath.row]];
    return cell;
}

@end
