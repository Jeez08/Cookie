//
//  CIAddSheetController.m
//  Cookie
//
//  Created by Simon Relet on 04/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIAddSheetController.h"

@implementation CIAddSheetController

@synthesize window;
@synthesize sheet;
@synthesize recipeList;
@synthesize name;
@synthesize summary;
@synthesize category;
@synthesize picture;
@synthesize ingredients;
@synthesize recipe;

-(IBAction)open:(id)sender {
    [NSApp beginSheet:sheet modalForWindow:window modalDelegate:self didEndSelector:NULL contextInfo:nil];
}

-(IBAction)close:(id)sender {
    [sheet orderOut:nil];
    [NSApp endSheet:sheet];
}

- (IBAction)addRecipe:(id)sender {
    CIRecipeDataSource *dataSource = recipeList.dataSource;
    
    [dataSource addRecipeWithName:name.stringValue category:category.stringValue summary:summary.stringValue picture:picture.image rating:[NSNumber numberWithInt:0] ingredients:ingredients recipe:recipe];
    
    [self close:sender];
}

@end
