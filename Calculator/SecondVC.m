//
//  SecondVC.m
//  Calculator
//
//  Created by Nishant Tyagi on 11/8/13.
//  Copyright (c) 2013 Nishant Tyagi. All rights reserved.
//

#import "SecondVC.h"
#import "ThirdVC.h"
#import "AppDelegate.h"


@interface SecondVC ()

@end

@implementation SecondVC

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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSLog(@"Second viewWillAppear");
    
    AppDelegate *delegateInstance = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSLog(@"%@",delegateInstance.myString);

    delegateInstance.myString = @"MY STRING IN SECOND VC";

    
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    NSLog(@"Second viewDidAppear");

}

-(void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:YES];
    NSLog(@"Second viewWillDisappear");

}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    NSLog(@"Second viewDidDisappear");

}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    NSLog(@"Second viewWillLayoutSubviews");

}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"Second viewDidLayoutSubviews");

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)nextButtonClicked:(UIButton *)sender
{
    ThirdVC *tempVC = [[ThirdVC alloc] init];
    [self.navigationController pushViewController:tempVC animated:YES];
    
}



@end
