//
//  DetailItemCell.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/3.
//

#import "DetailItemCell.h"

@implementation DetailItemCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    UIView *container = [UIView new];
    container.backgroundColor = UIColorWhite;
    [self.contentView addSubview:container];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.bottom.mas_equalTo(0);
    }];
    
    
    UIImageView *imgV = [[UIImageView alloc] init];
    [container addSubview:imgV];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.bottom.mas_equalTo(0);
    }];
    
    _imgV = imgV;
    
}

@end
