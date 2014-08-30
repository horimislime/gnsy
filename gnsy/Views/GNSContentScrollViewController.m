//
//  GNSContentScrollViewController.m
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSContentScrollViewController.h"

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
    _contentHeight = self.view.frame.size.height;
    _contentWidth = self.view.frame.size.width;
    
    [self addPage];
    [self addPage];
}

- (void)addPage {
    GNSContentViewController *controller =[[GNSContentViewController alloc] initWithNibName:@"GNSContentViewController" bundle:nil];
    CGRect rect = controller.view.frame;
    rect.origin.x=_contentWidth*_pageCount;
    rect.origin.y=self.view.frame.origin.y;
    controller.view.frame = rect;
    
    [self.contentScrollView addSubview:controller.view];
    _pageCount++;
    
    [self.contentScrollView setContentSize:CGSizeMake(_contentWidth*_pageCount, _contentHeight)];
}

# pragma mark - GNSContentDelegate
-(void)contentDidFinishLoad:(NSArray *)contents {
    //TODO:コンテンツの正当性チェックはrootcontrollerでやりたいので、delegateやめる
//    for(GNSContent *content:contents){
//        
//    }
    NSLog(@"");
}
-(void)contentDidFailLoad {
    
}
@end
