//
//  ShareManager.m
//  YHSShareSDK
//
//  Created by yanhansi on 2017/4/11.
//  Copyright © 2017年 yanhansi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareManager.h"
#import "ShareViewController.h"

@interface ShareManager ()<UIGestureRecognizerDelegate>
{
    UITapGestureRecognizer *tap;
}
@end

@implementation ShareManager
UIView *bottomView;
static ShareManager *shareManager = nil;
#pragma mark - 初始化
-(instancetype)init{
    if (self = [super init]) {
        [self initBackView];
    }
    return self;
}

#pragma mark - 初始化深色背景
-(void)initBackView{
    bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_width, kScreen_height)];
    bottomView.userInteractionEnabled = YES;
    bottomView.backgroundColor = [UIColor blackColor];
    bottomView.alpha = 0.5;
    bottomView.hidden = YES;
}

#pragma mark - 单例
+(instancetype )shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareManager = [[self alloc] init];
    });
    return shareManager;
}

+(void)share:(UIViewController *)viewC{
    [self shareView:viewC];
}

#pragma mark - 深色背景
-(void)showBackView{
    bottomView.hidden = NO;
}
-(void)hideBackView{
    bottomView.hidden = YES;
    [tap removeTarget:nil action:nil];
}

#pragma mark - 添加手势,触摸屏幕将提示框隐藏
-(void)addGestureInView:(UIView *)view{
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTheScreen:)];
    tap.delegate = [shareManager viewController];
    [view addGestureRecognizer:tap];
}

#pragma mark -点击屏幕
-(void)tapTheScreen:(UIGestureRecognizer *)gap{
    NSLog(@"点击屏幕");
    [shareManager hideBackView];
    [tap removeTarget:nil action:nil];
    [ShareManager hideAlert];
}

#pragma mark - 解决手势冲突
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([touch.view isKindOfClass:[ShareManager class]]) {
        return YES;
    }else{
        return NO;
    }
}
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    return YES;
}

#pragma mark - 隐藏view
+(void)hideAlert{
    [shareManager hideBackView];
    
    //使用方法：
    [[shareManager viewController] dismissViewControllerAnimated:YES completion:^{
        NSLog(@"消失");
    }];
}


#pragma mark - 分享方法
+ (void) shareView:(UIViewController *) viewC{
    [self shareManager];
    
    ShareViewController *share = [[ShareViewController alloc]init];
    share.modalPresentationStyle=UIModalPresentationOverCurrentContext;
    share.view.backgroundColor = [UIColor clearColor];
    [viewC presentViewController:share animated:YES completion:^{
        NSLog(@"加载成功");
    }];
    
    [self addAnimation:viewC.view];
    
    [viewC.view addSubview:bottomView];
    
    [shareManager showBackView];
    [shareManager addGestureInView:share.view];
}

//获取View所在的Viewcontroller方法
- (UIViewController *)viewController {
    for (UIView* next = [bottomView superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

#pragma mark - 加载动画
+ (void)addAnimation:(UIView *)view{
    
    CATransition *applicationLoadViewIn =[CATransition animation];
    [applicationLoadViewIn setDuration:0.2];
    [applicationLoadViewIn setType:kCATransitionFade];
    [applicationLoadViewIn setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    
    [[view layer]addAnimation:applicationLoadViewIn forKey:kCATransitionReveal];
}

@end
