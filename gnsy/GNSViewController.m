//
//  GNSViewController.m
//  gnsy
//
//  Created by horimislime on 2014/08/29.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSViewController.h"

@interface GNSViewController ()
@property (strong, nonatomic) IBOutlet UIView *tabAreaView;
@property (strong, nonatomic) IBOutlet UIView *borderAreaView;
@property (strong, nonatomic) IBOutlet UIScrollView *contentAreaView;
@end

@implementation GNSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UIPageViewController *pageController = [[UIPageViewController alloc]];
    GNSContentViewController *contentController = [[GNSContentViewController alloc] initWithNibName:@"GNSContentViewController" bundle:nil];
    [self.contentAreaView addSubview:[[GNSContentViewController alloc] initWithNibName:@"GNSContentViewController" bundle:nil].view];
    [self.contentAreaView addSubview:[[GNSContentViewController alloc] initWithNibName:@"GNSContentViewController" bundle:nil].view];
    [self.contentAreaView setContentSize:CGSizeMake(640, 480)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
