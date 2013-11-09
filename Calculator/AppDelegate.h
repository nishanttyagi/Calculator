//
//  AppDelegate.h
//  Calculator
//
//  Created by Nishant Tyagi on 10/26/13.
//  Copyright (c) 2013 Nishant Tyagi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic , strong) NSString *myString;
@property (nonatomic , strong) UINavigationController *navController;


@property (nonatomic , strong) UITabBarController *tabbarControl;
@property (strong, nonatomic) ViewController *viewController;


-(void)initializeLocationManager;


@end
