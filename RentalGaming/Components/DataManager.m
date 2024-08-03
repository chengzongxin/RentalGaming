//
//  DataManager.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/3.
//

#import "DataManager.h"

@implementation GoodModel
@end

@implementation DataManager

SHARED_INSTANCE_FOR_CLASS

- (void)loadTxtFile{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"rent" ofType:@"txt"];
    NSError *error;
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];

    if (error) {
        NSLog(@"Error reading file: %@", [error localizedDescription]);
    } else {
//        NSLog(@"File content: %@", fileContent);
//        NSArray *lines = [fileContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
//        
//        // 打印分割后的数组
//        for (NSString *line in lines) {
//            NSLog(@"%@", line);
//        }
        
        NSString *normalizedString = [fileContent stringByReplacingOccurrencesOfString:@"\r\n" withString:@"\n"];
        NSArray *lines = [normalizedString componentsSeparatedByString:@"\n"];

        // 过滤掉空行
        NSMutableArray *filteredLines = [NSMutableArray array];
        for (NSString *line in lines) {
            NSString *trimmedLine = [line stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            if (trimmedLine.length > 0) {
                [filteredLines addObject:trimmedLine];
            }
        }

        // 打印过滤后的数组
//        for (NSString *line in filteredLines) {
//            NSLog(@"%@", line);
//        }
        NSArray *threeArr = [self chunkArray:filteredLines intoSize:3];

        NSMutableArray *models = [NSMutableArray array];
        for (int i = 0; i < threeArr.count; i++) {
            NSArray *oneM = threeArr[i];
            GoodModel *model = [GoodModel new];
            model.name = oneM[0];
            model.price = [[self extractNumberFromString:oneM[1]] intValue];
            int idx = [[self extractNumberFromString:oneM[2]] intValue];
            if (!isnan(idx)) {
                model.idx = idx;
                
                NSString *mainPicName = [NSString stringWithFormat:@"商品主图%d",idx];
                NSString *filePath = [[NSBundle mainBundle] pathForResource:mainPicName ofType:@"jpg"];
                model.mainImg = [UIImage imageWithContentsOfFile:filePath];
                
                NSMutableArray *details = [NSMutableArray array];
                UIImage *detailImg = nil;
                int curImgIdx = 1;
                do {
//                    详情页29-1.jpg
                    NSString *detailPicName = [NSString stringWithFormat:@"详情页%d-%d",idx,curImgIdx];
                    NSString *detailPath = [[NSBundle mainBundle] pathForResource:detailPicName ofType:@"jpg"];
                    detailImg = [UIImage imageWithContentsOfFile:detailPath];
                    curImgIdx++;
                    [details tmui_safeAddObject:detailImg];
                } while (detailImg);
                model.detailImgs = details;
            }
            
            
//            model.imgUrl = oneM[1];
            [models addObject:model];
        }
        
        self.goods = models;
    }
}

- (NSArray *)chunkArray:(NSArray *)array intoSize:(NSUInteger)size {
    NSMutableArray *result = [NSMutableArray array];
    NSUInteger count = [array count];
    
    for (NSUInteger i = 0; i < count; i += size) {
        NSUInteger length = MIN(size, count - i);
        NSArray *chunk = [array subarrayWithRange:NSMakeRange(i, length)];
        [result addObject:chunk];
    }
    
    return [result copy];
}


- (NSString *)extractNumberFromString:(NSString *)string {
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\d+" options:0 error:&error];
    NSTextCheckingResult *result = [regex firstMatchInString:string options:0 range:NSMakeRange(0, [string length])];
    
    if (result) {
        NSRange range = [result range];
        return [string substringWithRange:range];
    }
    
    return nil;
}

//// 使用示例
//NSString *inputString = @"价格：22";
//NSString *numberString = [self extractNumberFromString:inputString];
//NSLog(@"%@", numberString); // 输出: 22
@end


