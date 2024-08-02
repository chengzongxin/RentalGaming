//
//  MeViewController.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/7/31.
//

#import "MeViewController.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imgV = [[UIImageView alloc] initWithImage:UIImageMake(@"me_bg")];
    
    [self.view insertSubview:imgV atIndex:0];
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
//        375 * 203
        CGFloat h =   203 / 375.0 * TMUI_SCREEN_WIDTH;
        make.height.mas_equalTo(h);
    }];
    
    
}

@end
