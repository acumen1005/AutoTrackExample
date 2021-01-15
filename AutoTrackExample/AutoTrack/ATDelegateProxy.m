//
//  ATDelegateProxy.m
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/15.
//

#import "ATDelegateProxy.h"
#import "ATClassHelper.h"
#import "ATMethodHelper.h"
#import "NSObject+Track.h"

#import <objc/runtime.h>
#import <objc/message.h>
#import <UIKit/UIKit.h>

static NSString *const kATDelegateSuffix = @"__CN.ACUMEN";
static NSString *const kATKVODelegatePrefix = @"KVONotifying_";
static NSString *const kATClassSeparatedChar = @".";
static long subClassIndex = 0;

@implementation ATDelegateProxy (SubclassMethod)

- (Class)class {
    if (self.at_className) {
        return NSClassFromString(self.at_className);
    }
    return [super class];
}

+ (void)invokeWithTarget:(NSObject *)target
                selector:(SEL)selector
               tableView:(UITableView *)tableView
               indexPath:(NSIndexPath *)indexPath {
    Class originalClass = NSClassFromString(target.at_className) ? : target.superclass;
    struct objc_super targetSuper = {
        .receiver = target,
        .super_class = originalClass
    };
    // target 是 AutoTrack 动态生成的（是遵循 UITableViewDelegate 类的子类）
    ((void (*)(struct objc_super *, SEL, id, id))objc_msgSendSuper)(&targetSuper, selector, tableView, indexPath);
    
    // handle track
    [tableView layoutIfNeeded];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    NSMutableArray *mutableArr = [NSMutableArray array];
    
    UIView *view = cell;
    do {
        NSString *viewPoint = NSStringFromClass([view class]);
        if ([view isKindOfClass:[UITableViewCell class]]) {
            viewPoint = [NSString stringWithFormat:@"%@(%@:%@)", viewPoint, @(indexPath.section), @(indexPath.row)];
        }
        [mutableArr addObject:viewPoint];
        // 通过响应链遍历出试图的结构，与 superView 相比好处是 view -> view -> UIViewController -> UIWindow。这里判断 view 和 superView 没有什么差别
    } while ((view = (id)view.nextResponder) && [view isKindOfClass:UIView.class]);
    
    NSString *path = [[[mutableArr reverseObjectEnumerator] allObjects] componentsJoinedByString:@"_"];
    NSLog(@"TRACK PATH = %@", path);
}


@end

@implementation ATDelegateProxy


+ (void)proxyWithDelegate:(id)delegate {
    [ATDelegateProxy hookDidSelectMethodWithDelegate:delegate];
}

+ (void)hookDidSelectMethodWithDelegate:(id)delegate {
    
    SEL tableViewSeletor = @selector(tableView:didSelectRowAtIndexPath:);
    
    BOOL canResponseTableView = [delegate respondsToSelector:tableViewSeletor];

    if (!canResponseTableView) {
        return ;
    }
    
    Class proxyClass = [ATDelegateProxy class];
    
    Class realClass = object_getClass(delegate);
    
    if ([NSStringFromClass(realClass) hasPrefix:kATKVODelegatePrefix]) {
        // TODO: KVO
    } else {
        NSString *dynamicClassName = [[self class] generateATClassName:delegate];
        Class dynamicClass = [ATClassHelper allocateClassWithObject:delegate className:dynamicClassName];
        if (!dynamicClass) {
            return;
        }
        // 将 didSelect 方法替换添加到 dynamicClass 类中，如果存在就替换
        [ATMethodHelper addInstanceMethodWithSeletor:tableViewSeletor fromClass:proxyClass toClass:dynamicClass];
        [ATMethodHelper addInstanceMethodWithSeletor:@selector(class) fromClass:proxyClass toClass:dynamicClass];
        [ATClassHelper registerClass:dynamicClass];
        
        // 修改 isa 指针
        [ATClassHelper setObject:delegate toClass:dynamicClass];
    }
}

+ (BOOL)isATClass:(Class)aClass {
    NSString *className = NSStringFromClass(aClass);
    return [className containsString:kATDelegateSuffix];
}

+ (NSString *)generateATClassName:(id)obj {
    Class class = object_getClass(obj);
    if ([[self class] isATClass:class]) return NSStringFromClass(class);
    return [NSString stringWithFormat:@"%@%@%@%@", NSStringFromClass(class), kATClassSeparatedChar, @(subClassIndex++), kATDelegateSuffix];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"UITableViewDelegate ....");
    
    // 将 didSelect 方法转发到原方法
    [ATDelegateProxy invokeWithTarget:self
                             selector:@selector(tableView:didSelectRowAtIndexPath:)
                            tableView:tableView
                            indexPath:indexPath];
}

@end
