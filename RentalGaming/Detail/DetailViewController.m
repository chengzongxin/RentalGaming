//
//  DetailViewController.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/3.
//

#import "DetailViewController.h"
#import "DetailItemCell.h"

@interface DetailViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) TMUILabel *titleLabel;
@property (nonatomic, strong) NSMutableArray *priceLbls;
@property (nonatomic, strong) NSMutableArray *priceCountLbls;

@end

@implementation DetailViewController
TMUI_PropertyLazyLoad(NSMutableArray, priceLbls)
TMUI_PropertyLazyLoad(NSMutableArray, priceCountLbls)
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.tableHeaderView = [self headerView];
    [self.view addSubview:self.tableView];
    
    TMUINavigationBar *navBar = [[TMUINavigationBar alloc] init];
    navBar.backgroundColor = UIColorClear;
    [self.view addSubview:navBar];
}

- (UIView *)headerView {
    
    CGFloat imgH = 330;
    
    CGFloat titleH = 64;
    
    CGFloat duration = 174;
    
    CGFloat space = 12;
    
    // 创建容器视图
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TMUI_SCREEN_WIDTH, imgH + space + titleH + space + duration)];

    // 创建图片视图
    UIImageView *imageView = [[UIImageView alloc] init];
    [containerView addSubview:imageView];
    _imageView = imageView;
    imageView.image = self.model.mainImg;
    
    // 创建标题标签
    TMUILabel *titleLabel = [[TMUILabel alloc] init];
    titleLabel.frame = CGRectMake(24,357,327,40);
    titleLabel.numberOfLines = 0;
    [self.view addSubview:titleLabel];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.model.name attributes: @{NSFontAttributeName: UIFont(14),NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]}];
    titleLabel.attributedText = string;
    titleLabel.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.alpha = 1.0;
    titleLabel.backgroundColor = UIColorWhite;
    titleLabel.cornerRadius = 12;
    titleLabel.contentEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 12);
    [containerView addSubview:titleLabel];
    _titleLabel = titleLabel;
    
    // 创建时长标签
    UIView *rentTimeView = [[UIView alloc] init];
    rentTimeView.backgroundColor = UIColorWhite;
    rentTimeView.cornerRadius = 12;
    [containerView addSubview:rentTimeView];

    // 设置图片视图的约束
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(containerView.mas_top);
        make.left.equalTo(containerView.mas_left);
        make.right.equalTo(containerView.mas_right);
        make.height.mas_equalTo(330); // 设置图片视图的高度
    }];

    // 设置标题标签的约束
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(12); // 图片和标题之间的间隔
        make.left.equalTo(containerView.mas_left).offset(12);
        make.right.equalTo(containerView.mas_right).offset(-12);
        make.height.mas_equalTo(64); // 设置标题标签的高度
    }];

    // 设置时长标签的约束
    [rentTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(12); // 标题和时长之间的间隔
        make.left.equalTo(containerView.mas_left).offset(12);
        make.right.equalTo(containerView.mas_right).offset(-12);
        make.height.mas_equalTo(174); // 设置时长标签的高度
        make.bottom.equalTo(containerView.mas_bottom); // 时长标签的底部对齐容器视图的底部
    }];
    
    {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(24,437,32,16);
        label.numberOfLines = 0;
        [rentTimeView addSubview:label];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"租期"attributes: @{NSFontAttributeName: UIFont(16),NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]}];
        label.attributedText = string;
        label.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
        label.textAlignment = NSTextAlignmentLeft;
        label.alpha = 1.0;
        
        
        UIButton *btn = [UIButton tmui_button];
        [btn setImage:UIImageMake(@"me_collect") forState:UIControlStateNormal];
        // TODO: icon
        [btn setImage:UIImageMake(@"me_collect") forState:UIControlStateSelected];
        btn.tmui_text = @"收藏";
        btn.tmui_titleColor = UIColorHexString(@"#565656");
        btn.tmui_font = UIFont(14);
        [rentTimeView addSubview:btn];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(12);
            make.top.mas_equalTo(16);
        }];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-12);
            make.centerY.equalTo(label);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(30);
        }];
    }
    
    NSMutableArray *rents = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        int ratio = 1;
        UIView *rentView = [[UIView alloc] init];
        
        {
            UILabel *label = [[UILabel alloc] init];
            label.frame = CGRectMake(43,485,65,18);
            label.numberOfLines = 0;
            [rentView addSubview:label];
            
            NSString *rentDuration = @"";
            
            if (i == 0) {
                rentDuration = @"租赁3个月";
                ratio = 90;
            } else if (i == 1) {
                rentDuration = @"租赁6个月";
                ratio = 180;
            } else if (i == 2) {
                rentDuration = @"租赁12个月";
                ratio = 360;
            }
            
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:rentDuration attributes: @{NSFontAttributeName: UIFont(14),NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]}];
            label.attributedText = string;
            label.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
            label.textAlignment = NSTextAlignmentCenter;
            label.alpha = 1.0;
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.top.mas_equalTo(20);
            }];
        }
        
        {
            UILabel *label = [[UILabel alloc] init];
            label.frame = CGRectMake(47,515,54,28);
            label.numberOfLines = 0;
            [rentView addSubview:label];
            NSString *price = [NSString stringWithFormat:@"¥%d",self.model.price * ratio];
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:price attributes: @{NSFontAttributeName: UIFont(14),NSForegroundColorAttributeName: [UIColor colorWithRed:255/255.0 green:72/255.0 blue:72/255.0 alpha:1]}];
            [string addAttributes:@{NSFontAttributeName: UIFontSemibold(28)} range:NSMakeRange(1, price.length - 1)];
            label.attributedText = string;
            label.textColor = [UIColor colorWithRed:255/255.0 green:72/255.0 blue:72/255.0 alpha:1];
            label.textAlignment = NSTextAlignmentCenter;
            label.alpha = 1.0;
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.centerY.equalTo(rentView);
            }];
            [self.priceLbls addObject:label];
        }
        
        {
            UILabel *label = [[UILabel alloc] init];
            label.frame = CGRectMake(62,551,26,12);
            label.numberOfLines = 0;
            [rentView addSubview:label];
            NSString *price = [NSString stringWithFormat:@"¥%d",(self.model.price + 2) * ratio];
            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:price attributes: @{NSFontAttributeName: UIFont(10),NSForegroundColorAttributeName: [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1]}];
            [string addAttributes:@{NSFontAttributeName: UIFont(12)} range:NSMakeRange(1, price.length - 1)];
            [string addAttributes:@{NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle) } range:NSMakeRange(1, price.length - 1)];
            label.attributedText = string;
            label.textColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1];
            label.textAlignment = NSTextAlignmentCenter;
            label.alpha = 1.0;
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.bottom.mas_equalTo(-20);
            }];
            [self.priceCountLbls addObject:label];
        }
        
        [rents addObject:rentView];
        [rentTimeView addSubview:rentView];
        rentView.layer.cornerRadius = 10;
        [rentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-12);
            make.height.mas_equalTo(118);
        }];
        
        rentView.backgroundColor = UIColorWhite;
        rentView.tmui_layoutSubviewsBlock = ^(__kindof UIView * _Nonnull view) {
            if (view.width && view.height) {
//                [view tmui_shadowColor:[UIColorBlack colorWithAlphaComponent:0.5] opacity:1 offsetSize:CGSizeZero corner:14];
                [view.layer tmui_setLayerShadow:[UIColorBlack colorWithAlphaComponent:0.1] offset:CGSizeMake(5, 5) alpha:1 radius:10 spread:2];
            }
        };
    }
    
    [rents mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:9 leadSpacing:12 tailSpacing:12];
    
    return containerView;
}



#pragma mark UITableViewDelegate UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 0 ? 12 + 44 : 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TMUI_SCREEN_WIDTH, 12 + 44)];
    TMUILabel *label = [[TMUILabel alloc] init];
    label.frame = CGRectMake(12,12,TMUI_SCREEN_WIDTH - 12 * 2,44);
    label.numberOfLines = 0;
    [view addSubview:label];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"商品详情"attributes: @{NSFontAttributeName: UIFont(16),NSForegroundColorAttributeName: [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1]}];
    label.attributedText = string;
    label.textColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1];
    label.textAlignment = NSTextAlignmentLeft;
    label.alpha = 1.0;
    label.contentEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 12);
    [label tmui_cornerDirect:UIRectCornerTopLeft|UIRectCornerTopRight radius:12];
    label.backgroundColor = UIColorWhite;
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(12);
//        make.right.mas_equalTo(-12);
//        make.centerY.equalTo(view);
//    }];
    return view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.detailImgs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailItemCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(DetailItemCell.class) forIndexPath:indexPath];
    cell.backgroundColor = UIColorClear;
    cell.imgV.image = self.model.detailImgs[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    UIImage *image = self.model.detailImgs[indexPath.row];
//    h:w=
    CGFloat h = 0;
    if (image.size.width && image.size.height) {
        h = image.size.height / (image.size.width * 1.0) * (TMUI_SCREEN_WIDTH - 12 * 2 * 2);
    }
    return h;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.backgroundColor = UIColorHexString(@"#F4F4F4");
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.sectionHeaderHeight = 0.0;
        _tableView.sectionFooterHeight = 0.0;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:DetailItemCell.class forCellReuseIdentifier:NSStringFromClass(DetailItemCell.class)];
    }
    return _tableView;
}
@end
