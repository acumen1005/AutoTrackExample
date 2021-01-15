//
//  UITableViewCell+Track.h
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/14.
//

#import <UIKit/UIKit.h>
#import "AutoTrackParamsProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (Track) <AutoTrackParamsProtocol>

@end

@interface UITableView (Track)

- (void)at_setDelegate:(id)delegate;

@end

NS_ASSUME_NONNULL_END
