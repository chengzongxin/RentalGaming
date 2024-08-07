//
//  HotItemCell.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/2.
//

#import "HotItemCell.h"

@interface HotItemCell ()
@property (nonatomic, strong)UIImageView *imgV;
@property (nonatomic, strong)UILabel *descLbl;
@property (nonatomic, strong)UILabel *priceLbl;
@end


@implementation HotItemCell

- (void)setModel:(GoodModel *)model {
    _model = model;
    
    _imgV.image = model.mainImg;
    
    NSMutableAttributedString *descStr = [[NSMutableAttributedString alloc] initWithString:model.name attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:86/255.0 green:86/255.0 blue:86/255.0 alpha:1]}];
    _descLbl.attributedText = descStr;
    
    NSString *price = [NSString stringWithFormat:@"¥%d",model.price];
    NSMutableAttributedString *priceStr = [[NSMutableAttributedString alloc] initWithString:price attributes: @{NSFontAttributeName: UIFont(12),NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:57/255.0 blue:57/255.0 alpha:1]}];
    [priceStr addAttributes:@{NSFontAttributeName: UIFontMedium(18)} range:NSMakeRange(1, price.length - 1)];
    _priceLbl.attributedText = priceStr;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    UIImageView *imgV = [[UIImageView alloc] init];
    imgV.frame = CGRectMake(20,148,171,171);
    imgV.cornerRadius = 12;
    [self.contentView addSubview:imgV];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.right.mas_equalTo(-8);
        make.top.mas_equalTo(8);
        make.height.mas_equalTo(155);
    }];
    _imgV = imgV;
    
    UILabel *descLbl = [[UILabel alloc] init];
    descLbl.frame = CGRectMake(20,327,126,14);
    descLbl.numberOfLines = 0;
    [self.contentView addSubview:descLbl];
    NSMutableAttributedString *descStr = [[NSMutableAttributedString alloc] initWithString:@"盲盒机商用活动定制"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:86/255.0 green:86/255.0 blue:86/255.0 alpha:1]}];
    descLbl.attributedText = descStr;
    descLbl.textColor = [UIColor colorWithRed:86/255.0 green:86/255.0 blue:86/255.0 alpha:1];
    descLbl.textAlignment = NSTextAlignmentLeft;
    descLbl.alpha = 1.0;
    [descLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.top.equalTo(imgV.mas_bottom).offset(8);
        make.width.mas_equalTo(171);
        make.height.mas_equalTo(14);
    }];
    _descLbl = descLbl;
    
    UILabel *priceLbl = [[UILabel alloc] init];
    priceLbl.frame = CGRectMake(20,349,37,18);
    priceLbl.numberOfLines = 0;
    [self.contentView addSubview:priceLbl];
    NSMutableAttributedString *priceStr = [[NSMutableAttributedString alloc] initWithString:@"¥192"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:57/255.0 blue:57/255.0 alpha:1]}];
    [priceStr addAttributes:@{NSFontAttributeName: UIFontMedium(18)} range:NSMakeRange(1, 3)];
    priceLbl.attributedText = priceStr;
    priceLbl.textColor = [UIColor colorWithRed:255/255.0 green:57/255.0 blue:57/255.0 alpha:1];
    priceLbl.textAlignment = NSTextAlignmentLeft;
    priceLbl.alpha = 1.0;
    [priceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.top.equalTo(descLbl.mas_bottom).offset(8);
    }];
    _priceLbl = priceLbl;
    
    UIButton *btn = [UIButton tmui_button];
    btn.frame = CGRectMake(20,375,171,34);
    btn.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:214/255.0 blue:1/255.0 alpha:1].CGColor;
    btn.layer.cornerRadius = 6;
    btn.tmui_text = @"租用";
    btn.tmui_font = UIFontSemibold(14);
    btn.tmui_titleColor = UIColorHexString(@"#111111");
    [self.contentView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.right.mas_equalTo(-8);
        make.bottom.mas_equalTo(-8);
        make.height.mas_equalTo(34);
    }];
}

@end
