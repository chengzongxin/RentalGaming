//
//  ImageHook.m
//  RentalGaming
//
//  Created by 程宗鑫 on 2024/8/2.
//

#import "ImageHook.h"
#import "fishhook.h"
@implementation ImageHook

+ (void)load {
    //暂时兼容iOS17因UIGraphicsBeginImageContext入参size为zero导致的断言错误,后续要下线。
//    [self fixedUIContextAssertFailed];
}


+ (void)fixedUIContextAssertFailed {
 


    struct rebinding uigbicwo;
 
    uigbicwo.name = "UIGraphicsBeginImageContextWithOptions";
    uigbicwo.replacement = p_UIGraphicsBeginImageContextWithOptions;
    uigbicwo.replaced = (void*)&sys_UIGraphicsBeginImageContextWithOptions;
 
    struct rebinding rebs[1] = {uigbicwo};


    rebind_symbols(rebs,1);
}


//UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
//系统函数指针
void(*sys_UIGraphicsBeginImageContextWithOptions)(CGSize size, BOOL opaque, CGFloat scale);


//新的函数
void p_UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale) {
    if (size.width == 0 || size.height == 0) {
        return;
    }
    sys_UIGraphicsBeginImageContextWithOptions(size,opaque,scale);
}



@end
