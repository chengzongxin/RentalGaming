//
//  HotViewController.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/7/31.
//

#import "HotViewController.h"
#import "HotItemViewController.h"

@interface HotViewController ()<TMUIPageViewControllerDataSource,TMUIPageViewControllerDelegate>

@end

@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = UIColorHexString(@"#FFD601");
    [self reloadData];
    
    self.slideBar.backgroundColor = UIColorHexString(@"#FFFDEB");
}

- (NSArray<UIViewController *> *)viewControllersForChildViewControllers {
    return @[HotItemViewController.new,HotItemViewController.new];
}

- (NSArray<NSString *> *)titlesForChildViewControllers {
    return @[@"盲盒机",@"娃娃机"];
}


- (CGFloat)heightForNavBar {
    return 0;
}

- (CGFloat)heightForSliderBar {
    return 50;
}

- (CGFloat)heightForHeader {
    return 84;
}

- (UIView *)viewForHeader {
    UIView *view = [UIView new];
    view.backgroundColor = UIColorHexString(@"#FFD601");
    
    UIImageView *titleIV = [[UIImageView alloc] initWithImage:UIImageMake(@"hot_title")];
    titleIV.frame = CGRectMake(12, 12, 236, 20);
    [view addSubview:titleIV];
    
    UIImageView *thumbIV = [[UIImageView alloc] initWithImage:UIImageMake(@"hot_thumbup")];
    thumbIV.frame = CGRectMake(12, 12, 236, 20);
    [view addSubview:thumbIV];
    [thumbIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    UIView *tipsView = [[UIView alloc] init];
    tipsView.frame = CGRectMake(12,44,205,24);
    tipsView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1].CGColor;
    tipsView.layer.cornerRadius = 12;
    [view addSubview:tipsView];
    
    UILabel *tipsLbl = [[UILabel alloc] init];
    tipsLbl.frame = CGRectMake(20,50,189,12);
    tipsLbl.numberOfLines = 0;
    [view addSubview:tipsLbl];
    NSMutableAttributedString *tipsStr = [[NSMutableAttributedString alloc] initWithString:@"热门租赁娃娃机、盲盒机供你选择！"attributes: @{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 12],NSForegroundColorAttributeName: [UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1]}];
    tipsLbl.attributedText = tipsStr;
    tipsLbl.textColor = [UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1];
    tipsLbl.textAlignment = NSTextAlignmentLeft;
    tipsLbl.alpha = 1.0;
    
    return view;
}

@end
