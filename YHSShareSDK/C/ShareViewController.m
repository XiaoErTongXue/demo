//
//  ShareViewController.m
//  YHSShareSDK
//
//  Created by yanhansi on 2017/4/11.
//  Copyright © 2017年 yanhansi. All rights reserved.
//

#import "ShareViewController.h"
#import "ShareView.h"

@interface ShareViewController ()

@property (nonatomic, strong) ShareView *shareView;
@end

@implementation ShareViewController

- (ShareView*)shareView
{
    if (!_shareView) {
        _shareView = [ShareView shareView];
        _shareView.backgroundColor = UIColorFromRGB(0Xf2f2f2);
        [self.view addSubview:_shareView];
    }
    return _shareView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 初始化ShareView
    [self shareView];
}

- (void)viewDidLayoutSubviews{
    
    _shareView.frame = CGRectMake(0, kScreen_height -  0.4 * kScreen_height, kScreen_width, 0.4 * kScreen_height);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
