//
//  NSObject+Track.h
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Track)

@property (nonatomic, strong, nullable) NSString *at_className;

@property (nonatomic, strong, nullable) NSString *at_refererURL;

@end

NS_ASSUME_NONNULL_END
