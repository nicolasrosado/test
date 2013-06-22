//
//  PListManager.h
//  MobileAppGenerator
//
//  Created by PST on 04/06/13.
//  Copyright (c) 2013 PST. All rights reserved.
//

#import <Foundation/Foundation.h>

/*!
    This class permit to manage plist file.
 */
@interface PListManager : NSObject
{ 
    NSString *originalPath;
}

-(id)initWithFileName:(NSString *)fileName :(NSString *)extension;

-(id)readPlist;

@end
