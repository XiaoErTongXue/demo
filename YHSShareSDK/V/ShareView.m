//
//  ShareView.m
//  YHSShareSDK
//
//  Created by yanhansi on 2017/4/13.
//  Copyright © 2017年 yanhansi. All rights reserved.
//

#define height  self.frame.size.height
#define width   self.frame.size.width

#import "ShareView.h"
#import "shareChildView.h"

@interface ShareView ()

@property(nonatomic, strong) UIScrollView *TopScroll;
@property (strong,nonatomic) NSArray  *iconArrT;
@property (strong,nonatomic) NSArray  *nameArrT;
@property(nonatomic, assign) CGFloat ScrollViewHeight;
@property(nonatomic, strong) UIView *line;
@property(nonatomic, strong) UIScrollView *BottomScroll;
@property (strong,nonatomic) NSArray  *iconArrB;
@property (strong,nonatomic) NSArray  *nameArrB;
@property(nonatomic, strong) UIButton *cancelButton;
@end

@implementation ShareView

- (NSArray *)iconArrT
{
    if (_iconArrT == nil) {
        
        _iconArrT = @[@"weixin",@"quan",@"shoucang",@"qq",@"kongjian",@"weibo"];;
        
    }
    return _iconArrT;
}
- (NSArray *)nameArrT
{
    if (_nameArrT == nil) {
        
        _nameArrT = @[@"微信",@"朋友圈",@"微信收藏",@"QQ",@"QQ空间",@"新浪微博"];
        
    }
    return _nameArrT;
}
- (NSArray *)iconArrB
{
    if (_iconArrB == nil) {
        
        _iconArrB = @[@"cangNo",@"lianjie"];;
        
    }
    return _iconArrB;
}
- (NSArray *)nameArrB
{
    if (_nameArrB == nil) {
        
        _nameArrB = @[@"收藏",@"复制链接"];
        
    }
    return _nameArrB;
}

+ (instancetype)shareView{
    
    return [[self alloc] init];
}

- (UIScrollView *)TopScroll{
    
    if (!_TopScroll) {
        UIScrollView *TopScroll = [[UIScrollView alloc] init];
        //隐藏水平滑块
        TopScroll.showsHorizontalScrollIndicator = NO;
        //delegate
        TopScroll.delegate = self;
        //子视图的偏移量
        //大于0:子视图向左向上移动；小于0:子视图向右向下移动
        TopScroll.contentOffset = CGPointMake(0, 0);
        [self addSubview:TopScroll];
        TopScroll.contentSize = CGSizeMake(75 * self.nameArrT.count + 15,0);
        
        // 添加子视图
        for (int i =0; i < self.nameArrT.count; i++) {
            
            shareChildView *childView = [[shareChildView alloc]initWithFrame:CGRectMake(15 + 75*i, 20, 60, 90)];
            [childView childViewWithIcon:self.iconArrT[i] WithName:self.nameArrT[i]];
            [TopScroll addSubview:childView];
        }
        
        _TopScroll = TopScroll;
    }
    return _TopScroll;
}

- (UIScrollView *)BottomScroll{
    
    if (!_BottomScroll) {
        UIScrollView *BottomScroll = [[UIScrollView alloc] init];
        //隐藏水平滑块
        BottomScroll.showsHorizontalScrollIndicator = NO;
        //delegate
        BottomScroll.delegate = self;
        //子视图的偏移量
        //大于0:子视图向左向上移动；小于0:子视图向右向下移动
        BottomScroll.contentOffset = CGPointMake(0, 0);
        [self addSubview:BottomScroll];
        BottomScroll.contentSize = CGSizeMake(75 * self.nameArrB.count + 15,0);
        
        // 添加子视图
        for (int i =0; i < self.nameArrB.count; i++) {
            
            shareChildView *childView = [[shareChildView alloc]initWithFrame:CGRectMake(15 + 75*i, 20, 60, 90)];
            [childView childViewWithIcon:self.iconArrB[i] WithName:self.nameArrB[i]];
            [BottomScroll addSubview:childView];
        }
        
        _BottomScroll = BottomScroll;
    }
    return _BottomScroll;
}

- (UIButton *)cancelButton{
    
    if (!_cancelButton) {
        UIButton *cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelButton.backgroundColor = [UIColor whiteColor];
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton setTitleColor:UIColorFromRGB(0X333333) forState:UIControlStateNormal];
        cancelButton.titleLabel.font = [UIFont systemFontOfSize:17];
        [self addSubview:cancelButton];
        _cancelButton = cancelButton;
    }
    return _cancelButton;
}

- (CGFloat)ScrollViewHeight{
    if (!_ScrollViewHeight) {
        return (height - 49)/2;
    }
    return _ScrollViewHeight;
}

- (UIView *)line{
    
    if (!_line) {
        UIView *line = [UIView new];
        line.backgroundColor = UIColorFromRGB(0Xd1d1d1);
        [self addSubview:line];
        _line = line;
    }
    return _line;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        // 初始化上部视图
        [self TopScroll];
        
        // 分割线
        [self line];
        
        // 初始化下部视图
        [self BottomScroll];
        
        // 取消按钮
        [self cancelButton];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    _TopScroll.frame = CGRectMake(0, 0, width, self.ScrollViewHeight);
    _line.frame = CGRectMake(0, CGRectGetHeight(_TopScroll.frame), width, 1);
    _BottomScroll.frame = CGRectMake(0, self.ScrollViewHeight + 1, width, self.ScrollViewHeight);
    _cancelButton.frame = CGRectMake(0, height - 49, width, 49);
}
@end
