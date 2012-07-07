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
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager fileExistsAtPath:@"Cookie"])
        if(![fileManager createDirectoryAtPath:@"Cookie" withIntermediateDirectories:YES attributes:nil error:NULL])
            NSLog(@"Error: Create folder failed Cookie");
    
    return NSApplicationMain(argc, (const char **)argv);
    
    /*
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:@"Cookie" error:nil];
    for (NSString *path in files) {
        if ([path hasSuffix:@".meal"])
            NSLog(@"%@", path);
    }*/
}
