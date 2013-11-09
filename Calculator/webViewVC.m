//
//  webViewVC.m
//  Calculator
//
//  Created by Nishant Tyagi on 10/29/13.
//  Copyright (c) 2013 Nishant Tyagi. All rights reserved.
//

#import "webViewVC.h"

@interface webViewVC ()

@end

@implementation webViewVC

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
 
    indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.center = self.mywebView.center;
    [indicator setHidesWhenStopped:YES];
    [self.mywebView addSubview:indicator];
    
    NSString *urlString = @"https://www.google.co.in/";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.mywebView loadRequest:request];
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
#pragma mark UIWebViewDelegates -

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    [indicator startAnimating];

    
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [indicator stopAnimating];
}

@end
