//
//  ATDelegateProxy.h
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATDelegateProxy : NSObject

+ (void)proxyWithDelegate:(id)delegate;
+ (void)hookDidSelectMethodWithDelegate:(id)delegate;

@end

NS_ASSUME_NONNULL_END
