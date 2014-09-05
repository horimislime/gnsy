//
//  GNSViewController.m
//  gnsy
//
//  Created by horimislime on 2014/08/29.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSViewController.h"
#import "GNSTabScrollViewController.h"
#import "GNSContentScrollViewController.h"
#import "GNSCategory.h"
#import "GNSTabView.h"

@interface GNSViewController ()
@property (strong, nonatomic) IBOutlet UIView *tabAreaView;
@property (strong, nonatomic) IBOutlet UIScrollView *contentAreaView;
@end

@implementation GNSViewController {
    GNSTabScrollViewController *tabController;
    GNSContentScrollViewController *scrollController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tabController = [[GNSTabScrollViewController alloc] initController];
    tabController.delegate = self;
    [self.tabAreaView addSubview:tabController.view];
    
    scrollController = [[GNSContentScrollViewController alloc] initController];
    scrollController.delegate = self;
    [self.contentAreaView addSubview:scrollController.view];
    
    // TODO:カテゴリのロードはviewロード前(スプラッシュのバックグランドとか)でやる
    [GNSCategory
     fetchContentAsync:NO
     success:^(NSArray *contents) {
         [tabController initTabForContents:contents];
         [scrollController setCategories:contents];
    }
     failure:^(NSError *error) {
         NSLog(@"error: %@", error);
    }];
}

- (void)contentViewChanged:(NSInteger)index {
    [tabController selectTabAtIndex:index];
}

- (void)tabSelectionChanged:(GNSTabView *)tab {
//    [scrollController ]
}



@end
