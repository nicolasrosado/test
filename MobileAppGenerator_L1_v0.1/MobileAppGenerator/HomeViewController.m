//
//  FirstViewController.m
//  MobileAppGenerator
//
//  Created by PST on 30/05/13.
//  Copyright (c) 2013 PST. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

/*!
    This class represents the implementation of the controller of the HomeView
 */
@implementation HomeViewController

@synthesize description;
@synthesize title;
@synthesize logo;

extern NSDictionary *contentOfPlist;
extern NSArray *keys;
extern NSMutableDictionary *componentsClass;

/*!
    This function is called when the view loading is finished.
 */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    //self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    //self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    //self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
     className = [[HomeViewController class] description];
    
     NSLog(@"the name of the class : %@", className);
    
     NSArray *elements = [componentsClass objectForKey:className];
    
     NSEnumerator *enumerKey = [keys objectEnumerator];
     NSObject *obj;
     NSString *elementKey;
    
     while ((obj = [enumerKey nextObject]) != nil)
     {
        elementKey = [obj description];

        if ([elements containsObject:elementKey])
        {
            NSString *activationKey = [NSString stringWithFormat:@"activation_%@", elementKey];
            NSString *defaultElementKey = [NSString stringWithFormat:@"default_%@", elementKey];
            
            BOOL activationElement = [[contentOfPlist objectForKey:activationKey] boolValue];
            NSString *element = [contentOfPlist objectForKey:elementKey];
            NSString *defaultElement = [contentOfPlist objectForKey:defaultElementKey];
            
            if ([elementKey isEqualToString:@"firm_description"])
            {
                if (activationElement == YES)
                {
                    description.text = element;
                }
                else
                {
                    description.text = defaultElement;
                }
            }
            else if ([elementKey isEqualToString:@"application_title"])
            {
                if (activationElement == YES)
                {
                    [title setValue:element forKey:@"title"];
                }
                else
                {
                    [title setValue:defaultElement forKey:@"title"];
                }
            }
            else if ([elementKey isEqualToString:@"firm_logo"])
            {
                if (activationElement == YES)
                {
                    UIImage * img = [UIImage imageNamed:element];
                    
                    if (img != nil)
                    {
                        [logo setImage:img];
                    }
                    else
                    {
                        NSString *defaultImage = @"default_image";
                        NSString *defaultImageElement = [contentOfPlist objectForKey:defaultImage];
                        UIImage * img = [UIImage imageNamed:defaultImageElement];
                        
                        [logo setImage:img];
                    }
                }
                else
                {
                    UIImage * img = [UIImage imageNamed:defaultElement];
                    
                    if (img != nil)
                    {
                        [logo setImage:img];
                    }
                    else
                    {
                        NSString *defaultImage = @"default_image";
                        NSString *defaultImageElement = [contentOfPlist objectForKey:defaultImage];
                        UIImage * img = [UIImage imageNamed:defaultImageElement];
                        
                        [logo setImage:img];
                    }
                }
            }
        }
    }
}

/*!
    This function is called when the system is low in memory.
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
