//
//  NavigationController.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/3.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    
    viewController.hidesBottomBarWhenPushed = YES;
}

@end
