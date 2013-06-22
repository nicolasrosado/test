//
//  AvailableServicesViewController.m
//  MobileAppGenerator
//
//  Created by PST on 05/06/13.
//  Copyright (c) 2013 PST. All rights reserved.
//

#import "AvailableServicesViewController.h"

@interface AvailableServicesViewController ()

@end

@implementation AvailableServicesViewController

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
	// Do any additional setup after loading the view.
    
    availableServices = [NSMutableArray array];
    [availableServices addObject:@"Geolocation"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
