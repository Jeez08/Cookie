//
//  main.m
//  Cookie
//
//  Created by Matthieu Cote on 7/3/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CIIngredient.h"

int main(int argc, char *argv[])
{
    NSString *directoryPath = [[NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"Cookie"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:directoryPath])
        if(![fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:NULL])
            NSLog(@"Error: Create folder failed Cookie");
    
    return NSApplicationMain(argc, (const char **)argv);
}
