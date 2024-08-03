//
//  DataManager.h
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GoodModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int price;
@property (nonatomic, strong) UIImage *mainImg;
@property (nonatomic, strong) NSArray <UIImage *> *detailImgs;
@end


@interface DataManager : NSObject

SHARED_INSTANCE_FOR_HEADER

- (void)loadTxtFile;

@property (nonatomic, strong) NSArray <GoodModel *> *goods;

@end

NS_ASSUME_NONNULL_END
