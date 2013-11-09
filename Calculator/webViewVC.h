//
//  webViewVC.h
//  Calculator
//
//  Created by Nishant Tyagi on 10/29/13.
//  Copyright (c) 2013 Nishant Tyagi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewVC : UIViewController <UIWebViewDelegate>
{
    UIActivityIndicatorView *indicator;
}
@property (nonatomic , strong) IBOutlet UIWebView *mywebView;
- (IBAction)backButtonClicked:(UIButton *)sender;


@end
