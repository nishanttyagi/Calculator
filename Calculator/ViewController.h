//
//  ViewController.h
//  Calculator
//
//  Created by Nishant Tyagi on 10/26/13.
//  Copyright (c) 2013 Nishant Tyagi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate , UIPickerViewDelegate , UIPickerViewDataSource>
{
    IBOutlet UIToolbar *toolbar;
    
    IBOutlet UITextField *textFiled1;
    IBOutlet UITextField *textFiled2;
}
@property (strong , nonatomic) NSArray *pickerDatasource;


// UIDatePicker Instance
@property (nonatomic , strong) IBOutlet UIDatePicker *myDatePicker;

@property (strong , nonatomic) IBOutlet UILabel *result;
@property (strong , nonatomic) IBOutlet UIPickerView *myPicker;

// METHODS
- (IBAction)addButtonTouched:(UIButton *)sender;

-(IBAction)subButtonTouched:(UIButton *)sender;
- (IBAction)doneButtonTouched:(UIBarButtonItem *)sender;
- (IBAction)switchTowebVC:(UIButton *)sender;

@end
