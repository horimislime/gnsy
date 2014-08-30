//
//  GNSViewController.m
//  gnsy
//
//  Created by horimislime on 2014/08/29.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSViewController.h"
#import "GNSContentScrollViewController.h"
#import "GNSCategory.h"
#import "GNSTabView.h"

@interface GNSViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *tabAreaView;
@property (strong, nonatomic) IBOutlet UIView *borderAreaView;
@property (strong, nonatomic) IBOutlet UIScrollView *contentAreaView;
@end

@implementation GNSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    GNSTabView *tab=[[GNSTabView alloc] init];
    tab.frame=CGRectMake(0, 0, 50, 50);
    [self.tabAreaView addSubview:tab];
    
    GNSTabView *sub=tab.subviews[0];
    CGRect rect=tab.frame;
    
    CGRect tabframe=self.tabAreaView.frame;
    GNSContentScrollViewController *scrollController=[[GNSContentScrollViewController alloc] initWithNibName:@"GNSContentScrollViewController" bundle:nil];
                                                      
    [self.contentAreaView addSubview:scrollController.view];
    
    // TODO:カテゴリのロードはviewロード前(スプラッシュのバックグランドとか)でやる
    [GNSCategory setDelegate:scrollController];
    [GNSCategory fetchContent];
}
@end
