//
//  LWUpdateVersionView.m
//  ZhuangBei
//
//  Created by LWQ on 2020/7/21.
//  Copyright © 2020 aa. All rights reserved.
//

#import "LWUpdateVersionView.h"

@interface LWUpdateVersionView ()
@property (nonatomic, strong) UIView * bgView;
@property (nonatomic, strong) UIView * bgmarkView;
@property (nonatomic, strong) LWUpdateVersionModel * model;
@end

@implementation LWUpdateVersionView

+ (instancetype)showWithModel:(LWUpdateVersionModel *)model
{
    LWUpdateVersionView *instance = [[LWUpdateVersionView alloc] init];
    instance.model = model;
    [instance configureUI];
    return instance;
}

- (void)configureUI
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIView *bgmarkView = [UIView new];
    _bgmarkView = bgmarkView;
    bgmarkView.backgroundColor = UIColor.blackColor;
    bgmarkView.alpha = 0.3;
    [window addSubview:bgmarkView];
    [bgmarkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(window);
    }];
    
    [window addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(window.mas_centerX);
        make.centerY.mas_equalTo(window.mas_centerY);
        make.width.mas_equalTo(window.mas_width).multipliedBy(0.75);
        make.height.mas_lessThanOrEqualTo(window.mas_height).multipliedBy(0.9);
        make.height.mas_greaterThanOrEqualTo(window.mas_height).multipliedBy(0.3);
    }];
}

- (void)clickBtnLeft
{
    [self dismiss];
}

- (void)clickBtnRight
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/app/id1513804704"] ];
}

- (void)dismiss
{
    [_bgmarkView removeFromSuperview];
    _bgmarkView = nil;
    [_bgView removeFromSuperview];
    _bgView = nil;
}

- (void)__dismiss
{
    if (_model.isForceUpdate == 2) {
        return;
    }
    [self dismiss];
}

- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = UIColor.whiteColor;
        [_bgView ex_addTapAction:self selector:@selector(__dismiss)];
        
        UILabel *titelL = [LWLabel labelWithFont:kFont(15) text:@"新版本上线了" textColor:BASECOLOR_TEXTCOLOR ];
        titelL.textAlignment = NSTextAlignmentCenter;
        
        UIView *line1 = [UIView new];
        line1.backgroundColor = BASECOLOR_BOARD;
        
        UIView *line2 = [UIView new];
        line2.backgroundColor = BASECOLOR_BOARD;
        
        UIView *line3 = [UIView new];
        line3.backgroundColor = BASECOLOR_BOARD;
        
        UILabel *contentL = [LWLabel labelWithFont:kFont(14) text:@"" textColor:BASECOLOR_TEXTCOLOR];
        contentL.numberOfLines = 0;
        if (_model) {
            contentL.text = _model.updateDetails;
        }
        
        UIButton *btn1 = [LWButton lw_button:@"忽略" font:14 textColor:BASECOLOR_TEXTCOLOR backColor:UIColor.whiteColor target:self acction:@selector(clickBtnLeft)];
        
        UIButton *btn2 = [LWButton lw_button:@"马上尝试" font:14 textColor:BASECOLOR_TEXTCOLOR backColor:UIColor.whiteColor target:self acction:@selector(clickBtnRight)];
        
        [_bgView addSubviews:@[titelL,line1,line2,line3,contentL,btn1,btn2]];
        
        [titelL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(_bgView).mas_offset(0);
            make.top.mas_equalTo(_bgView.mas_top).mas_offset(0);
            make.height.mas_offset(40);
        }];
        [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(_bgView).mas_offset(0);
            make.top.mas_equalTo(titelL.mas_bottom).mas_offset(0);
            make.height.mas_offset(0.5);
        }];
        
        [contentL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_bgView.mas_left).mas_offset(15);
            make.right.mas_equalTo(_bgView.mas_right).mas_offset(-15);
            make.top.mas_equalTo(line1.mas_bottom).mas_offset(10);
        }];
        [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(_bgView).mas_offset(0);
            make.top.mas_equalTo(contentL.mas_bottom).mas_offset(10);
            make.height.mas_offset(0.5);
        }];
        if(_model.isForceUpdate == 2){
            line3.hidden = btn1.hidden = YES;
            [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(_bgView.mas_left).mas_offset(5);
                make.right.mas_equalTo(_bgView.mas_right).mas_offset(-5);
                make.top.mas_equalTo(line2.mas_bottom).mas_offset(0);
                make.height.mas_offset(40);
                make.bottom.mas_equalTo(_bgView.mas_bottom).mas_offset(0);
            }];
        }else{
            line3.hidden = btn1.hidden = NO;
            [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(_bgView.mas_left).mas_offset(5);
                make.right.mas_equalTo(line3.mas_left).mas_offset(-0);
                make.top.mas_equalTo(line2.mas_bottom).mas_offset(0);
                make.height.mas_offset(40);
                make.bottom.mas_equalTo(_bgView.mas_bottom).mas_offset(0);
            }];
            [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(line3.mas_right).mas_offset(0);
                make.right.mas_equalTo(_bgView.mas_right).mas_offset(-5);
                make.top.mas_equalTo(line2.mas_bottom).mas_offset(0);
                make.height.mas_equalTo(btn1.mas_height);
            }];
        }
        [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_bgView.mas_centerX);
            make.top.mas_equalTo(btn2.mas_top).mas_offset(10);
            make.bottom.mas_equalTo(btn2.mas_bottom).mas_offset(-10);
            make.width.mas_offset(0.5);
        }];
        [_bgView setBoundWidth:0 cornerRadius:10];
        
    }
    return _bgView;
}

-(void)dealloc
{
    NSLog(@"%s",__func__);
}

@end
