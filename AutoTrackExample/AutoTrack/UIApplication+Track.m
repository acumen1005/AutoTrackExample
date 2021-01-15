//
//  UIApplication+Track.m
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/14.
//

#import "UIApplication+Track.h"

@implementation UIApplication (Track)

- (BOOL)at_sendAction:(SEL)action to:(nullable id)target from:(nullable id)sender forEvent:(nullable UIEvent *)event {
    
    NSLog(@"at_sendAction");
    BOOL rs = [self at_sendAction:action to:target from:sender forEvent:event];
    return rs;
}


@end
