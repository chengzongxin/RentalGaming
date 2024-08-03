//
//  DataManager.h
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    GoodType_BlindBox,
    GoodType_Doll,
} GoodType;


@interface GoodModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int price;
@property (nonatomic, strong) UIImage *mainImg;
@property (nonatomic, strong) NSArray <UIImage *> *detailImgs;
@property (nonatomic, assign) GoodType type; // 1 盲盒， 2 娃娃
@end


@interface DataManager : NSObject

SHARED_INSTANCE_FOR_HEADER

- (void)loadTxtFile;

@property (nonatomic, strong) NSArray <GoodModel *> *goods;
@property (nonatomic, strong) NSArray <GoodModel *> *blinds;
@property (nonatomic, strong) NSArray <GoodModel *> *blinds10;
@property (nonatomic, strong) NSArray <GoodModel *> *dolls;
@property (nonatomic, strong) NSArray <GoodModel *> *dolls10;

@end

NS_ASSUME_NONNULL_END
