//
//  PListManager.m
//  MobileAppGenerator
//
//  Created by PST on 04/06/13.
//  Copyright (c) 2013 PST. All rights reserved.
//

#import "PListManager.h"

/*!
    This class represents the implementation of the class that permits to manage plist file.
 */
@implementation PListManager

/*!
    This function permit to instantiate an object PListManager.
    
    @param fileName
        Represents the name of the file.
 
    @param extension
        Represents the extension of the file.
 
    @result
        Returns the object instantiated.
 */
-(id)initWithFileName:(NSString *)fileName :(NSString *)extension
{    
    if (self = [super init])
    {
        NSError *error;
        // Create a list of paths
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        // Get a path to the documents directory from the list
        NSString *documentsDirectory = [paths objectAtIndex:0];
        // Create a full file path
        NSString *fullFileName = [NSString stringWithFormat:@"%@%@", fileName, extension];
        NSString *path = [documentsDirectory stringByAppendingPathComponent:fullFileName]; 
        
        NSLog(@"the full path of plist in documents directory : %@", path);
        
        originalPath = path;
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        // Check if file exists
        if (![fileManager fileExistsAtPath: path])
        {
            // Get a path to the plist created before in bundle directory (by Xcode)
            NSString *bundle = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"]; 
            
            // Copy this plist to the documents directory
            [fileManager copyItemAtPath:bundle toPath: path error:&error]; 
        }
        else
        {
            // if the file exists then we must deleted to the documents directory and copy again the plist file
            
            // Get a path to the plist created before in bundle directory (by Xcode)
            NSString *bundle = [[NSBundle mainBundle] pathForResource:fileName ofType:@"plist"];
            
            // Delete the plist in the documents directory if exists
            [fileManager removeItemAtPath:path error:NULL];
            
            // Copy the plist to the documents directory
            [fileManager copyItemAtPath:bundle toPath: path error:&error];
        }
    }
    
    return self;
}

/*!
     This function permit to read the content of a plist file.
     
     @result
     Returns the content of plist file.
 */
- (id)readPlist
{
    NSMutableDictionary *contentOfPlist = [[NSMutableDictionary alloc] initWithContentsOfFile: originalPath];
    
    return contentOfPlist;
}

@end
