//
//  GNSNews.h
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSContent.h"

@interface GNSNews : GNSContent
- (id)initWithContentId:(NSString *)contentId;
- (id)initWithTitle:(NSString *)title picture:(NSString *)picture url:(NSString *)url;
- (void)load;

@property(weak,nonatomic)id<GNSContentDelegate>delegate;

@property(strong,nonatomic)NSString *newsTitle;
@property(strong,nonatomic)NSString *newsPicture;
@property(strong,nonatomic)NSString *newsUrl;
@end
