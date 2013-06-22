//
//  main.m
//  MobileAppGenerator
//
//  Created by PST on 30/05/13.
//  Copyright (c) 2013 PST. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "PListManager.h"

NSDictionary *contentOfPlist;
NSArray *keys;
NSMutableDictionary *componentsClass;

/*!
    This is the entrie of the application
 */
int main(int argc, char *argv[])
{
    // ----- Begin of Plist configuration ----- 
    NSString *fileName = @"data";
    NSString *extension = @".plist";
    
    PListManager *pListManager = [PListManager alloc];
    pListManager = [pListManager initWithFileName: fileName:extension];
    
    contentOfPlist = [NSDictionary dictionaryWithDictionary:[pListManager readPlist]];
    
    keys = [NSArray arrayWithArray:[contentOfPlist allKeys]];
    // ----- End of Plist configuration ----- 

    componentsClass = [NSMutableDictionary dictionary];
    
    // components of class HomeViewController
    NSArray *elementsHomeViewControllerClass = [NSArray arrayWithObjects: @"firm_description", @"application_title", @"firm_logo", nil];
    [componentsClass setObject:elementsHomeViewControllerClass forKey:@"HomeViewController"];
    
    // services of class AvailableServicesTableViewController
    NSArray *elementsAvailableServicesTableViewControllerClass = [NSArray arrayWithObjects: @"geolocation", @"test", nil];
    [componentsClass setObject:elementsAvailableServicesTableViewControllerClass forKey:@"AvailableServicesTableViewController"];
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
