//
//  HomeRecommendCell.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/1.
//

#import "HomeRecommendCell.h"

@implementation HomeRecommendCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = UIColor.clearColor;
    
    UIView *containerView = [UIView new];
    containerView.backgroundColor = UIColorHexString(@"#FFFAC8");
    [self.contentView addSubview:containerView];
    
    UIView *imgV = [[UIView alloc] init];
    imgV.frame = CGRectMake(24,479,100,100);
    [containerView addSubview:imgV];
    
    UILabel *titleLbl = [[UILabel alloc] init];
    titleLbl.frame = CGRectMake(136,479,215,40);
    titleLbl.numberOfLines = 0;
    [containerView addSubview:titleLbl];
    NSMutableAttributedString *titleStr = [[NSMutableAttributedString alloc] initWithString:@"扭蛋机超市自助售货螺旋机弹力球机扭蛋玩具"attributes: @{NSFontAttributeName: UIFont(14),NSForegroundColorAttributeName: [UIColor colorWithRed:69/255.0 green:69/255.0 blue:69/255.0 alpha:1]}];
    titleLbl.attributedText = titleStr;
    titleLbl.textColor = [UIColor colorWithRed:69/255.0 green:69/255.0 blue:69/255.0 alpha:1];
    titleLbl.textAlignment = NSTextAlignmentLeft;
    titleLbl.alpha = 1.0;
    
    UILabel *priceLbl = [[UILabel alloc] init];
    priceLbl.frame = CGRectMake(136,561,37,18);
    priceLbl.numberOfLines = 0;
    [containerView addSubview:priceLbl];
    NSMutableAttributedString *priceStr = [[NSMutableAttributedString alloc] initWithString:@"¥192"attributes: @{NSFontAttributeName: UIFont(12),NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:57/255.0 blue:57/255.0 alpha:1]}];
    [priceStr addAttributes:@{NSFontAttributeName: UIFontSemibold(18)} range:NSMakeRange(1, 3)];
    priceLbl.attributedText = priceStr;
    priceLbl.textColor = [UIColor colorWithRed:255/255.0 green:57/255.0 blue:57/255.0 alpha:1];
    priceLbl.textAlignment = NSTextAlignmentLeft;
    priceLbl.alpha = 1.0;
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(277,550,74,30);
    btn.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:214/255.0 blue:1/255.0 alpha:1].CGColor;
    btn.layer.cornerRadius = 5;
    [containerView addSubview:btn];
    NSMutableAttributedString *btnStr = [[NSMutableAttributedString alloc] initWithString:@"去查看"attributes: @{NSFontAttributeName: UIFontMedium(14),NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]}];
    btn.tmui_attrText = btnStr;
    
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView).inset(12);
        make.top.bottom.mas_equalTo(0);
    }];
    
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    
    [titleLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imgV.mas_right).offset(12);
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(-12);
        make.height.mas_equalTo(40);
    }];
    
    [priceLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imgV.mas_right).offset(12);
        make.bottom.equalTo(imgV);
    }];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.bottom.equalTo(imgV);
        make.width.mas_equalTo(74);
        make.height.mas_equalTo(30);
    }];
}
@end
