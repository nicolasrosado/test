//
//  WebBrowserViewController.m
//  MobileAppGenerator
//
//  Created by PST on 06/06/13.
//  Copyright (c) 2013 PST. All rights reserved.
//

#import "WebBrowserViewController.h"

@interface WebBrowserViewController ()

@end

/*!
    This class represents the implementation of the controller of the WebBrowserView.
 */
@implementation WebBrowserViewController

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
    
    // init and create the UIWebView
    webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    
    // create a URL object & set the URL to go to for the UIWebView
    NSURLRequest *requestObject = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.fr"]];
    
    // load the URL into the web view
    [webView loadRequest:requestObject];
    
    // add the web view to the content view
    [self.view addSubview:webView];
    
    [webView setAutoresizingMask:self.view.autoresizingMask];
}

/*!
    This function is called when the system is low in memory.
 */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*!
    This function checks if we have an internet connection or not
 */
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
