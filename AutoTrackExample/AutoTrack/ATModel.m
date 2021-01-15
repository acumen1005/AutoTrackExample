//
//  ATModel.m
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/15.
//

#import "ATModel.h"


@interface ATModel ()

@property (nonatomic, strong) NSMutableDictionary *mutableDict;

@end

@implementation ATModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableDict = [NSMutableDictionary dictionary];
    }
    return self;
}


- (instancetype)feedId:(NSInteger)feedId {
    [self.mutableDict setObject:@(feedId) forKey:@"feedId"];
    return self;
}

- (instancetype)elementId:(NSString *)elementId {
    [self.mutableDict setObject:elementId forKey:@"elementId"];
    return self;
}

- (instancetype)elementType:(NSString *)elementType {
    [self.mutableDict setObject:elementType forKey:@"elementType"];
    return self;
}

- (NSDictionary *)apply {
    return [self.mutableDict copy];
}

@end
