//
//  AutoTrack.m
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/14.
//

#import "AutoTrack.h"

@implementation AutoTrack

+ (instancetype)sharedInstance {
    static AutoTrack *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AutoTrack alloc] init];
    });
    return instance;
}



@end
