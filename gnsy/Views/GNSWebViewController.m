//
//  GNSWebViewController.m
//  gnsy
//
//  Created by horimislime on 2014/09/05.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSWebViewController.h"
#import "SVProgressHUD.h"
#import <Social/Social.h>

@interface GNSWebViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *contentWebView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *backButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *facebookButton;

@end

@implementation GNSWebViewController {
    NSString *_url;
    SLComposeViewController *_twitterComposeController;
    SLComposeViewController *_facebookComposeController;
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
    [self.facebookButton setBackgroundImage:[UIImage imageNamed:@"facebook"]
                                   forState:UIControlStateNormal
                                      style:UIBarButtonItemStylePlain
                                 barMetrics:UIBarMetricsDefault];
    
    self.contentWebView.delegate = self;
    
    [self.contentWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    [SVProgressHUD showWithStatus:@"読み込み中" maskType:SVProgressHUDMaskTypeBlack];
}


- (void)viewWillDisappear:(BOOL)animated {
}
- (IBAction)twitterButtonTapped:(id)sender {
    [self presentViewController:_twitterComposeController animated:YES completion:nil];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    if(webView.loading) {
        return;
    }
    
    [SVProgressHUD dismiss];
    
    NSString *url = [webView stringByEvaluatingJavaScriptFromString:@"location.href"];
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    // twitter share
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        _twitterComposeController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        [_twitterComposeController setCompletionHandler:^(SLComposeViewControllerResult result) {
            if (result == SLComposeViewControllerResultDone) {
                //投稿成功時の処理
            }
        }];
        
        [_twitterComposeController addURL:[NSURL URLWithString:url]];
        [_twitterComposeController setInitialText:title];
    }
    
    // facebook share
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        _facebookComposeController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [_facebookComposeController addURL:[NSURL URLWithString:url]];
        [_facebookComposeController setInitialText:title];
    }
}

- (IBAction)backButtonTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
