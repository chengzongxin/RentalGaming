//
//  CartManager.h
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/3.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface OrderModel : NSObject

@property (nonatomic, strong) GoodModel *goodModel;
@property (nonatomic, strong) NSString *rentDaysStr;
@property (nonatomic, assign) int rentDays;
@property (nonatomic, assign) int buyCountNVHM;

@end

@interface CartManager : NSObject
SHARED_INSTANCE_FOR_HEADER

@property (nonatomic, strong) NSArray <OrderModel *> *cartOrders;

@end

NS_ASSUME_NONNULL_END
