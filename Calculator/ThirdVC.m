//
//  ThirdVC.m
//  Calculator
//
//  Created by Nishant Tyagi on 11/8/13.
//  Copyright (c) 2013 Nishant Tyagi. All rights reserved.
//

#import "ThirdVC.h"

@interface ThirdVC ()

@end

@implementation ThirdVC

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

-(IBAction)switchToRootVC:(UIButton *)sender
{
    NSLog(@"viewcontrollers : %@",self.navigationController.viewControllers);
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
