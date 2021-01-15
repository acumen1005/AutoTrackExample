//
//  AppDelegate.m
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/14.
//

#import "AppDelegate.h"
#import "NSObject+Swizzle.h"
#import "UITableView+Track.h"
#import "UIApplication+Track.h"
#import "UITableView+Track.h"
#import "UIViewController+Track.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [UIApplication at_swizzleMethod:@selector(sendAction:to:from:forEvent:)
                         withMethod:@selector(at_sendAction:to:from:forEvent:)];
    [UIViewController at_swizzleMethod:@selector(viewDidAppear:)
                            withMethod:@selector(at_viewDidAppear:)];
    [UITableView at_swizzleMethod:@selector(setDelegate:)
                            withMethod:@selector(at_setDelegate:)];
            
    return YES;
}

#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
