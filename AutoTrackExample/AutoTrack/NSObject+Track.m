//
//  NSObject+Track.m
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/15.
//

#import "NSObject+Track.h"
#import <objc/runtime.h>

static void *const kATDelegateProxyClassName = (void *)&kATDelegateProxyClassName;
static void *const kATDelegateProxyRefererURL = (void *)&kATDelegateProxyRefererURL;

@implementation NSObject (Track)

- (NSString *)at_className {
    return objc_getAssociatedObject(self, kATDelegateProxyClassName);
}

- (void)setAt_className:(NSString *)at_className {
    objc_setAssociatedObject(self, kATDelegateProxyClassName, at_className, OBJC_ASSOCIATION_COPY);
}

- (NSString *)at_refererURL {
    return objc_getAssociatedObject(self, kATDelegateProxyRefererURL);
}

- (void)setAt_refererURL:(NSString *)at_refererURL {
    objc_setAssociatedObject(self, kATDelegateProxyRefererURL, at_refererURL, OBJC_ASSOCIATION_COPY);
}

@end
