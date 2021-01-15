//
//  ViewController.m
//  AutoTrackExample
//
//  Created by 谷雷雷 on 2021/1/14.
//

#import "ViewController.h"
#import "ViewControllerB.h"
#import "AutoTrackParamsProtocol.h"
#import "ATEventProperty.h""

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, AutoTrackParamsProtocol>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"page A";
 
    [self configUI];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.tableView.frame = self.view.bounds;
}

- (void)configUI {
    [self.view addSubview:self.tableView];
    
    self.tableView.rowHeight = 160;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"tableView didSelectRowAtIndexPath %@", indexPath);
    
    ViewControllerB *vcb = [[ViewControllerB alloc] init];
    [self.navigationController pushViewController:vcb animated:YES];
}

#pragma mark - AutoTrackParamsProtocol

- (NSDictionary *)autoTrackParams {
    return @{
        AT_EVENT_PROPERTY_SCREEN_URL: @"vca"
    };
}

@end
