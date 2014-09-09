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
@property (strong, nonatomic) IBOutlet UIView *borderAreaView;

@end

@implementation GNSTabScrollViewController {
    NSMutableArray *_contentTabs;
    GNSTabView *_lastActiveTab;
    CGFloat _currentContentOffset;
}

static NSArray *_colorHexCodes;

- (instancetype)initController {
    return [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabScrollView.delegate = self;
    _contentTabs = [[NSMutableArray alloc] initWithCapacity:0];
    _currentContentOffset = 0;
    
    _colorHexCodes = @[@"FA7054",
                       @"0092BA",
                       @"D97B37"];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (int i = 0; i < _contentTabs.count; i++) {
        GNSTabView *tab = _contentTabs[i];
        if (!self.tabScrollView.dragging && [event touchesForView:tab]) {
            [self selectTabAtIndex:i];
            [self scrollToTab:tab];
            [self.delegate tabSelectionChanged:i];
        }
    }
}

- (UIColor *)getColorForIndex:(NSInteger)index {
    if (index > (_colorHexCodes.count - 1)) {
        return [UIColor colorWithHex:_colorHexCodes[index % _colorHexCodes.count]];
    }
    else {
        return [UIColor colorWithHex:_colorHexCodes[index]];
    }
}

/**
 *  指定したタブの位置までスクロールする。
 *
 *  @param tab タブ
 */
- (void)scrollToTab:(GNSTabView *)tab {
    CGFloat tabCenterX = tab.frame.origin.x + CGRectGetWidth(tab.frame) / 2;
    CGFloat scrollToPositionX = tabCenterX - CGRectGetWidth(self.tabScrollView.frame) / 2;
    CGFloat maxScrollableOffset = self.tabScrollView.contentSize.width - CGRectGetWidth([UIScreen mainScreen].bounds);
    
    if (scrollToPositionX < 0) {
        scrollToPositionX = 0;
    }
    else if (scrollToPositionX > maxScrollableOffset) {
        scrollToPositionX = maxScrollableOffset;
    }
    [UIView animateWithDuration:0.4f animations:^ {
        self.tabScrollView.contentOffset = CGPointMake(scrollToPositionX, 0);
    }];
}

- (void)addTab:(GNSCategory *)category {
    UIColor *tabColor = [self getColorForIndex:_contentTabs.count];
    
    CGFloat tabWidth = [self calcurateTabWidth:category.categoryTitle];
    CGRect newFrame = CGRectMake(_currentContentOffset, 0, tabWidth, CGRectGetHeight(self.view.frame));
    GNSTabView *tab = [[GNSTabView alloc] initWithCategory:category
                                                  tabColor:tabColor
                                                     frame:newFrame];
    [self.tabScrollView addSubview:tab];
    _currentContentOffset += tabWidth;

    [_contentTabs addObject:tab];
    if(_contentTabs.count == 1) {
        [self selectTabAtIndex:0];
    }
    
    [self.tabScrollView setContentSize:CGSizeMake(_currentContentOffset, CGRectGetHeight(self.view.frame))];
}

- (float)calcurateTabWidth:(NSString *)labelText {
    return (14 * labelText.length) + 10;
}

- (void)initTabForContents:(NSArray *)contents {
    for (GNSCategory *category in contents) {
        [self addTab:category];
    }
}

- (void)selectTabAtIndex:(NSInteger)index {
    GNSTabView *selectedTab = _contentTabs[index];
    if (selectedTab == _lastActiveTab) {
        return;
    }
    
    [selectedTab setTabSelected:YES];
    [self scrollToTab:selectedTab];
    self.borderAreaView.backgroundColor = selectedTab.tabColor;
    
    [_lastActiveTab setTabSelected:NO];
    _lastActiveTab = selectedTab;
}
@end
