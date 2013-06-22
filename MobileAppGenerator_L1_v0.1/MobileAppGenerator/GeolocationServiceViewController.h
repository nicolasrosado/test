//
//  GeolocalisationServiceViewController.h
//  MobileAppGenerator
//
//  Created by PST on 31/05/13.
//  Copyright (c) 2013 PST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Reachability.h"

/*!
    This class represents the controller of the GeolocationView.
 */
@interface GeolocationServiceViewController : UIViewController <MKMapViewDelegate>
{
    MKMapView *mapview;
}

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)zoomIn:(id)sender;

- (IBAction)changeMapType:(id)sender;

/*-(IBAction)setMap:(id)sender;

-(IBAction)getLocation;*/
    
@end
