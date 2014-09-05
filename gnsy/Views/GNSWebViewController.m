//
//  GNSWebViewController.m
//  gnsy
//
//  Created by horimislime on 2014/09/05.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSWebViewController.h"

@interface GNSWebViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *contentWebView;

@end

@implementation GNSWebViewController {
    NSString *_url;
}

- (instancetype)initWithUrl:(NSString *)url {
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if(self) {
        _url = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationController *naviController =(UINavigationController *)[[UIApplication sharedApplication] delegate].window.rootViewController;
    naviController.navigationBarHidden = NO;
    [self.contentWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
}
- (void)viewWillDisappear:(BOOL)animated {
    UINavigationController *naviController =(UINavigationController *)[[UIApplication sharedApplication] delegate].window.rootViewController;
    naviController.navigationBarHidden = YES;
}

@end
