//
//  KSongDownloadVC.h
//  K
//
//  Created by TION126 on 2019/1/15.
//  Copyright © 2019 com.tion126. All rights reserved.
//


#import <UIKit/UIKit.h>

@class KBaseViewModel;
@interface KBaseViewController : UIViewController

+(instancetype)viewControllerWithVM:(KBaseViewModel *)viewModel;

+(instancetype)viewController;

- (void)initializeSubviews;

- (void)initializeLayout;

- (void)initializeRAC;

@end
