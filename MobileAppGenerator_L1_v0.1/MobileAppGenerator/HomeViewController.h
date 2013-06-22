//
//  FirstViewController.h
//  MobileAppGenerator
//
//  Created by PST on 30/05/13.
//  Copyright (c) 2013 PST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PListManager.h"


/*!
    This class represents the controller of the HomeView.
 */
@interface HomeViewController : UIViewController
{
    NSString *className;
}

@property (strong, nonatomic) IBOutlet UINavigationItem *title;
@property (strong, nonatomic) IBOutlet UIImageView *logo;
@property (strong, nonatomic) IBOutlet UITextView *description;

@end
