//
//  AvailableServicesTableViewController.h
//  MobileAppGenerator
//
//  Created by PST on 05/06/13.
//  Copyright (c) 2013 PST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GeolocationServiceViewController.h"
#import "WebBrowserViewController.h"

/*!
    This class represents the controller of the AvailableServicesTableView.
 */
@interface AvailableServicesTableViewController : UITableViewController
{
    NSString *className;
    NSMutableArray *availableServicesMainTitle;
    NSMutableArray *availableServicesSecondaryTitle;
    NSMutableArray *availableServicesImages;
}

@end
