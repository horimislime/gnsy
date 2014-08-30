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

@interface GNSViewController ()
@property (strong, nonatomic) IBOutlet UIView *tabAreaView;
@property (strong, nonatomic) IBOutlet UIView *borderAreaView;
@property (strong, nonatomic) IBOutlet UIScrollView *contentAreaView;
@end

@implementation GNSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    GNSContentScrollViewController *scrollController=[[GNSContentScrollViewController alloc] initWithNibName:@"GNSContentScrollViewController" bundle:nil];
                                                      
    [self.contentAreaView addSubview:scrollController.view];
    
    // TODO:カテゴリのロードはviewロード前(スプラッシュのバックグランドとか)でやる
    [GNSCategory setDelegate:scrollController];
    [GNSCategory load];
}
@end
