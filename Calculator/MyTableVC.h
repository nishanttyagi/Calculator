//
//  MyTableVC.h
//  Calculator
//
//  Created by Nishant Tyagi on 10/30/13.
//  Copyright (c) 2013 Nishant Tyagi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableVC : UIViewController <UITableViewDataSource ,  UITableViewDelegate, UISearchBarDelegate>
{
    
}
@property (nonatomic , strong) NSArray *tableDatasource;
@property (nonatomic , strong) IBOutlet UISearchBar *search;
@property (nonatomic , strong) IBOutlet UITableView *myTable;
- (IBAction)backButtonClicked:(UIButton *)sender;

@end
