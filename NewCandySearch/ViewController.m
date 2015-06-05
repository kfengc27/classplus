//
//  ViewController.m
//  NewCandySearch
//
//  Created by 东皇太二 on 15-5-23.
//  Copyright (c) 2015年 jiao. All rights reserved.
//

#import "ViewController.h"
#import "SelfCell.h"
#import "DetailViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize courseArray;
@synthesize filteredCandyArray;
@synthesize candySearchBar;
- (void)viewDidLoad
{
    [super viewDidLoad];
    //设置导航栏背景图片
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Title"] forBarMetrics:(UIBarMetricsDefault)];
    //隐藏搜索栏
    CGRect newBounds = self.tableView.bounds;
    newBounds.origin.y = newBounds.origin.y + candySearchBar.bounds.size.height;
    self.tableView.bounds = newBounds;
    courseArray=[NSArray arrayWithObjects:
                [Course courseOfAttribute:@"人文" name:@"大学国文" teacher:@"李瑞生" tablepng:@"01.png"],
                [Course courseOfAttribute:@"社科" name:@"旅游摄影与数字暗房技术" teacher:@"陈飙" tablepng:@"02.png"],
                [Course courseOfAttribute:@"体技" name:@"大学生就业政策解析与法律维权" teacher:@"付秋静" tablepng:@"03.png"],
                 [Course courseOfAttribute:@"人文" name:@"汉学与汉学研究" teacher:@"张月明" tablepng:@"01.png"],
                  [Course courseOfAttribute:@"体技" name:@"大学生心理拓展" teacher:@"夏文" tablepng:@"02.png"],
                  [Course courseOfAttribute:@"人文" name:@"西方的智慧" teacher:@"刘宇鹏" tablepng:@"03.png"],nil];
    filteredCandyArray=[NSMutableArray arrayWithCapacity:[courseArray count]];
    //刷新tableView列表
    [self.tableView reloadData];
}
//响应搜索功能
-(IBAction)goToSearch:(id)sender
{
    // 如果你担心用户无法发现藏在列表顶端的搜索栏，那我们在导航栏加一个搜索图标。
    // 如果你不隐藏搜索栏，那就别加入这个搜索图标，否则就重复了。
    [candySearchBar becomeFirstResponder];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==self.searchDisplayController.searchResultsTableView){
        return [filteredCandyArray count];
    }
    else{
        return [courseArray count];
    }
}
//设置单元格的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier=@"Cell";
    SelfCell *cell=[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell==nil)
    {
        cell=[[SelfCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    //创建一个Candy对象
    Course *course=nil;
    if(tableView==self.searchDisplayController.searchResultsTableView){
        self.searchDisplayController.searchResultsDataSource=self;
        self.searchDisplayController.searchResultsDelegate=self;
        
        course=[filteredCandyArray objectAtIndex:indexPath.row];
        //[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        //cell=[[SelfCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

        //cell.textLabel.text=candy.name;
        //cell.detailTextLabel.text=candy.category;
    }
    else{
        course=[courseArray objectAtIndex:indexPath.row];
       
    }
    //设置表的一行
    cell.courseName.text=course.courseName;
    cell.teacherName.text=course.teachers;
    cell.courseAttributes.text=course.courseAttribute;
    cell.pngImageView.image=[UIImage imageNamed:course.tablepng];
   // [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}
-(void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{     // 根据搜索栏的内容和范围更新过滤后的数组。     // 先将过滤后的数组清空。
    [self.filteredCandyArray removeAllObjects];
    // 用NSPredicate来过滤数组。
    //SELF.name指的是数组中每一个Candy对象的“name”属性。”contains[c]“会让predicate搜索“name”属性中的字符串，看看有没有和后面提供的“searchText”一样的字符串。大小写有别。
    //搜索的关键字是教师或者课程
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(self.courseName contains[c] %@) OR (self.teachers contains[c] %@)",searchText,searchText];
    filteredCandyArray = [NSMutableArray arrayWithArray:[courseArray filteredArrayUsingPredicate:predicate]];
}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    // 当用户改变搜索字符串时，让列表的数据来源重新加载数据
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    // 返回YES，让table view重新加载。
    return YES;
}
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    // 当用户改变搜索范围时，让列表的数据来源重新加载数据
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    // 返回YES，让table view重新加载。
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //切入详细视图
    [self performSegueWithIdentifier:@"showDetail" sender:tableView];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        DetailViewController *controller =segue.destinationViewController;
        NSIndexPath *indexPath=[self.tableView indexPathForSelectedRow];
        // 我们需要知道哪个是现在正显示的列表视图，这样才能从相应的数组中提取正确的信息，显示在详细视图中。
        if(sender == self.searchDisplayController.searchResultsTableView)
        {
            
            controller.cname =[[filteredCandyArray objectAtIndex:indexPath.row] courseName];
            controller.tname=[[filteredCandyArray objectAtIndex:indexPath.row] teachers];
            controller.cimage=[[filteredCandyArray objectAtIndex:indexPath.row] tablepng];

            
        }
        else
        {
            
            controller.cname =[[courseArray objectAtIndex:indexPath.row] courseName];
            controller.tname=[[courseArray objectAtIndex:indexPath.row] teachers];
            controller.cimage=[[courseArray objectAtIndex:indexPath.row] tablepng];

            
        }
        

    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
