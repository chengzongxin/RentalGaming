//
//  TabBarViewController.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/7/31.
//

#import "TabBarViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.tintColor = UIColor.yellowColor;
    
//    UITabBarItem *item = [self.tabBar.items objectAtIndex:0];
//
//    // 设置选中状态下的标题颜色
//    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor yellowColor]} forState:UIControlStateSelected];
//
//    // 设置未选中状态下的标题颜色（可选）
//    [item setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor]} forState:UIControlStateNormal];
//    
//    self.tabBar.tintColor = UIColor.yellowColor;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
