//
//  BWHomeViewController.m
//  BWiOSAnimation
//
//  Created by BobWong on 16/10/26.
//  Copyright © 2016年 BobWongStudio. All rights reserved.
//

#import "BWHomeViewController.h"
#import "BWTranslationViewController.h"
#import "BWRotationViewController.h"
#import "BWZoomViewController.h"
#import "BWStretchViewController.h"
#import "BWResearchViewController.h"

#define bw_NSStringFromClass(Class) NSStringFromClass([Class class])

@interface BWHomeViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation BWHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Home";
    _dataSource = @[bw_NSStringFromClass(BWTranslationViewController),
                    bw_NSStringFromClass(BWRotationViewController),
                    bw_NSStringFromClass(BWZoomViewController),
                    bw_NSStringFromClass(BWStretchViewController),
                    bw_NSStringFromClass(BWResearchViewController)
                    ];
    
    [self setUI];
}

- (void)setUI
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataSource ? _dataSource.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = _dataSource[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NSString *strClass = _dataSource[indexPath.row];
    Class class = NSClassFromString(strClass);
    UIViewController *vc = [[class alloc] init];
    vc.title = strClass;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
