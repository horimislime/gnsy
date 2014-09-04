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
const static int TAB_WIDTH=160;
const static int TAB_HEIGHT=40;

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
    self.tabScrollView.delegate = self;
    _contentTabs = [[NSMutableArray alloc] initWithCapacity:0];
    
    _colorHexCodes=@[@"BF543B",
                     @"CFEAF2",
                     @"F0E3F8"];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for(GNSTabView *tab in _contentTabs){
        if(!self.tabScrollView.dragging && [event touchesForView:tab]){
            NSLog(@"");
        }
    }
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
    UIColor *tabColor=[self getColorForIndex:_contentTabs.count];
    GNSTabView *tab =[[GNSTabView alloc] initWithCategory:category
                                                 tabColor:tabColor];
//    [tab setContent:category];
    
    [self.tabScrollView addSubview:tab];
    
    
//    tab.backgroundColor=[self getColorForIndex:_contentTabs.count];

    [tab setFrameSize:CGRectMake(_contentTabs.count * TAB_WIDTH, 0, TAB_WIDTH, TAB_HEIGHT)];
    tab.layer.cornerRadius=5.0f;
    
    [_contentTabs addObject:tab];
    if(_contentTabs.count ==1) {
        [tab setTabSelected:YES];
    }
    
    [self.tabScrollView setContentSize:CGSizeMake(_contentTabs.count * TAB_WIDTH, TAB_HEIGHT)];
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
