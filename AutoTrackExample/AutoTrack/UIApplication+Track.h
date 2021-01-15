//
//  UIApplication+Track.h
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (Track)

- (BOOL)at_sendAction:(SEL)action to:(nullable id)target from:(nullable id)sender forEvent:(nullable UIEvent *)event;

@end

NS_ASSUME_NONNULL_END
