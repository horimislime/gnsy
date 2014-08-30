//
//  GNSCategory.m
//  gnsy
//
//  Created by horimislime on 2014/08/30.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSCategory.h"
#import "AFNetworking.h"

@implementation GNSCategory

static id<GNSContentDelegate> _delegate;

@synthesize categoryId;
@synthesize categoryTitle;

- (id)initWithId:(NSString *)aCategoryId title:(NSString *)aCategoryTitle {
    if (self = [super init]) {
        self.categoryId = aCategoryId;
        self.categoryTitle = aCategoryTitle;
    }
    return self;
}

+ (void)setDelegate:(id<GNSContentDelegate>)delegate {
    _delegate = delegate;
}

+ (void)fetchContent {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://api.myjson.com/bins/12dbv"
      parameters:nil
         success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
             
             NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:0];
             for (NSDictionary *category in responseObject[@"data"]) {
                 [result
                  addObject:[[GNSCategory alloc] initWithId:category[@"id"]
                                                      title:category[@"name"]]];
             }
             
             [_delegate contentDidFinishLoad:result];
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSLog(@"Error = %@", error);
             [_delegate contentDidFailLoad];
         }];
}
@end
