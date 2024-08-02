//
//  CartToolBar.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/2.
//

#import "CartToolBar.h"

@interface CartToolBar ()

@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) UIButton *selectBtn;
@property (nonatomic, strong) UILabel *priceTips;
@property (nonatomic, strong) UILabel *priceLbl;
@property (nonatomic, strong) UIView *costBtn;
@end

@implementation CartToolBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    {
        UIView *container = [[UIView alloc] init];
        container.frame = CGRectMake(0,668,375,66);
        container.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _container = container;
        [self addSubview:container];
        [container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.bottom.mas_equalTo(0);
        }];
        
        {
            UIButton *selectBtn = [UIButton tmui_button];
            [selectBtn setImage:UIImageMake(@"cart_unselect") forState:UIControlStateNormal];
            [selectBtn setImage:UIImageMake(@"cart_select") forState:UIControlStateSelected];
            selectBtn.tmui_text = @"全选";
            selectBtn.tmui_font = UIFont(12);
            selectBtn.tmui_titleColor = UIColorHexString(@"#B2B2B2");
            [container addSubview:selectBtn];
            _selectBtn = selectBtn;
            [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(24);
                make.centerY.mas_equalTo(container);
                make.width.mas_equalTo(60);
            }];
        }
        
        {
            UILabel *priceTips = [[UILabel alloc] init];
            priceTips.frame = CGRectMake(188,691,67,20);
            priceTips.numberOfLines = 0;
            [container addSubview:priceTips];
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"合计：¥"attributes: @{NSFontAttributeName: UIFont(12),NSForegroundColorAttributeName: [UIColor colorWithRed:112/255.0 green:112/255.0 blue:112/255.0 alpha:1]}];
    //        [string addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC-Semibold" size: 20], NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:57/255.0 blue:57/255.0 alpha:1]} range:NSMakeRange(4, 2)];
            priceTips.attributedText = string;
            priceTips.textAlignment = NSTextAlignmentRight;
            priceTips.alpha = 1.0;
            _priceTips = priceTips;
            [priceTips mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.equalTo(_container);
            }];
        }
        
        {
            UILabel *priceLbl = [[UILabel alloc] init];
            priceLbl.font = UIFontSemibold(20);
            priceLbl.textColor = [UIColor colorWithRed:255/255.0 green:57/255.0 blue:57/255.0 alpha:1];
            [container addSubview:priceLbl];
            _priceLbl = priceLbl;
            [priceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(_priceTips.mas_right).offset(0);
                make.bottom.equalTo(_priceTips);
            }];
        }
        
        {
            UIView *costBtn = [[UIView alloc] init];
            costBtn.frame = CGRectMake(275,684,88,34);
            // gradient
            CAGradientLayer *gl = [CAGradientLayer layer];
            gl.frame = CGRectMake(275,684,88,34);
            gl.startPoint = CGPointMake(0, 0.5);
            gl.endPoint = CGPointMake(1, 0.5);
            gl.colors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:224/255.0 blue:56/255.0 alpha:1].CGColor, (__bridge id)[UIColor colorWithRed:255/255.0 green:215/255.0 blue:1/255.0 alpha:1].CGColor];
            gl.locations = @[@(0), @(1.0f)];
            costBtn.layer.cornerRadius = 45;
            
            UILabel *label = [[UILabel alloc] init];
            label.frame = CGRectMake(305,694,28,14);
            label.numberOfLines = 0;
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"结算"attributes: @{NSFontAttributeName: UIFont(14),NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]}];
            label.attributedText = string;
            label.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
            label.textAlignment = NSTextAlignmentLeft;
            label.alpha = 1.0;
            _costBtn = costBtn;
            
            
            [costBtn addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.top.bottom.mas_equalTo(0);
            }];
            
            [container addSubview:costBtn];
            [costBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-12);
                make.centerY.mas_equalTo(container);
                make.width.mas_equalTo(88);
                make.height.mas_equalTo(34);
            }];
            
        }
    }
}

@end
