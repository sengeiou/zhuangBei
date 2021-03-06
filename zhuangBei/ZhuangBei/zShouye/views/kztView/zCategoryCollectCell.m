//
//  zCategoryCollectCell.m
//  ZhuangBei
//
//  Created by aa on 2020/7/20.
//  Copyright © 2020 aa. All rights reserved.
//

#import "zCategoryCollectCell.h"
#import "UIImage+LWSVGKit.h"
#import "SVGKImage.h"

@interface zCategoryCollectCell ()

@property(strong,nonatomic)UIImageView * iconView;

@property(strong,nonatomic)UILabel * titleLabel;

@end

@implementation zCategoryCollectCell


-(UIImageView *)iconView
{
    if (!_iconView) {
        _iconView = [[UIImageView alloc]init];
//        _iconView.image = [UIImage imageNamed:@"kefuicon"];
        _iconView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconView;
}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = kFont(12);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor blackColor];
//        _titleLabel.text = @"爆款申请";
    }
    return _titleLabel;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.titleLabel];
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(kWidthFlot(45),kWidthFlot(45)));
        make.centerX.mas_equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(-kWidthFlot(30));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-kWidthFlot(5));
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(kWidthFlot(20));
    }];
}

-(void)setSourceDic:(NSDictionary *)sourceDic
{
    _sourceDic = sourceDic;
    NSString * imageName = _sourceDic[@"avatar"];
    NSString * itemid = _sourceDic[@"id"];
    if ([itemid integerValue] == 36 || [itemid integerValue] == 61) {
        imageName = @"shiti";
    }
//    [self.iconView setImage:[UIImage imageNamed:imageName]];
    UIImage * image = [self z_getImageWithSVG:[NSString stringWithFormat:@"%@.svg",imageName] andImageView:self.iconView];
    self.iconView.image = image;
    self.titleLabel.text = _sourceDic[@"groupname"];
}

- (UIImage *)z_getImageWithSVG:(NSString *)imageName
                  andImageView:(UIImageView*)imageView
{
    if (self.frame.size.width == 0 && self.frame.size.height == 0) {
        [self.superview layoutIfNeeded];
    }
    imageView.frame = CGRectMake(0,0, kWidthFlot(45), kWidthFlot(45));
    UIImage *img;
    if ([imageName hasSuffix:@".svg"]&& ![imageName containsString:@"gonggao"]) {
        @try {
            //        防止找不到该占位图的路径造成的崩溃
            img = [UIImage svgImageNamed:imageName imgv:imageView];
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
    }else{
        imageName = [imageName substringToIndex:imageName.length-4];
        img = IMAGENAME(imageName);
    }
    return img;
}

@end
