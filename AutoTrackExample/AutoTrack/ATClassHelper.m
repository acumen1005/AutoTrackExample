//
//  ATClassHelper.m
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/15.
//

#import "ATClassHelper.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation ATClassHelper

+ (Class _Nullable)allocateClassWithObject:(id)object className:(NSString *)className {
    if (!object || className.length <= 0) {
        return nil;
    }
    Class originClass = object_getClass(object);
    Class subclass = NSClassFromString(className);
    if (subclass) {
        return nil;
    }
    // originClass 父类，arg2 子类
    subclass = objc_allocateClassPair(originClass, [className UTF8String], 0);
    if (class_getInstanceSize(subclass) != class_getInstanceSize(originClass)) {
        return nil;
    }
    return subclass;
}

+ (void)registerClass:(Class)aClass {
    if (aClass) {
        objc_registerClassPair(aClass);
    }
}

+ (BOOL)setObject:(id)object toClass:(Class)aClass {
    if (aClass && object) {
        return object_setClass(object, aClass);
    }
    return NO;
}

@end
