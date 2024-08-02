//
//  CartItemCell.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/2.
//

#import "CartItemCell.h"

@interface CartItemCell ()

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong) UIButton *selectBtn;
@property (nonatomic, strong) UIImageView *imgV;
@property (nonatomic, strong) UILabel *title;
@property (nonatomic, strong) UILabel *subtitle;
@property (nonatomic, strong) UILabel *price;
@property (nonatomic, strong) UIView *count;

@end

@implementation CartItemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = UIColorClear;
    self.selectionStyle = 0;
    
    {
        UIView *containerView = [[UIView alloc] init];
        containerView.frame = CGRectMake(12,256,351,132);
        containerView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        containerView.layer.cornerRadius = 12;
        containerView.layer.masksToBounds = YES;
        [self.contentView addSubview:containerView];
        _containerView = containerView;
    }
    
    {
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = CGRectMake(12,112,351,132);
        btn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        btn.layer.cornerRadius = 12;
        _selectBtn = btn;
        [_containerView addSubview:btn];
        [btn setImage:UIImageMake(@"cart_unselect") forState:UIControlStateNormal];
        [btn setImage:UIImageMake(@"cart_select") forState:UIControlStateSelected];
    }
    
    {
        UIImageView *imgV = [[UIImageView alloc] init];
        imgV.frame = CGRectMake(48,124,108,108);
        imgV.cornerRadius = 12;
        [_containerView addSubview:imgV];
        _imgV = imgV;
    }
    
    {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(168,268,183,36);
        label.numberOfLines = 0;
        [_containerView addSubview:label];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"扭蛋机超市自助售货螺旋机弹力球机扭蛋玩具"attributes: @{NSFontAttributeName: [UIFont systemFontOfSize: 14],NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]}];
        label.attributedText = string;
        label.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
        label.textAlignment = NSTextAlignmentLeft;
        label.alpha = 1.0;
        _title = label;
    }
    
    {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(168,308,56,12);
        label.numberOfLines = 0;
        [_containerView addSubview:label];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"租赁3个月"attributes: @{NSFontAttributeName: [UIFont systemFontOfSize: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:112/255.0 green:112/255.0 blue:112/255.0 alpha:1]}];
        label.attributedText = string;
        label.textColor = [UIColor colorWithRed:112/255.0 green:112/255.0 blue:112/255.0 alpha:1];
        label.textAlignment = NSTextAlignmentLeft;
        label.alpha = 1.0;
        _subtitle = label;
    }
    
    {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(168,358,28,18);
        label.numberOfLines = 0;
        [_containerView addSubview:label];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"¥78"attributes: @{NSFontAttributeName: [UIFont systemFontOfSize: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:57/255.0 blue:57/255.0 alpha:1]}];
        [string addAttributes:@{NSFontAttributeName: UIFontSemibold(18)} range:NSMakeRange(1, 2)];
        label.attributedText = string;
        label.textColor = [UIColor colorWithRed:255/255.0 green:57/255.0 blue:57/255.0 alpha:1];
        label.textAlignment = NSTextAlignmentLeft;
        label.alpha = 1.0;
        _price = label;
    }
    
    {
        UIView *buyView = [UIView new];
        UIButton *minBtn = [UIButton tmui_button];
        UILabel *countLbl = [UILabel new];
        UIButton *maxBtn = [UIButton tmui_button];
        
        minBtn.tmui_text = @"-";
        minBtn.tmui_titleColor = UIColorHexString(@"#D9D9D9");
        minBtn.tmui_font = UIFont(10);
        maxBtn.tmui_text = @"+";
        maxBtn.tmui_titleColor = UIColorHexString(@"#111111");
        maxBtn.tmui_font = UIFont(10);
        countLbl.text = @"1";
        countLbl.textAlignment = NSTextAlignmentCenter;
        countLbl.backgroundColor = [UIColor colorWithRed:228/255.0 green:231/255.0 blue:233/255.0 alpha:1];
        countLbl.cornerRadius = 4;
        countLbl.font = UIFontMedium(12);
        countLbl.textColor = UIColorHexString(@"#111111");
        
        [buyView addSubview:minBtn];
        [buyView addSubview:countLbl];
        [buyView addSubview:maxBtn];
        [_containerView addSubview:buyView];
        _count = buyView;
        
        [minBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.centerY.mas_equalTo(buyView);
            make.width.mas_equalTo(10);
            make.height.mas_equalTo(10);
        }];
        
        [countLbl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(buyView);
            make.width.mas_equalTo(26);
            make.height.mas_equalTo(16);
        }];
        
        [maxBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(buyView);
            make.width.mas_equalTo(10);
            make.height.mas_equalTo(10);
        }];
    }
    
    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 12, 12, 12));
    }];
    
    [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.centerY.equalTo(_containerView);
    }];
    
    [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_selectBtn.mas_right).offset(8);
        make.centerY.equalTo(_containerView);
        make.width.mas_equalTo(108);
        make.height.mas_equalTo(108);
    }];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_imgV.mas_right).offset(12);
        make.right.mas_equalTo(-12);
        make.top.mas_equalTo(_imgV);
    }];
    
    [_subtitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_imgV.mas_right).offset(12);
        make.top.mas_equalTo(_title.mas_bottom).offset(12);
    }];
    
    [_price mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_imgV.mas_right).offset(12);
        make.bottom.mas_equalTo(_imgV);
    }];
    
    [_count mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-12);
        make.bottom.mas_equalTo(_imgV);
        make.width.mas_equalTo(54);
        make.height.mas_equalTo(16);
    }];
}



@end
