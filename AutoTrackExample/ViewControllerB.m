//
//  ViewControllerB.m
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/15.
//

#import "ViewControllerB.h"
#import "AutoTrackParamsProtocol.h"
#import "ATEventProperty.h"
#import "ATModel.h"

@interface ViewControllerB () <AutoTrackParamsProtocol>

@end

@implementation ViewControllerB

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"page B";
    self.view.backgroundColor = [UIColor cyanColor];
}

#pragma mark - AutoTrackParamsProtocol

- (NSDictionary *)autoTrackParams {
    ATModel *model = [[ATModel alloc] init];
    return [[[[model feedId:1] elementId:@"2"] elementType:@"EventAppear"] apply];
}

@end
