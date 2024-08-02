//
//  LoginTextField.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/2.
//

#import "LoginTextField.h"

@interface LoginTextField ()

@end

@implementation LoginTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(0,242,60,16);
        label.numberOfLines = 0;
        [self addSubview:label];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"手机号"attributes: @{NSFontAttributeName: UIFont(16),NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]}];
        label.attributedText = string;
        label.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
        label.textAlignment = NSTextAlignmentCenter;
        label.alpha = 1.0;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.centerY.equalTo(self);
        }];
        _titleLbl = label;
    }
    
    {
        UITextField *txtF = [[UITextField alloc] init];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"请输入您的手机号"attributes: @{NSFontAttributeName: UIFont(14),NSForegroundColorAttributeName: [UIColor colorWithRed:190/255.0 green:190/255.0 blue:190/255.0 alpha:1]}];
        txtF.attributedPlaceholder = string;
        [self addSubview:txtF];
        [txtF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(92-24);
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-24);
        }];
        _textF = txtF;
    }
    
    
    {
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(24,270,327,1);
        view.layer.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1].CGColor;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(1);
        }];
    }
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:title attributes: @{NSFontAttributeName: UIFont(16),NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]}];
    _titleLbl.attributedText = string;
}

- (void)setPlacehouder:(NSString *)placehouder {
    _placehouder = placehouder;
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:placehouder attributes: @{NSFontAttributeName: UIFont(14),NSForegroundColorAttributeName: [UIColor colorWithRed:190/255.0 green:190/255.0 blue:190/255.0 alpha:1]}];
    _textF.attributedPlaceholder = string;
}

@end
