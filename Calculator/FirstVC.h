//
//  FirstVC.h
//  Calculator
//
//  Created by Nishant Tyagi on 11/8/13.
//  Copyright (c) 2013 Nishant Tyagi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MyAnnotation.h"

@interface FirstVC : UIViewController <MKMapViewDelegate>
{

    
}
@property (nonatomic , strong) IBOutlet MKMapView *map;

-(IBAction)nextButtonClicked:(UIButton *)sender;

@end
