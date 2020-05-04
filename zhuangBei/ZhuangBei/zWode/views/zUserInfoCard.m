//
//  zUserInfoCard.m
//  ZhuangBei
//
//  Created by aa on 2020/4/27.
//  Copyright © 2020 aa. All rights reserved.
//

#import "zUserInfoCard.h"

@interface zUserInfoCard ()

@property(strong,nonatomic)UIView * baseView;

@property(strong,nonatomic)UIButton * headerImageBtn;//头像

@property(strong,nonatomic)UIButton * nameBtn;//名字

@property(strong,nonatomic)UIButton * levelBtn;//会员

@property(strong,nonatomic)TYAttributedLabel * myInviteLabel;//我的邀请

@property(strong,nonatomic)TYAttributedLabel * myFollowLabel;//我的邀请

@property(strong,nonatomic)TYAttributedLabel * myBusinessLabel;//我的邀请

@property(strong,nonatomic)UIView * lineView;
@end

@implementation zUserInfoCard

-(UIView*)baseView
{
    if (!_baseView) {
        _baseView = [[UIView alloc]init];
        _baseView.backgroundColor = [UIColor whiteColor];
        _baseView.layer.cornerRadius = 15;
        _baseView.layer.borderColor = [UIColor whiteColor].CGColor;
        _baseView.layer.borderWidth = 1;
        _baseView.clipsToBounds = YES;
    }
    return _baseView;
}
-(UIView*)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [kMainSingleton colorWithHexString:@"#9B9B9B" alpha:1];
    }
    return _lineView;
}

-(UIButton*)headerImageBtn
{
    if (!_headerImageBtn) {
        _headerImageBtn = [[UIButton alloc]init];
        _headerImageBtn.layer.cornerRadius = kWidthFlot(50);
        _headerImageBtn.clipsToBounds = YES;
        [_headerImageBtn setBackgroundImage:[UIImage imageNamed:@"testicon"] forState:UIControlStateNormal];
    }
    return _headerImageBtn;
}

-(UIButton*)nameBtn
{
    if (!_nameBtn) {
        _nameBtn = [[UIButton alloc]init];
        _nameBtn.titleLabel.font = kFont(16);
        _nameBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_nameBtn setTitle:@"账号" forState:UIControlStateNormal];
        [_nameBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _nameBtn.clipsToBounds = YES;
    }
    return _nameBtn;
}

-(UIButton*)levelBtn
{
    if (!_levelBtn) {
        _levelBtn = [[UIButton alloc]init];
        _levelBtn.titleLabel.font = kFont(14);
        _levelBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_levelBtn setImage:[UIImage imageNamed:@"vip_crown"] forState:UIControlStateNormal];
        [_levelBtn setTitle:@"会员等级" forState:UIControlStateNormal];
        [_levelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _levelBtn.clipsToBounds = YES;
    }
    return _levelBtn;
}


-(TYAttributedLabel*)myInviteLabel
{
    if (!_myInviteLabel) {
        _myInviteLabel = [[TYAttributedLabel alloc]initWithFrame:CGRectMake(0,0,kWidthFlot(100),kWidthFlot(40))];
        _myInviteLabel.translatesAutoresizingMaskIntoConstraints = NO;
//        _myInviteLabel.font = kFont(14);
        NSString * labelStr = @"我的邀请人 \n 0";
        NSString * num = @"0";
         TYTextContainer *textStorage = [self creatTextContainerWithCurrentStr:num totalStr:labelStr];
        _myInviteLabel.textContainer = textStorage;
        [self updateTYTLabel:_myInviteLabel];
        UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)];
        [_myInviteLabel addGestureRecognizer:labelTapGestureRecognizer];
    }
    return _myInviteLabel;
}

-(TYAttributedLabel*)myFollowLabel
{
    if (!_myFollowLabel) {
        _myFollowLabel = [[TYAttributedLabel alloc]initWithFrame:CGRectMake(0,0,kWidthFlot(100),kWidthFlot(40))];
        _myFollowLabel.translatesAutoresizingMaskIntoConstraints = NO;
        NSString * labelStr = @"我关注的货源 \n 0";
        NSString * num = @"0";
         TYTextContainer *textStorage = [self creatTextContainerWithCurrentStr:num totalStr:labelStr];
        _myFollowLabel.textContainer = textStorage;
        [self updateTYTLabel:_myFollowLabel];
        UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)];
        [_myFollowLabel addGestureRecognizer:labelTapGestureRecognizer];
    }
    return _myFollowLabel;
}

-(TYAttributedLabel*)myBusinessLabel
{
    if (!_myBusinessLabel) {
        _myBusinessLabel = [[TYAttributedLabel alloc]initWithFrame:CGRectMake(0,0,kWidthFlot(100),kWidthFlot(40))];
        _myBusinessLabel.translatesAutoresizingMaskIntoConstraints = NO;
        NSString * labelStr = @"我的经销商 \n 0";
        NSString * num = @"0";
         TYTextContainer *textStorage = [self creatTextContainerWithCurrentStr:num totalStr:labelStr];
        _myBusinessLabel.textContainer = textStorage;
        [self updateTYTLabel:_myBusinessLabel];
        UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)];
        [_myBusinessLabel addGestureRecognizer:labelTapGestureRecognizer];
    }
    return _myBusinessLabel;
}



-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.baseView];
        [self.baseView addSubview:self.headerImageBtn];
        [self.baseView addSubview:self.nameBtn];
        [self.baseView addSubview:self.levelBtn];
        [self.baseView addSubview:self.myInviteLabel];
        [self.baseView addSubview:self.myFollowLabel];
        [self.baseView addSubview:self.myBusinessLabel];
        [self.baseView addSubview:self.lineView];
        [self updateConstraintsForView];
    }
    return self;
}

-(void)updateConstraintsForView
{
    [self.baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    [self.headerImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kWidthFlot(20));
        make.top.mas_equalTo(kWidthFlot(10));
        make.size.mas_equalTo(CGSizeMake(kWidthFlot(100),kWidthFlot(100)));
    }];
    
    [self.nameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headerImageBtn.mas_right).offset(kWidthFlot(10));
        make.top.mas_equalTo(self.headerImageBtn.mas_top).offset(kWidthFlot(10));
        make.right.mas_equalTo(-kWidthFlot(10));
        make.height.mas_equalTo(kWidthFlot(20));
    }];
    
    [self.levelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headerImageBtn.mas_right).offset(kWidthFlot(10));
        make.top.mas_equalTo(self.nameBtn.mas_bottom).offset(kWidthFlot(10));
        make.right.mas_equalTo(-kWidthFlot(10));
        make.height.mas_equalTo(kWidthFlot(20));
    }];
    
    [self.myInviteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kWidthFlot(10));
        make.top.mas_equalTo(self.headerImageBtn.mas_bottom).offset(kWidthFlot(10));
        make.width.mas_equalTo(kWidthFlot(120));
        make.height.mas_equalTo(kWidthFlot(50));
    }];
    [self.myFollowLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.headerImageBtn.mas_bottom).offset(kWidthFlot(10));
        make.width.mas_equalTo(kWidthFlot(120));
        make.height.mas_equalTo(kWidthFlot(50));
    }];
    [self.myBusinessLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(self.headerImageBtn.mas_bottom).offset(kWidthFlot(10));
        make.width.mas_equalTo(kWidthFlot(120));
        make.height.mas_equalTo(kWidthFlot(50));
    }];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kWidthFlot(40));
        make.right.mas_equalTo(-kWidthFlot(40));
        make.bottom.mas_equalTo(-kWidthFlot(20));
        make.height.mas_equalTo(kWidthFlot(0.5));
    }];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.myInviteLabel setNeedsLayout];
    [self.myInviteLabel layoutIfNeeded];
    
    [_baseView setNeedsLayout];
    [_baseView layoutIfNeeded];
    UIBezierPath *shadowPath = [UIBezierPath
    bezierPathWithRect:_baseView.bounds];
    _baseView.layer.masksToBounds = NO;
    _baseView.layer.shadowColor = [UIColor blackColor].CGColor;
    _baseView.layer.shadowOffset = CGSizeMake(0.0f, 5.0f);
    _baseView.layer.shadowOpacity = 0.1f;
    _baseView.layer.shadowPath = shadowPath.CGPath;
}


-(void)labelClick{
    NSLog(@"点击邀请人");
}

-(void)setMyNumbers:(NSString *)myNumbers
{
    NSString * labelStr = [NSString stringWithFormat:@"我的邀请人 \n %@",myNumbers];
    NSString * num = myNumbers;
     TYTextContainer *textStorage = [self creatTextContainerWithCurrentStr:num totalStr:labelStr];
    _myInviteLabel.textContainer = textStorage;
    [self updateTYTLabel:_myInviteLabel];
    
    NSString * followStr = [NSString stringWithFormat:@"我关注的货源 \n %@",myNumbers];
     TYTextContainer * follwtextStorage = [self creatTextContainerWithCurrentStr:myNumbers totalStr:followStr];
    _myFollowLabel.textContainer = follwtextStorage;
    [self updateTYTLabel:_myFollowLabel];
    
    NSString * businessStr = [NSString stringWithFormat:@"我的经销商 \n %@",myNumbers];
     TYTextContainer *businesstextStorage = [self creatTextContainerWithCurrentStr:myNumbers totalStr:businessStr];
    _myBusinessLabel.textContainer = businesstextStorage;
    [self updateTYTLabel:_myBusinessLabel];
}

-(void)updateTYTLabel:(TYAttributedLabel*)label
{
    label.backgroundColor = [UIColor clearColor];
    // 水平对齐方式
    label.textAlignment = kCTTextAlignmentCenter;
    // 垂直对齐方式
    label.verticalAlignment = TYVerticalAlignmentCenter;
    // 文字间隙
    label.characterSpacing = 2;
    // 文本行间隙
    label.linesSpacing = 10;
}

//初始化文字信息 设置颜色及点击事件
-(TYTextContainer*)creatTextContainerWithCurrentStr:(NSString*)currentStr totalStr:(NSString*)total
{
    TYTextContainer *textContainer = [[TYTextContainer alloc]init];
//    张九龄
    NSString * string = [currentStr substringFromIndex:currentStr.length];
    NSString * text = total;
    textContainer.text = text;
    
    //取出需要变色的字
    TYTextStorage *textheader = [[TYTextStorage alloc]init];
    textheader.range = [text rangeOfString:currentStr];
    textheader.textColor = [UIColor blackColor];
    textheader.font = [UIFont fontWithName:@"TamilSangamMN-Bold" size:kWidthFlot(18)];
    [textContainer addTextStorage:textheader];

    //取出剩余的字
    TYTextStorage *textStorage = [[TYTextStorage alloc]init];
    textStorage.range = [text rangeOfString:string];
    textStorage.textColor = [UIColor blackColor];
    textStorage.font = [UIFont fontWithName:@"TamilSangamMN-Bold" size:kWidthFlot(10)];
    [textContainer addTextStorage:textStorage];
    textContainer.linesSpacing = 5;
    textContainer = [textContainer createTextContainerWithTextWidth:kWidthFlot(100)];
    return textContainer;
}

@end
