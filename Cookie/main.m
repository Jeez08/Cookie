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
    return NSApplicationMain(argc, (const char **)argv);
    
    /*NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:@"Cookie/Pictures"])
        if(![fileManager createDirectoryAtPath:@"Cookie/Pictures" withIntermediateDirectories:YES attributes:nil error:NULL])
            NSLog(@"Error: Create folder failed Cookie");
    
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"Cookie" error:nil];
    for (NSString *path in files) {
        if ([path hasSuffix:@".meal"])
            NSLog(@"%@", path);
    }*/
}
