//
//  NSObject+Swizzle.h
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Swizzle)

+ (BOOL)at_swizzleMethod:(SEL)originSel withMethod:(SEL)newSel;

@end

NS_ASSUME_NONNULL_END
