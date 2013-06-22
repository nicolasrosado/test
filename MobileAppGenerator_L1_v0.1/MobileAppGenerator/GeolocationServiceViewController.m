//
//  GeolocalisationServiceViewController.m
//  MobileAppGenerator
//
//  Created by PST on 31/05/13.
//  Copyright (c) 2013 PST. All rights reserved.
//

#import "GeolocationServiceViewController.h"

@interface GeolocationServiceViewController ()

@end

/*!
    This class represents the implementation of the controller of the GeolocationView.
 */
@implementation GeolocationServiceViewController

//@synthesize mapview;

/*-(IBAction)getLocation{
    mapview.showsUserLocation = YES;
}

-(IBAction)setMap:(id)sender{
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            mapview.mapType = MKMapTypeStandard;
            break;
        case 1:
            mapview.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mapview.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
}*/

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

/*!
    This function is called when the view loading is finished.
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self testInternetConnection];
    
    // init the map
    mapview = [[MKMapView alloc] initWithFrame:self.view.bounds];
    
    // define zoom
    MKCoordinateSpan span;
    span.latitudeDelta = 0.5;
    span.longitudeDelta = 0.5;
    
    // define coordinates of Paris
    CLLocationCoordinate2D parisCoordinates;
    parisCoordinates.latitude = 48.858391;
    parisCoordinates.longitude = 2.35279;
    
    MKCoordinateRegion parisRegion;
    parisRegion.span = span;
    parisRegion.center = parisCoordinates;
    
    // center the map on Paris
    [mapview setRegion:parisRegion animated:TRUE];
    
    // add the map to the view 
    [self.view insertSubview:mapview atIndex:0];
    
    [mapview setAutoresizingMask:self.view.autoresizingMask];
}

/*!
    This function is called when the system is low in memory.
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)zoomIn:(id)sender {
}

- (IBAction)changeMapType:(id)sender {
}

// Checks if we have an internet connection or not
-(void)testInternetConnection
{
    Reachability * reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    // Internet is reachable
    reach.reachableBlock = ^(Reachability *reachability)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Block Says Reachable");
        });
    };
    
    // Internet is not reachable
    reach.unreachableBlock = ^(Reachability *reachability)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Block Says Unreachable");
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Can't connect. Please check your internet Connection" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
        });
    };
    
    [reach startNotifier];
}

@end
