//
//  ATMethodHelper.m
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/15.
//

#import "ATMethodHelper.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation ATMethodHelper

+ (IMP)implementationOfMethodSeletor:(SEL)seletor fromClass:(Class)aClass {
    Method method = class_getInstanceMethod(aClass, seletor);
    return method_getImplementation(method);
}

+ (void)addInstanceMethodWithSeletor:(SEL)methodSeletor fromClass:(Class)fromClass toClass:(Class)toClass {
    [[self class] addInstanceMethodWithDestinationSelector:methodSeletor
                                            sourceSelector:methodSeletor
                                                 fromClass:fromClass
                                                   toClass:toClass];
}

+ (void)addInstanceMethodWithDestinationSelector:(SEL)destinationSelector sourceSelector:(SEL)sourceSelector fromClass:(Class)fromClass toClass:(Class)toClass {
    
    Method method = class_getInstanceMethod(fromClass, sourceSelector);
    
    IMP methodIMP = method_getImplementation(method);
    
    const char *types = method_getTypeEncoding(method);
    
    // 如果方法已经存在则替换方法
    if (!class_addMethod(toClass, destinationSelector, methodIMP, types)) {
        class_replaceMethod(toClass, destinationSelector, methodIMP, types);
    }
}

@end
