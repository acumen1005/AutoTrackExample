//
//  ATClassHelper.h
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATClassHelper : NSObject

+ (Class _Nullable)allocateClassWithObject:(id)object className:(NSString *)className;
+ (void)registerClass:(Class)aClass;
+ (BOOL)setObject:(id)object toClass:(Class)aClass;

@end

NS_ASSUME_NONNULL_END
