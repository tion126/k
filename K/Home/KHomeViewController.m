//
//  KHomeViewController.m
//  K
//
//  Created by efun on 2019/1/12.
//  Copyright © 2019 com.tion126. All rights reserved.
//

#import "KHomeViewController.h"
#import "KSongListEntity.h"
#import "KSongRecordVM.h"
#import "KSongRecordVC.h"

@interface KHomeViewController ()

@end

@implementation KHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    //test
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 30);
    button.backgroundColor = UIColor.grayColor;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
}

-(void)test{
    
   KSongListEntity *entity = [KSongListEntity yy_modelWithJSON:[[NSUserDefaults standardUserDefaults] objectForKey:@"kTestEntity"]];
    KSongRecordVM *recordVM = [KSongRecordVM new];
    recordVM.entity = entity;
    KSongRecordVC *recordVC = [KSongRecordVC viewControllerWithVM:recordVM];
    [self.navigationController pushViewController:recordVC animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
