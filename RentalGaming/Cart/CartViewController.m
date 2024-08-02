//
//  CartViewController.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/7/31.
//

#import "CartViewController.h"
#import "CartItemCell.h"
#import "CartToolBar.h"

@interface CartViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) CartToolBar *toolBar;

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = UIColorYellow;
    
    {
        UILabel *titleLbl = [[UILabel alloc] init];
        titleLbl.frame = CGRectMake(12,56,200,20);
        titleLbl.numberOfLines = 0;
        [self.view addSubview:titleLbl];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"购物车"attributes: @{NSFontAttributeName: UIFontHeavy(20),NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]}];
        titleLbl.attributedText = string;
        titleLbl.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
        titleLbl.textAlignment = NSTextAlignmentLeft;
        titleLbl.alpha = 1.0;
        [self.view addSubview:titleLbl];
    }
    
    {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(335,62,50,14);
        label.numberOfLines = 0;
        [self.view addSubview:label];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"管理"attributes: @{NSFontAttributeName: UIFont(14),NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]}];
        label.attributedText = string;
        label.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
        label.textAlignment = NSTextAlignmentLeft;
        label.alpha = 1.0;
        [self.view addSubview:label];
    }
    
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(92);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    [self.view addSubview:self.toolBar];
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-tmui_tabbarHeight());
        make.height.mas_equalTo(66);
    }];
    
}


#pragma mark UITableViewDelegate UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CartItemCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(CartItemCell.class) forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 132 + 12;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.sectionHeaderHeight = 0.0;
        _tableView.sectionFooterHeight = 0.0;
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.separatorStyle = 0;
        _tableView.cornerRadius = 20;
        _tableView.backgroundColor = UIColorHexString(@"#FFFDEB");
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, tmui_tabbarHeight() + 66, 0);
        [_tableView registerClass:CartItemCell.class forCellReuseIdentifier:NSStringFromClass(CartItemCell.class)];
    }
    return _tableView;
}

- (CartToolBar *)toolBar {
    if (!_toolBar) {
        _toolBar = [[CartToolBar alloc] init];
    }
    return _toolBar;
}

@end
