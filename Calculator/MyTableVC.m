//
//  MyTableVC.m
//  Calculator
//
//  Created by Nishant Tyagi on 10/30/13.
//  Copyright (c) 2013 Nishant Tyagi. All rights reserved.
//

#import "MyTableVC.h"
#import "webViewVC.h"

@interface MyTableVC ()

@end

@implementation MyTableVC

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
    self.tableDatasource = @[@"john",@"Mike",@"Peter",@"Steve"];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonClicked:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark UItableView Delagates & Datasources

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
    
}
// Default is 1 if not implemented


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.tableDatasource count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    [headerView setBackgroundColor:[UIColor grayColor]];
    
    UILabel *title  = [[UILabel alloc] initWithFrame:CGRectMake(20, 10, 200, 20)];
    title.text = @"THIS IS HEADER OF TABLE";
    [title setBackgroundColor:[UIColor clearColor]];
    [title setTextColor:[UIColor redColor]];
    [title setFont:[UIFont fontWithName:@"Arial" size:12]];
    [headerView addSubview:title];
    
    return nil;
    
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    NSArray *ar = @[@"title 1",@"title 2",@"title 3"];
    return ar;
}


// return list of section titles to display in section index view (e.g. "ABCD...Z#")
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        
        
        UISwitch *switch1 = [[UISwitch alloc] initWithFrame:CGRectMake(200,10, 40, 22)];
        [switch1 addTarget:self action:@selector(switchCalled:) forControlEvents:UIControlEventValueChanged];
        [cell addSubview:switch1];
        
    }
    NSLog(@"indexpath : %@",indexPath);
    cell.textLabel.text = [self.tableDatasource objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    webViewVC *tempVC = [[webViewVC alloc] init];
    [self presentViewController:tempVC animated:YES completion:nil];
}

-(void)switchCalled:(UISwitch *)sender
{
    if (sender.isOn) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"Switch is on" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello" message:@"Switch is OFF" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
}

#pragma mark -
#pragma mark UISearchBar Delagates 

-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    
    return YES;
}

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    searchBar.text = @"";
    
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
}
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSLog(@"search text : %@",searchText);
    
}

@end
