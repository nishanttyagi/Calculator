//
//  AppDelegate.m
//  Calculator
//
//  Created by Nishant Tyagi on 10/26/13.
//  Copyright (c) 2013 Nishant Tyagi. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstVC.h"
#import "SecondVC.h"
#import "ThirdVC.h"

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    FirstVC *tempVC = [[FirstVC alloc] init];
    self.navController = [[UINavigationController alloc] initWithRootViewController:tempVC];

    self.myString = @"MY STRING IN APP DELEGATE";
    
    FirstVC *firstVC = [[FirstVC alloc] init];
    SecondVC *secVC = [[SecondVC alloc] init];
    ThirdVC *thirdVC = [[ThirdVC alloc] init];
    
    NSArray *controllersArray = @[self.navController,secVC,thirdVC];
    
    self.tabbarControl = [[UITabBarController alloc] init];
    self.tabbarControl.viewControllers = controllersArray;
    
    
    [[[[self.tabbarControl tabBar] items] objectAtIndex:0] setTitle:@"First"];
    [[[[self.tabbarControl tabBar] items] objectAtIndex:1] setTitle:@"Second"];
    [[[[self.tabbarControl tabBar] items] objectAtIndex:2] setTitle:@"Third"];
    
    
    [self initializeLocationManager];

    
    
    
    [[self.tabbarControl tabBar] setBackgroundColor:[UIColor greenColor]];
    
    self.window.rootViewController = self.tabbarControl;
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - 
#pragma UITabbarController Delegates -

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
    
}





- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)initializeLocationManager
{
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [locationManager setDistanceFilter:1000];
    [locationManager startUpdatingLocation];
}

#pragma mark - 
#pragma mark LOCATION MANAGER DELEGATES -

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    locationCordinate = newLocation.coordinate;
    
    core_latitude = newLocation.coordinate.latitude;
    core_longitude = newLocation.coordinate.longitude;
    
    [locationManager stopUpdatingLocation];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if ([error code] == 1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry !" message:@"Location Disabled" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];

        [alert show];
    }
}

@end
