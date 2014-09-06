//
//  GNSWebViewController.h
//  gnsy
//
//  Created by horimislime on 2014/09/05.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GNSWebViewController : UIViewController<UIWebViewDelegate>
- (instancetype)initWithUrl:(NSString *)url;
@end
