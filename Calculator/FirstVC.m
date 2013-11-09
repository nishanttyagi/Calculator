//
//  FirstVC.m
//  Calculator
//
//  Created by Nishant Tyagi on 11/8/13.
//  Copyright (c) 2013 Nishant Tyagi. All rights reserved.
//

#import "FirstVC.h"
#import "SecondVC.h"
#import "AppDelegate.h"

@interface FirstVC ()

@end

@implementation FirstVC

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
    
    AppDelegate *delegateInstance = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSLog(@"%@",delegateInstance.myString);
    
}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    [self loadingMap];
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    [super viewWillDisappear:YES];
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)nextButtonClicked:(UIButton *)sender
{
    SecondVC *tempVC = [[SecondVC alloc] init];
    [self.navigationController pushViewController:tempVC animated:YES];
    
}


-(void)loadingMap
{
    
    MKCoordinateSpan span = MKCoordinateSpanMake(10.0f, 10.0f);
    
    
    MKCoordinateRegion region = MKCoordinateRegionMake(locationCordinate, span);
    region.center.latitude = 37.0f;
    region.center.longitude = -122.0f;
    
    [self.map setRegion:region];

    
    MyAnnotation *ann = [[MyAnnotation alloc] initWithName:@"My Location" address:@"Chandigarh , India" coordinate:locationCordinate];
    
    [self.map addAnnotation:ann];
    
    
    CLLocationCoordinate2D cordinate = CLLocationCoordinate2DMake(36.0f, -121.0f);
    ann = [[MyAnnotation alloc] initWithName:@"Other Location" address:@"Delhi , India" coordinate:cordinate];
    
    [self.map addAnnotation:ann];

    
    NSLog(@"annotations : %@",self.map.annotations);
    
}

#pragma mark -
#pragma mark MKMapView Delegates & Datasources -
-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    MKPinAnnotationView *pinView = nil;
    
    static NSString *cellIdentifier = @"pinIdentifier";
    

    pinView = (MKPinAnnotationView *)[self.map dequeueReusableAnnotationViewWithIdentifier:cellIdentifier];
    
    if (pinView == nil) {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:cellIdentifier];
        
        pinView.canShowCallout = YES;
        pinView.opaque = NO;
        pinView.enabled = YES;
        pinView.canShowCallout = YES;
        pinView.rightCalloutAccessoryView=nil;
        pinView.animatesDrop = YES;
        pinView.pinColor = MKPinAnnotationColorGreen;
        pinView.tag = 111;
        
    }
    
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(-10, 2, 14, 21)];
    [rightBtn setImage:[UIImage imageNamed:@"rightOrangeArrow"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    pinView.rightCalloutAccessoryView = rightBtn;
    
    return pinView;

}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    
    NSLog(@"didSelectAnnotationView INIT");
    
    MyAnnotation *ann = (MyAnnotation*) view.annotation;
    
    NSLog(@"ann : %@ ::: %@",ann.title, ann.address);
    
    
    NSLog(@"didSelectAnnotationView LATE");
    
}
-(void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    NSLog(@"controle tapped : %@",control);
    for (id currentAnnotation in self.map.annotations) {
        if ([currentAnnotation isKindOfClass:[MyAnnotation class]]) {
            [self.map deselectAnnotation:currentAnnotation animated:YES];
        }
    }
}


-(IBAction)rightBtnClicked:(UIButton *)sender
{
    SecondVC *tempVC = [[SecondVC alloc] init];
    [self.navigationController pushViewController:tempVC animated:YES];
}

@end
