//
//  ViewController.m
//  YHSShareSDK
//
//  Created by yanhansi on 2017/4/11.
//  Copyright © 2017年 yanhansi. All rights reserved.
//

#import "ViewController.h"
#import "ShareManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor orangeColor];
}

- (IBAction)share:(id)sender {
    
    [ShareManager share:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
