//
//  DetailViewController.h
//  SimbleTable
//
//  Created by 东皇太二 on 15-5-18.
//  Copyright (c) 2015年 jiao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *cName;
@property (strong, nonatomic) IBOutlet UILabel *tName;
@property (strong, nonatomic) IBOutlet UIImageView *cImage;
@property (strong, nonatomic) IBOutlet UITextView *information;
@property (strong, nonatomic) IBOutlet UITabBarItem *favorite;
@property(nonatomic,strong)NSString *cname;
@property(nonatomic,strong)NSString *tname;
@property(nonatomic,strong)NSString *cimage;
@property(nonatomic,strong)NSString *cinformation;
@end
