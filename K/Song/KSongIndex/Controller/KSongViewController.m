//
//  KSongViewController.m
//  K
//
//  Created by efun on 2019/1/12.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KSongViewController.h"
#import "KSongListEntity.h"
#import "KSongListCell.h"
#import "KSongDownloadVC.h"
#import "KSongDownloadVM.h"

static NSString *kKSongListCell = @"kKSongListCell";
@interface KSongViewController ()<UITableViewDataSource,UITableViewDelegate,KSongListCellDelegate>

@property(nonatomic,strong)UITableView    *tableView;
@property(nonatomic,strong)NSArray   <KSongListEntity *>*datas;
@end

@implementation KSongViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)initializeSubviews{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Song" ofType:@"json"];
    NSString *json = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    self.datas = [NSArray yy_modelArrayWithClass:KSongListEntity.class json:json];
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.tableView];
}

- (void)initializeLayout{
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark - table view

-(UITableView *)tableView{
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate   = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = COLOR_F5F5F9;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = 80.f;
        [_tableView registerNib:[UINib nibWithNibName:@"KSongListCell" bundle:nil] forCellReuseIdentifier:kKSongListCell];
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.datas.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    KSongListCell *cell = [tableView dequeueReusableCellWithIdentifier:kKSongListCell];
    cell.delegate = self;
    [cell setEntity:self.datas[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(void)didClickButtonAtIndex:(NSInteger)index withEntity:(KSongListEntity *)entity{
    
    switch (index) {
        case 0:{
            KSongDownloadVM *downloadVM = [KSongDownloadVM new];
            downloadVM.entity           = entity;
            KSongDownloadVC *downloadVC = [KSongDownloadVC viewControllerWithVM:downloadVM];
            downloadVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:downloadVC animated:YES];
        }
            break;
        default:
            break;
    }
}

@end
