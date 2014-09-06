//
//  GNSWebViewController.m
//  gnsy
//
//  Created by horimislime on 2014/09/05.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSWebViewController.h"
#import "SVProgressHUD.h"

@interface GNSWebViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *contentWebView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;

@end

@implementation GNSWebViewController {
    NSString *_url;
    UINavigationController *_navigationController;
}

- (instancetype)initWithUrl:(NSString *)url {
    self = [super initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if(self) {
        _url = url;
        _navigationController = (UINavigationController *)[[UIApplication sharedApplication] delegate].window.rootViewController;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.contentWebView.delegate = self;
    
    [self.contentWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    [SVProgressHUD showWithStatus:@"読み込み中" maskType:SVProgressHUDMaskTypeBlack];
}


- (void)viewWillDisappear:(BOOL)animated {
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if(!webView.loading) {
        [SVProgressHUD dismiss];
        self.navigationItem.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    }
}

- (IBAction)backButtonTapped:(id)sender {
    [_navigationController popViewControllerAnimated:YES];
}
@end
