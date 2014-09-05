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

@synthesize categoryId;
@synthesize categoryTitle;

- (id)initWithId:(NSString *)aCategoryId title:(NSString *)aCategoryTitle {
    if (self = [super init]) {
        self.categoryId = aCategoryId;
        self.categoryTitle = aCategoryTitle;
    }
    return self;
}

+ (void)fetchContentAsync:(BOOL)doAsync
                  success:(void (^)(NSArray *))success
                  failure:(void (^)(NSError *))failure {
    
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
             
             success(result);
         }
         failure:^(NSURLSessionDataTask *task, NSError *error) {
             NSLog(@"Error = %@", error);
             failure(error);
         }
     ];
}
@end
