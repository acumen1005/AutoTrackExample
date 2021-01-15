//
//  ATModel.h
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ATModel : NSObject

@property (nonatomic, strong) NSString *elementId;
@property (nonatomic, strong) NSString *elementType;


// business
@property (nonatomic, assign) NSInteger feedId;


- (instancetype)feedId:(NSInteger)feedId;
- (instancetype)elementId:(NSString *)elementId;
- (instancetype)elementType:(NSString *)elementType;

- (NSDictionary *)apply;

@end

NS_ASSUME_NONNULL_END
