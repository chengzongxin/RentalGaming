//
//  LoginTextField.h
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginTextField : UIView


@property (nonatomic, strong) UILabel *titleLbl;
@property (nonatomic, strong) UITextField *textF;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *placehouder;

@end

NS_ASSUME_NONNULL_END
