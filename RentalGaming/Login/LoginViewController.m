//
//  LoginViewController.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/2.
//

#import "LoginViewController.h"
#import "LoginTextField.h"

@interface LoginViewController ()

@property (nonatomic, strong) UIButton *checkBtn;
@property (nonatomic, strong) UIButton *registBtn;
@property (nonatomic, strong) UIView *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    TMUINavigationBar *narBar = [[TMUINavigationBar alloc] init];
    narBar.backgroundColor = UIColorClear;
    [self.view addSubview:narBar];
    
    {
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(0,0,TMUI_SCREEN_WIDTH,202);
        [view tmui_gradientWithColors:@[[UIColor colorWithRed:255/255.0 green:214/255.0 blue:1/255.0 alpha:1],[UIColor colorWithRed:255/255.0 green:230/255.0 blue:1/255.0 alpha:0]] gradientType:TMUIGradientTypeTopToBottom];
        // gradient
//        CAGradientLayer *gl = [CAGradientLayer layer];
//        gl.frame = view.bounds;
//        gl.startPoint = CGPointMake(0.5, 0);
//        gl.endPoint = CGPointMake(0.5, 1);
//        gl.colors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:214/255.0 blue:1/255.0 alpha:1].CGColor, (__bridge id)[UIColor colorWithRed:255/255.0 green:230/255.0 blue:1/255.0 alpha:0].CGColor];
//        gl.locations = @[@(0), @(1.0f)];
        [self.view insertSubview:view atIndex:0];
    }
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(24,120,200,22);
    label.numberOfLines = 0;
    [self.view addSubview:label];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"您好，请登录～"attributes: @{NSFontAttributeName: UIFontSemibold(22), NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]}];
    label.attributedText = string;
    label.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
    label.textAlignment = NSTextAlignmentLeft;
    label.alpha = 1.0;
    
    LoginTextField *accontT = [[LoginTextField alloc] init];
    accontT.title = @"手机号";
    accontT.placehouder = @"请输入您的手机号";
    [self.view addSubview:accontT];
    
    LoginTextField *passT = [[LoginTextField alloc] init];
    passT.title = @"密码";
    passT.placehouder = @"请输入您的密码";
    [self.view addSubview:passT];
    
    [accontT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(24);
        make.right.mas_equalTo(-24);
        make.top.mas_equalTo(202);
        make.height.mas_equalTo(60);
    }];
    [passT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(24);
        make.right.mas_equalTo(-24);
        make.top.mas_equalTo(accontT.mas_bottom);
        make.height.mas_equalTo(60);
    }];
    
    {
        UIButton *btn = [UIButton tmui_button];
        [btn setImage:UIImageMake(@"cart_unselect") forState:UIControlStateNormal];
        [btn setImage:UIImageMake(@"cart_select") forState:UIControlStateSelected];
        [self.view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(24);
            make.top.mas_equalTo(passT.mas_bottom).offset(20);
            make.width.mas_equalTo(24);
            make.height.mas_equalTo(24);
        }];
        _checkBtn = btn;
    }
    
    {
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(55,415,216,12);
        label.numberOfLines = 0;
        [self.view addSubview:label];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"阅读并同意《服务协议》和《隐私协议》"attributes: @{NSFontAttributeName: UIFont(12),NSForegroundColorAttributeName: [UIColor colorWithRed:190/255.0 green:190/255.0 blue:190/255.0 alpha:1]}];
        [string addAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]} range:NSMakeRange(5, 6)];
        [string addAttributes:@{NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]} range:NSMakeRange(12, 6)];
        label.attributedText = string;
        label.textAlignment = NSTextAlignmentLeft;
        label.alpha = 1.0;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_checkBtn.mas_right).offset(15);
            make.centerY.mas_equalTo(_checkBtn);
        }];
    }
    
    {
        UIView *view = [[UIView alloc] init];
        view.frame = CGRectMake(0,0,TMUI_SCREEN_WIDTH - 24 * 2,46);
        NSArray *colors = @[[UIColor colorWithRed:255/255.0 green:224/255.0 blue:56/255.0 alpha:1],[UIColor colorWithRed:255/255.0 green:215/255.0 blue:1/255.0 alpha:1]];
        [view tmui_gradientWithColors:colors gradientType:TMUIGradientTypeTopToBottom];
        view.cornerRadius = 23;
        [self.view addSubview:view];
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(171,484,32,16);
        label.numberOfLines = 0;
        [view addSubview:label];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"登陆"attributes: @{NSFontAttributeName: UIFont(16),NSForegroundColorAttributeName: [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1]}];
        label.attributedText = string;
        label.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
        label.textAlignment = NSTextAlignmentCenter;
        label.alpha = 1.0;
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.bottom.mas_equalTo(0);
        }];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(24);
            make.top.mas_equalTo(_checkBtn.mas_bottom).offset(42);
            make.right.mas_equalTo(-24);
            make.height.mas_equalTo(46);
        }];
        _loginBtn = view;
    }
    
    {
        CGFloat w = 128;
        UIView *container = [UIView new];
        [self.view addSubview:container];
        
        UIView *view1 = [[UIView alloc] init];
        view1.frame = CGRectMake(0,10,30,1);
        // gradient
        CAGradientLayer *gl1 = [CAGradientLayer layer];
        gl1.frame = view1.bounds;
        gl1.startPoint = CGPointMake(0, 0.5);
        gl1.endPoint = CGPointMake(1, 0.5);
        gl1.colors = @[(__bridge id)[UIColor colorWithRed:138/255.0 green:138/255.0 blue:138/255.0 alpha:0].CGColor, (__bridge id)[UIColor colorWithRed:138/255.0 green:138/255.0 blue:138/255.0 alpha:1].CGColor];
        gl1.locations = @[@(0), @(1.0f)];
        [view1.layer addSublayer:gl1];
        [container addSubview:view1];
        
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"注册账号"attributes: @{NSFontAttributeName: UIFont(14),NSForegroundColorAttributeName: [UIColor colorWithRed:138/255.0 green:138/255.0 blue:138/255.0 alpha:1]}];
        label.attributedText = string;
        label.textColor = [UIColor colorWithRed:138/255.0 green:138/255.0 blue:138/255.0 alpha:1];
        label.textAlignment = NSTextAlignmentLeft;
        label.alpha = 1.0;
        [container addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(container);
        }];
        
        UIView *view2 = [[UIView alloc] init];
        view2.frame = CGRectMake(w - 30,10,30,1);
        // gradient
        CAGradientLayer *gl2 = [CAGradientLayer layer];
        gl2.frame = view2.bounds;
        gl2.startPoint = CGPointMake(0, 0.5);
        gl2.endPoint = CGPointMake(1, 0.5);
        gl2.colors = @[(__bridge id)[UIColor colorWithRed:138/255.0 green:138/255.0 blue:138/255.0 alpha:1].CGColor, (__bridge id)[UIColor colorWithRed:138/255.0 green:138/255.0 blue:138/255.0 alpha:0].CGColor];
        gl2.locations = @[@(0), @(1.0f)];
        [view2.layer addSublayer:gl2];
        [container addSubview:view2];
        
        [container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.mas_equalTo(_loginBtn.mas_bottom).offset(42);
            make.width.mas_equalTo(w);
            make.height.mas_equalTo(20);
        }];
    }
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
