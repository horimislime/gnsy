//
//  GNSContentViewController.m
//  gnsy
//
//  Created by horimislime on 2014/08/29.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSContentViewController.h"
#import "GNSWebViewController.h"
#import "GNSNews.h"
#import "GNSTableViewCell.h"

@interface GNSContentViewController ()
@property(strong, nonatomic) IBOutlet UITableView *contentTableView;
@end

@implementation GNSContentViewController {
    GNSCategory *_category;
    GNSNews *_loader;
    NSArray *_contents;
}

- (id)initWithContentInfo:(GNSCategory *)info lazy:(BOOL)lazy {
    self = [self initWithNibName:@"GNSContentViewController" bundle:nil];
    if (self) {
        _category = info;
        _loader = [[GNSNews alloc] initWithContentId:_category.categoryId];
        _loader.delegate = self;
        
        [_loader fetchContent];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    
    [self.contentTableView registerNib:[UINib nibWithNibName:@"GNSTableViewCell" bundle:nil]
                forCellReuseIdentifier:_category.categoryId];
    
}

#pragma mark - GNSContentDelegate
- (void)contentDidFinishLoad:(NSArray *)contents {
    _contents=contents;
    [self.contentTableView reloadData];
}

- (void)contentDidFailLoad {
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GNSNews *news = _contents[indexPath.row];
    GNSWebViewController *webViewController = [[GNSWebViewController alloc] initWithUrl:news.newsUrl];
    
    UINavigationController *navigationController = (UINavigationController *)[[UIApplication sharedApplication] delegate].window.rootViewController;
    [navigationController pushViewController:webViewController animated:YES];
    
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120.0;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _contents.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GNSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_category.categoryId];
    GNSNews *news = _contents[indexPath.row];
    [cell loadContent:news category:_category];
    
    return cell;
}
@end














