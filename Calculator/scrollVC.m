//
//  scrollVC.m
//  Calculator
//
//  Created by Nishant Tyagi on 10/30/13.
//  Copyright (c) 2013 Nishant Tyagi. All rights reserved.
//

#import "scrollVC.h"

@interface scrollVC ()

@end

@implementation scrollVC

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

    
    UIButton *btn = (UIButton *)[self.scrollview viewWithTag:1];
    [btn setBackgroundColor:[UIColor redColor]];
    
    [self.scrollview setContentSize:CGSizeMake(500, 800)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
