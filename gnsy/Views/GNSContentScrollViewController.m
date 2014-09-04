//
//  GNSContentScrollViewController.m
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSContentScrollViewController.h"
# import "UIScrollView+TouchEvent.h"

@interface GNSContentScrollViewController ()
@property(strong, nonatomic) IBOutlet UIScrollView *contentScrollView;

@end

@implementation GNSContentScrollViewController {
    CGFloat _contentHeight;
    CGFloat _contentWidth;
    NSInteger _pageCount;
}

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _pageCount = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentScrollView.delegate = self;
    
    _contentHeight = self.view.frame.size.height;
    _contentWidth = self.view.frame.size.width;
}

- (void)addPageView:(GNSCategory *)content {
    GNSContentViewController *controller =
    [[GNSContentViewController alloc] initWithContentInfo:content lazy:YES];
    
    CGRect rect = controller.view.frame;
    rect.origin.x = _contentWidth * _pageCount;
    rect.origin.y = self.view.frame.origin.y;
    controller.view.frame = rect;
    
    [self.contentScrollView addSubview:controller.view];
    _pageCount++;
    
    [self.contentScrollView
     setContentSize:CGSizeMake(_contentWidth * _pageCount, _contentHeight)];
}

- (void)setCategories:(NSArray *)categories {
    // TODO:コンテンツの正当性チェックはrootcontrollerでやりたいので、delegateやめる
    for (GNSCategory *category in categories) {
        [self addPageView:category];
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    int page = scrollView.contentOffset.x/scrollView.contentSize.width;
    CGFloat scrollPerPage=scrollView.contentOffset.x / _contentWidth;
    NSLog(@"page=%f",scrollPerPage);
}
@end
