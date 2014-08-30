//
//  GNSNews.m
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSNews.h"
#import "AFNetworking.h"

@implementation GNSNews {
    NSString *_resourceUrl;
}

- (id)initWithContentId:(NSString *)contentId {
    if (self = [super init]) {
        _resourceUrl = [NSMutableString
                        stringWithFormat:@"https://api.myjson.com/bins/%@", contentId];
    }
    return self;
}

- (id)initWithTitle:(NSString *)title
            picture:(NSString *)picture
                url:(NSString *)url {
    if (self = [super init]) {
        self.newsTitle = title;
        self.newsPicture = picture;
        self.newsUrl = url;
    }
    
    return self;
}

- (void)load {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:_resourceUrl
      parameters:nil
         success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
             
             NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:0];
             for (NSDictionary *c in responseObject[@"data"]) {
                 [result addObject:[[GNSNews alloc] initWithTitle:c[@"title"]
                                                          picture:c[@"picture"]
                                                              url:c[@"url"]]];
             }
             
             [self.delegate contentDidFinishLoad:result];
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSLog(@"Error = %@", error);
             [self.delegate contentDidFailLoad];
      }];
}
@end
