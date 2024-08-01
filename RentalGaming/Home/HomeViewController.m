//
//  HomeViewController.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/7/31.
//

#import "HomeViewController.h"
#import "HomeCustomizeCell.h"
#import "HomeRecommendCell.h"

@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = UIColorHexString(@"#FFFDEB");
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0,0,TMUI_SCREEN_WIDTH,114);
    // gradient
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,TMUI_SCREEN_WIDTH,114);
    gl.startPoint = CGPointMake(0.5, -0.65);
    gl.endPoint = CGPointMake(0.5, 1);
    gl.colors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:214/255.0 blue:1/255.0 alpha:1].CGColor, (__bridge id)[UIColor colorWithRed:255/255.0 green:230/255.0 blue:1/255.0 alpha:0].CGColor];
    gl.locations = @[@(0), @(1.0f)];
    [view.layer addSublayer:gl];
    
    UIImageView *titleIV = [[UIImageView alloc] initWithImage:UIImageMake(@"home_title")];
    [view addSubview:titleIV];
    [titleIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(56);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(12,82,165,12);
    label.numberOfLines = 0;
    [self.view addSubview:label];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"用低价租赁高价商品，无限畅玩"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1]}];
    label.attributedText = string;
    label.textColor = [UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1];
    label.textAlignment = NSTextAlignmentLeft;
    label.alpha = 1.0;
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleIV);
        make.top.equalTo(titleIV.mas_bottom).offset(6);
    }];
    
    UIImageView *labaIV = [[UIImageView alloc] initWithImage:UIImageMake(@"home_laba")];
    [view addSubview:labaIV];
    [labaIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleIV.mas_right).offset(5);
        make.top.mas_equalTo(47);
    }];
    
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = view;
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
}



#pragma mark UITableViewDelegate UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section ? 3 : 1;;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section ? 50 : 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TMUI_SCREEN_WIDTH, 50)];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(12, 0, TMUI_SCREEN_WIDTH - 12*2, 50)];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(12,16,200,18);
    label.numberOfLines = 0;
    [self.view addSubview:label];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"盲盒机推荐"attributes: @{NSFontAttributeName: UIFontSemibold(18),NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]}];
    label.attributedText = string;
    label.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
    label.textAlignment = NSTextAlignmentLeft;
    label.alpha = 1.0;
    [view addSubview:label];
    view.backgroundColor = UIColorHexString(@"#FFFAC8");
    [view tmui_cornerDirect:UIRectCornerTopLeft|UIRectCornerTopRight radius:12];
    
    [containerView addSubview:view];
    
    return containerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return section ? 12 : 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, TMUI_SCREEN_WIDTH, 12)];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(12, 0, TMUI_SCREEN_WIDTH - 12*2, 12)];
    view.backgroundColor = UIColorHexString(@"#FFFAC8");
    [view tmui_cornerDirect:UIRectCornerBottomLeft|UIRectCornerBottomRight radius:12];
    
    [containerView addSubview:view];
    
    return containerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HomeCustomizeCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(HomeCustomizeCell.class) forIndexPath:indexPath];
        return cell;
    } else {
        HomeRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(HomeRecommendCell.class) forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return UITableViewCell.new;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.section ? 112 : 303;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = UIColorClear;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.sectionHeaderHeight = 0.0;
        _tableView.sectionFooterHeight = 0.0;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, tmui_tabbarHeight(), 0);
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:HomeCustomizeCell.class forCellReuseIdentifier:NSStringFromClass(HomeCustomizeCell.class)];
        [_tableView registerClass:HomeRecommendCell.class forCellReuseIdentifier:NSStringFromClass(HomeRecommendCell.class)];
    }
    return _tableView;
}

@end
