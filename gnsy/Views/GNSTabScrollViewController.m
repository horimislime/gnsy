//
//  GNSTabScrollViewController.m
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSTabScrollViewController.h"
#import "GNSTabView.h"
#import "GNSCategory.h"

@interface GNSTabScrollViewController ()
@property(strong, nonatomic) IBOutlet UIScrollView *tabScrollView;

@end

@implementation GNSTabScrollViewController {
    NSMutableArray *_contentTabs;
}

const static int TAB_WIDTH=16;

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _contentTabs = [[NSMutableArray alloc] initWithCapacity:0];
}

- (void)addTab:(GNSCategory *)category {
    GNSTabView *tab = [[GNSTabView alloc] init];
    [tab setContent:category];
    
    tab.frame=CGRectMake(_contentTabs.count * TAB_WIDTH, 0, TAB_WIDTH, 30);
    CGRect frame=tab.frame;
    [self.view addSubview:tab];
    [_contentTabs addObject:tab];
}

- (void)initTabForContents:(NSArray *)contents {
    [self addTab:contents[0]];
//    for(GNSCategory *category in contents) {
//        [self addTab:category];
//    }
}

@end
