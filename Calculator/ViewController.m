//
//  ViewController.m
//  Calculator
//
//  Created by Nishant Tyagi on 10/26/13.
//  Copyright (c) 2013 Nishant Tyagi. All rights reserved.
//

#import "ViewController.h"
#import "webViewVC.h"
#import "MyTableVC.h"
#import "scrollVC.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // ARC : Automatic Retain Release
    // MRR : Manual Retain Release
    
    NSLog(@"current date : %@",[NSDate date]);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:[NSDate date]];
    NSLog(@"strDate : %@",strDate);
    strDate = @"20-10-2012";
    NSDate *_date = [dateFormatter dateFromString:strDate];
    [self.myDatePicker setDate:_date];
    [self.myDatePicker setMinimumDate:_date];

    
    
    return;
    
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4", nil]; // 
   // NSLog(@"array : %@",array1);

    self.pickerDatasource = array1;
    
    
    NSArray *array2 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil]; // Autoreleasing
    //NSLog(@"array : %@",array2);

    
    NSArray *array3 = @[@"1",@"2",@"3"];
    NSLog(@"array : %@",[array3 objectAtIndex:1]);
    
    
    NSMutableArray *mutableArray1 = [[NSMutableArray alloc] initWithArray:array1];
    NSMutableArray *mutableArray2 = [NSMutableArray arrayWithArray:array2];
    NSMutableArray *mutableArray3 = [NSMutableArray new];
    [mutableArray1 addObject:@"1"];
    [mutableArray1 addObject:@"2"];
    [mutableArray1 addObject:@"3"];
    NSLog(@"mutableArray1 : %@",[mutableArray1 objectAtIndex:2]);

   // [self.result setText:@"OUTPUT"];
    
   // NSDictionary *dictionary =  [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"john",@"12" , nil] forKeys:[NSArray arrayWithObjects:@"name",@"age", nil]];
    //NSLog(@"dict : %@",dictionary);
    
    NSDictionary *dictionary = @{@"name" : @"john"};
    
    NSLog(@"dict : %@",dictionary);

    
    NSMutableDictionary *mutableDict = [NSMutableDictionary new];
    [mutableDict setObject:@"John" forKey:@"name"];
    [mutableDict setObject:@"12" forKey:@"age"];    
    NSLog(@"dict : %@",dictionary);
    
    [toolbar setHidden:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonTouched:(UIButton *)sender {
    NSLog(@"Add button touched");
    
    int output = [textFiled1.text intValue] + [textFiled2.text intValue];
    
 
    self.result.text = [NSString stringWithFormat:@"%d",output];
}

-(IBAction)subButtonTouched:(UIButton *)sender
{
    int output = [textFiled1.text intValue] - [textFiled2.text intValue];
    
    
    self.result.text = [NSString stringWithFormat:@"%d",output];

}

- (IBAction)doneButtonTouched:(UIBarButtonItem *)sender {
    
    [textFiled1 resignFirstResponder];
    [textFiled2 resignFirstResponder];
    [toolbar setHidden:YES];

}

- (IBAction)switchTowebVC:(UIButton *)sender {
    
    
  /*  webViewVC *tempVC  = [[webViewVC alloc] initWithNibName:@"webViewVC" bundle:nil];
    [self presentViewController:tempVC animated:YES completion:nil];
   */
    
    /*
    MyTableVC *tempVC = [[MyTableVC alloc] init];
    [self presentViewController:tempVC animated:YES completion:nil];
     */
    
    scrollVC *tempVc = [[scrollVC alloc] init];
    [self presentViewController:tempVc animated:YES completion:nil];
}


#pragma mark -
#pragma mark UITextField Delagate Methods -

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [toolbar setHidden:NO];
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}


#pragma mark -
#pragma mark UIPickerViewDelagates + Datasources
// Datasource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// Datasource
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.pickerDatasource count];
}

// Datasource
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == 0) {
        return [self.pickerDatasource objectAtIndex:row];
    }
    else if (component == 1)
    {
        return [self.pickerDatasource objectAtIndex:row];
    }
    
    return nil;
}

// Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        
    }
    else{
        
    }
    NSLog(@"row selected is : %@",[self.pickerDatasource objectAtIndex:row]);
}


@end
