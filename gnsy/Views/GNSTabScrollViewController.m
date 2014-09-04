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
#import "UIColor+GNSUtils.h"

@interface GNSTabScrollViewController ()
@property(strong, nonatomic) IBOutlet UIScrollView *tabScrollView;

@end

@implementation GNSTabScrollViewController {
    NSMutableArray *_contentTabs;
    
}

static NSArray *_colorHexCodes;
const static int TAB_WIDTH=80;
const static int TAB_HEIGHT=48;

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
    
    _colorHexCodes=@[@"BF543B",
                     @"CFEAF2",
                     @"F0E3F8"];
}

- (UIColor *)getColorForIndex:(NSInteger)index {
    if(index > (_colorHexCodes.count - 1)) {
        return [UIColor colorWithHex:_colorHexCodes[index % _colorHexCodes.count]];
    }
    else {
        return [UIColor colorWithHex:_colorHexCodes[index]];
    }
}

- (void)addTab:(GNSCategory *)category {
    GNSTabView *tab = [[GNSTabView alloc] init];
    [tab setContent:category];
    
    [self.tabScrollView addSubview:tab];
    
    
    tab.backgroundColor=[self getColorForIndex:_contentTabs.count];

    CGRect frame=CGRectMake(_contentTabs.count * TAB_WIDTH, 0, TAB_WIDTH, TAB_HEIGHT);
//    tab.frame=frame;
    [tab setFrameSize:frame];
    tab.layer.cornerRadius=5.0f;
    
    [_contentTabs addObject:tab];
    
    float maxWidth=_contentTabs.count*TAB_WIDTH;
    [self.tabScrollView setContentSize:CGSizeMake(640, TAB_HEIGHT)];
}

- (float)calcurateTabWidth:(NSString *)labelText {
    return 0.0f;
}

- (void)initTabForContents:(NSArray *)contents {
    for(GNSCategory *category in contents) {
        [self addTab:category];
    }
}

@end
