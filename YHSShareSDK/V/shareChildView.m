//
//  shareChildView.m
//  GouTrip
//
//  Created by Sich on 17/2/16.
//  Copyright © 2017年  . All rights reserved.
//

#define height  self.frame.size.height
#define width   self.frame.size.width

#import "shareChildView.h"

@interface shareChildView()
/**  */
@property (strong,nonatomic) UIImageView *icon;
/**  */
@property (strong,nonatomic) UILabel  *name;

@end

@implementation shareChildView

- (void)childViewWithIcon:(NSString *)iconStr WithName:(NSString *)nameStr{
    
    _icon.image = [UIImage imageNamed:iconStr];
    
    _name.text = nameStr;
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}
- (void)createUI{
    _icon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,width, width)];
    [self addSubview:_icon];
    
    _name = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_icon.frame), width, 30)];
    _name.font = [UIFont systemFontOfSize:11];
    _name.textAlignment = NSTextAlignmentCenter;
    _name.textColor = UIColorFromRGB(0x999999);
    [self addSubview:_name];
    
}
@end
