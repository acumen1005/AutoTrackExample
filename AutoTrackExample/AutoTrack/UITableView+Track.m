//
//  UITableViewCell+Track.m
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/14.
//

#import "UITableView+Track.h"
#import "ATDelegateProxy.h"

@implementation UITableView (Track)

- (NSDictionary *)autoTrackParams {
    return @{
        
    };
}

- (void)at_setDelegate:(id)delegate {
    [self at_setDelegate:delegate];
    
    NSLog(@"at_setDelegate: ");
    
    [ATDelegateProxy proxyWithDelegate:delegate];
}

@end
