//
//  XYAlterView.m
//  huojian
//
//  Created by yb on 17/1/8.
//  Copyright © 2017年 yb. All rights reserved.
//

#import "XYAlterView.h"

@interface  XYAlterView()

@property(nonatomic,strong)UIButton *closeButton;
@property(nonatomic,strong)UIButton *cancelBt;
@property(nonatomic,strong)UIButton *sureBt;
@property(nonatomic,retain)UILabel *titleLb;
@property(nonatomic,retain)UILabel *contentLb;

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *cancel;
@property(nonatomic,copy)NSString *sure;

@end

@implementation XYAlterView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //背景view
        UIView *backView = [UIView new];
        backView.frame = CGRectMake(0, 0, 222.5, 365);
//        backView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2+6.25, [UIScreen mainScreen].bounds.size.height/2);
        backView.backgroundColor = [UIColor clearColor];
        [self addSubview:backView];
        
        UIView *huojianView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 210, 365)];
        huojianView.backgroundColor = [UIColor clearColor];
        [backView addSubview:huojianView];
        
        UIView *huoView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, 210, 305)];
        huoView.backgroundColor = [UIColor whiteColor];
        [huojianView addSubview:huoView];

        
        UIImageView *huojianImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 210, 107)];
        huojianImage.image = [UIImage imageNamed:@"huojian"];
        [huojianView addSubview:huojianImage];
        
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _closeButton.frame = CGRectMake(196, 8, 25, 25);
        [_closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [_closeButton addTarget:self action:@selector(cancelBtClick) forControlEvents:UIControlEventTouchUpInside];
        [huojianView addSubview:_closeButton];
        
        
        _titleLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
        _titleLb.center = CGPointMake(105, 150);
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.font = [UIFont systemFontOfSize:18];
        _titleLb.text = @"HELLO WORLD";
        [huojianView addSubview:_titleLb];
        
        _contentLb = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 100)];
        _contentLb.center = CGPointMake(105, 220);
        _contentLb.textAlignment = NSTextAlignmentCenter;
        _contentLb.font = [UIFont systemFontOfSize:14];
        _contentLb.numberOfLines = 0;
        [huojianView addSubview:_contentLb];
        
        
        UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 329, 210, 36)];
        bottomView.backgroundColor = [UIColor whiteColor];
        [huojianView addSubview:bottomView];
        
        UIView *grayView = [[UIView alloc]initWithFrame:CGRectMake(1, 0, 208, 2)];
        grayView.backgroundColor = [UIColor colorWithRed:183/255.0 green:183/255.0 blue:183/255.0 alpha:1];
        [bottomView addSubview:grayView];
        
        _cancelBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBt setTitle:@"稍后更新" forState:UIControlStateNormal];
        [_cancelBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _cancelBt.frame = CGRectMake(0,2, 208/2, 34);
        [_cancelBt addTarget:self action:@selector(cancelBtClick) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:_cancelBt];
        
        _sureBt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBt setTitle:@"立即更新" forState:UIControlStateNormal];
        [_sureBt setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _sureBt.frame = CGRectMake(208/2, 2, 208/2, 34);
        [_sureBt addTarget:self action:@selector(sureBtClick) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:_sureBt];
        
        UIView *verticalView = [[UIView alloc]initWithFrame:CGRectMake(208/2, 10, 1, 20)];
        verticalView.backgroundColor = [UIColor colorWithRed:183/255.0 green:183/255.0 blue:183/255.0 alpha:1];
        [bottomView addSubview:verticalView];
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:bottomView.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(5,5)];//圆角大小
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = bottomView.bounds;
        maskLayer.path = maskPath.CGPath;
        bottomView.layer.mask = maskLayer;
    }
    return self;
}
#pragma mark--给属性重新赋值
-(void)setTitle:(NSString *)title{
    _titleLb.text=title;
}
-(void)setContent:(NSString *)content{
    _contentLb.text=content;
}
-(void)setSure:(NSString *)sure{
    [_sureBt setTitle:sure forState:UIControlStateNormal];
}
-(void)setCancel:(NSString *)cancel{
    [_cancelBt setTitle:cancel forState:UIControlStateNormal];
}
#pragma mark----实现类方法
+(instancetype)alterViewWithTitle:(NSString *)title
                          content:(NSString *)content
                           cancel:(NSString *)cancel
                             sure:(NSString *)sure
                    cancelBtClcik:(cancelBlock)cancelBlock
                      sureBtClcik:(sureBlock)sureBlock{
    
    XYAlterView *alterView=[[XYAlterView alloc]initWithFrame:CGRectMake(0, 0, 222.5, 365)];
    alterView.backgroundColor=[UIColor clearColor];
    
    
    alterView.center = CGPointMake([UIScreen mainScreen].bounds.size.width/2+6.25, [UIScreen mainScreen].bounds.size.height/2);

    alterView.title = title;
    alterView.content = content;
    alterView.cancel_block=cancelBlock;
    alterView.sure_block=sureBlock;
    return alterView;
}

- (void)cancelBtClick{

    [self removeFromSuperview];
    self.cancel_block();
}

- (void)sureBtClick{

    [self removeFromSuperview];
    self.sure_block();
}

@end
