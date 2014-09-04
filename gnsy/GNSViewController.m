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
    
    scrollController = [[GNSContentScrollViewController alloc] initWithNibName:@"GNSContentScrollViewController"
                                                                        bundle:nil];
    scrollController.delegate = self;
    [self.contentAreaView addSubview:scrollController.view];
    
    // TODO:カテゴリのロードはviewロード前(スプラッシュのバックグランドとか)でやる
    [GNSCategory setDelegate:self];
    [GNSCategory fetchContent];
}

- (void)contentDidFinishLoad:(NSArray *)contents {
    [tabController initTabForContents:contents];
    [scrollController setCategories:contents];
}
- (void)contentDidFailLoad {
    
}

- (void)tabSelectionChanged:(GNSTabView *)tab {
//    [self updateBorderColor:tab.tabColor];
}

- (void)contentViewChanged:(NSInteger)index {
    [tabController selectTabAtIndex:index];
}





@end
