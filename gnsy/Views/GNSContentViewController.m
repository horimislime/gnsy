//
//  GNSContentViewController.m
//  gnsy
//
//  Created by horimislime on 2014/08/29.
//  Copyright (c) 2014年 horimislime. All rights reserved.
//

#import "GNSContentViewController.h"
#import "GNSNews.h"

@interface GNSContentViewController ()

@end

@implementation GNSContentViewController {
    NSString *_categoryId;
    GNSNews *_loader;
}

- (id)initWithContentInfo:(GNSCategory *)info lazy:(BOOL)lazy {
    self = [self initWithNibName:@"GNSContentViewController" bundle:nil];
    if(self){
        _categoryId = info.categoryId;
        _loader=[[GNSNews alloc] initWithContentId:_categoryId];
        _loader.delegate=self;
        
        [_loader load];
    }

    //TODO:
//    if(!lazy){
//        
//    }
    
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GNSContentDelegate
-(void)contentDidFinishLoad:(NSArray *)contents{
    
}

-(void)contentDidFailLoad{
    
}
@end
