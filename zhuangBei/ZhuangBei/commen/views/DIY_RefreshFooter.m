//
//  DIY_RefreshFooter.m
//  guoziyunparent
//
//  Created by aa on 2019/8/27.
//  Copyright © 2019 xuxianwang. All rights reserved.
//

#import "DIY_RefreshFooter.h"

@interface DIY_RefreshFooter ()
@property (weak, nonatomic) UILabel *label;
@property (strong,nonatomic)UIView * lineView;
@property (strong,nonatomic)UIView * lineView1;
@property (weak, nonatomic) UIActivityIndicatorView *loading;
@end
@implementation DIY_RefreshFooter
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h = 50;
    
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.lineView];
    self.lineView1 = [[UIView alloc]init];
    self.lineView1.backgroundColor = [UIColor clearColor];
    [self addSubview:self.lineView1];
    // 添加label
    UILabel *label = [[UILabel alloc] init];
    label.textColor =[UIColor colorWithHexString:@"#777777"];
    label.font = [UIFont systemFontOfSize:12];
//    label.backgroundColor = [UIColor defaultBG];
//    label.textColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.0 alpha:1.0];
//    label.font = [UIFont boldSystemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    self.label = label;
    
    // 打酱油的开关
    
    
    // loading
    UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [self addSubview:loading];
    self.loading = loading;
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    
    [self.label sizeToFit];
    self.label.bounds = CGRectMake(0,0,90,self.mj_h * 0.5);
    self.label.center =CGPointMake(self.mj_w * 0.5,self.mj_h * 0.5);
    
    CGFloat lineWidth = (self.mj_w / 2 - self.label.bounds.size.width) / 2;
    self.lineView.frame = CGRectMake(self.label.frame.origin.x - lineWidth - 3, self.mj_h * 0.5, lineWidth, 0.5);
    self.lineView1.frame = CGRectMake(self.label.frame.origin.x + self.label.bounds.size.width + 3, self.mj_h * 0.5, lineWidth, 0.5);
    
    self.loading.center =  CGPointMake(self.mj_w *0.5 -65 ,self.mj_h * 0.5);

}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    
}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
        {
            [self.loading stopAnimating];
            self.lineView.alpha = 0;
            self.lineView1.alpha = 0;
            self.label.text = @"加载中...";
            break;
        }
        case MJRefreshStatePulling:
        {
            [self.loading stopAnimating];
            self.lineView.alpha = 0;
            self.lineView1.alpha = 0;
            self.label.text = @"加载中...";
            break;
        }
        case MJRefreshStateRefreshing:
        {
            [self.loading startAnimating];
            self.lineView.alpha = 0;
            self.lineView1.alpha = 0;
            self.label.text = @"加载中...";
            break;
        }
        case MJRefreshStateNoMoreData:
        {
            [self.loading stopAnimating];
            self.lineView.alpha = 1;
            self.lineView1.alpha = 1;
            self.label.text = @"没有更多内容了";
        }
        default:
            break;
    }
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
    
    // 1.0 0.5 0.0
    // 0.5 0.0 0.5
//    CGFloat red = 1.0 - pullingPercent * 0.5;
//    CGFloat green = 0.5 - 0.5 * pullingPercent;
//    CGFloat blue = 0.5 * pullingPercent;
//    self.label.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end
