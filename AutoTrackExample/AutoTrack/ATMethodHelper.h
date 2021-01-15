//
//  ATMethodHelper.h
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATMethodHelper : NSObject

+ (IMP)implementationOfMethodSeletor:(SEL)seletor fromClass:(Class)aClass;

+ (void)addInstanceMethodWithSeletor:(SEL)methodSeletor fromClass:(Class)fromClass toClass:(Class)toClass;

+ (void)addInstanceMethodWithDestinationSelector:(SEL)destinationSelector sourceSelector:(SEL)sourceSelector fromClass:(Class)fromClass toClass:(Class)toClass;

@end

NS_ASSUME_NONNULL_END
