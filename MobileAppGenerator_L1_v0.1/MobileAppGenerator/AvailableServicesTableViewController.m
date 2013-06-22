//
//  AvailableServicesTableViewController.m
//  MobileAppGenerator
//
//  Created by PST on 05/06/13.
//  Copyright (c) 2013 PST. All rights reserved.
//

#define MAINLABEL_TAG 1
#define SECONDLABEL_TAG 2
#define PHOTO_TAG 3

#import "AvailableServicesTableViewController.h"

@interface AvailableServicesTableViewController ()

@end

/*!
    This class represents the implementation of the controller of the AvailableServicesTableView.
 */
@implementation AvailableServicesTableViewController

extern NSDictionary *contentOfPlist;
extern NSArray *keys;
extern NSMutableDictionary *componentsClass;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    className = [[AvailableServicesTableViewController class] description];
    
    NSLog(@"the name of the class : %@", className);
    
    availableServicesMainTitle = [NSMutableArray array];
    availableServicesSecondaryTitle = [NSMutableArray array];
    availableServicesImages = [NSMutableArray array];
    
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
            NSString *secondLabelElementKey = [NSString stringWithFormat:@"second_label_%@", elementKey];
            NSString *imageElementKey = [NSString stringWithFormat:@"image_%@", elementKey];
            
            BOOL activationElement = [[contentOfPlist objectForKey:activationKey] boolValue];
            NSString *element = [contentOfPlist objectForKey:elementKey];
            NSString *secondLabelElement = [contentOfPlist objectForKey:secondLabelElementKey];
            NSString *imageElement = [contentOfPlist objectForKey:imageElementKey];
            
            if (activationElement == YES)
            {
                [availableServicesMainTitle addObject:element];
                [availableServicesSecondaryTitle addObject:secondLabelElement];
                [availableServicesImages addObject:imageElement];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return [availableServicesMainTitle count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MyIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    UILabel *mainLabel, *secondLabel;
    
    UIImageView *photo;
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

        // mainLabel configuration
        mainLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 220.0, 22.0)];
        mainLabel.tag = MAINLABEL_TAG;
        mainLabel.font = [UIFont boldSystemFontOfSize:14.0];
        mainLabel.textAlignment = NSTextAlignmentCenter;
        mainLabel.textColor = [UIColor blackColor];
        mainLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        // add the mainLabel to the cell
        [cell.contentView addSubview:mainLabel];
        
        // secondLabel configuration
        secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 20.0, 220.0, 20.0)];
        secondLabel.tag = SECONDLABEL_TAG;
        secondLabel.font = [UIFont systemFontOfSize:12.0];
        secondLabel.textAlignment = NSTextAlignmentCenter;
        secondLabel.textColor = [UIColor darkGrayColor];
        secondLabel.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        // add the seconLabel to the cell
        [cell.contentView addSubview:secondLabel];
        
        // photo configuration
        photo = [[UIImageView alloc] initWithFrame:CGRectMake(225.0, 0.0, 80.0, 45.0)];
        photo.tag = PHOTO_TAG;
        photo.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleHeight;
        // add the photo to the cell
        [cell.contentView addSubview:photo];
        
    }
    else
    {
        mainLabel = (UILabel *)[cell.contentView viewWithTag:MAINLABEL_TAG];
        secondLabel = (UILabel *)[cell.contentView viewWithTag:SECONDLABEL_TAG];
        photo = (UIImageView *)[cell.contentView viewWithTag:PHOTO_TAG];
    }
    
    // Configure the cell...
    NSString *cellValueMainTitle = [availableServicesMainTitle objectAtIndex:indexPath.row];
    NSString *cellValueSecondTitle = [availableServicesSecondaryTitle objectAtIndex:indexPath.row];
    
    mainLabel.text = cellValueMainTitle;
    secondLabel.text = cellValueSecondTitle;
    
    NSString *cellValueImage = [availableServicesImages objectAtIndex:indexPath.row];
    UIImage * img = [UIImage imageNamed:cellValueImage];
    
    if (img != nil)
    {
        photo.image = img;
    }
    else
    {
        NSString *defaultImage = @"default_image";
        NSString *defaultImageElement = [contentOfPlist objectForKey:defaultImage];
        UIImage * img = [UIImage imageNamed:defaultImageElement];
        
        photo.image = img;
    }

    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UILabel *mainLabel = (UILabel *)[cell.contentView viewWithTag:MAINLABEL_TAG];
    UILabel *secondLabel = (UILabel *)[cell.contentView viewWithTag:SECONDLABEL_TAG];
    UIImageView *photo = (UIImageView *)[cell.contentView viewWithTag:PHOTO_TAG];
    
    NSLog(@"Content of cell : %@", mainLabel.text);
    NSLog(@"Content of cell : %@", secondLabel.text);
    
    if ([mainLabel.text isEqualToString:[contentOfPlist objectForKey:@"geolocation"]])
    {
        GeolocationServiceViewController *geolocationServiceViewController = [[GeolocationServiceViewController alloc] initWithNibName:nil bundle:nil];
    
        [self.navigationController pushViewController:geolocationServiceViewController animated:YES];
    }
    else if ([mainLabel.text isEqualToString:[contentOfPlist objectForKey:@"test"]])
    {
        WebBrowserViewController *webBrowserViewController = [[WebBrowserViewController alloc] initWithNibName:nil bundle:nil];
        
        [self.navigationController pushViewController:webBrowserViewController animated:YES];
    }
}

@end
