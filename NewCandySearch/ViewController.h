//
//  ViewController.h
//  NewCandySearch
//
//  Created by 东皇太二 on 15-5-23.
//  Copyright (c) 2015年 jiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Course.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,UISearchDisplayDelegate>
@property (nonatomic,strong) NSArray *courseArray;
@property (nonatomic,strong) NSMutableArray *filteredCandyArray;
@property IBOutlet UISearchBar *candySearchBar;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
-(IBAction)goToSearch:(id)sender;
@end
