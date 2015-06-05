//
//  DetailViewController.m
//  SimbleTable
//
//  Created by 东皇太二 on 15-5-18.
//  Copyright (c) 2015年 jiao. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize cName;
@synthesize tName;
@synthesize information;
@synthesize cImage;
@synthesize favorite;
@synthesize cname;
@synthesize tname;
@synthesize cimage;
@synthesize cinformation;
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
    // Do any additional setup after loading the view.
    cName.text=cname;
    tName.text=tname;
    cImage.image=[UIImage imageNamed:cimage];
    information.editable=NO;
    information.text=cinformation;
    //favorite.title=@"收藏";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
