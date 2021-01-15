//
//  NSObject+Swizzle.m
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/14.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation NSObject (Swizzle)

+ (BOOL)at_swizzleMethod:(SEL)originSel withMethod:(SEL)newSel {
    Method originMethod = class_getInstanceMethod(self, originSel);
    Method newMethod = class_getInstanceMethod(self, newSel);
    
    class_addMethod(self,
                    originSel,
                    class_getMethodImplementation(self, originSel),
                    method_getTypeEncoding(originMethod));
    class_addMethod(self,
                    newSel,
                    class_getMethodImplementation(self, newSel),
                    method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(class_getInstanceMethod(self, originSel),
                                   class_getInstanceMethod(self, newSel));
    return YES;
}

@end
