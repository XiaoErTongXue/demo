//
//  ShareManager.h
//  YHSShareSDK
//
//  Created by yanhansi on 2017/4/11.
//  Copyright © 2017年 yanhansi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareManager : NSObject

+ (void) share:(UIViewController *)viewC;

@property (nonatomic, strong) UIViewController *ba;
@end
