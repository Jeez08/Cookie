//
//  CIAddWindowController.m
//  Cookie
//
//  Created by Simon Relet on 04/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIAddWindowController.h"

@implementation CIAddWindowController

@synthesize window;
@synthesize recipeList;
@synthesize name;
@synthesize summary;
@synthesize category;
@synthesize picture;
@synthesize ingredients;
@synthesize recipe;

- (IBAction)addRecipe:(id)sender {
    CIRecipeDataSource *dataSource = recipeList.dataSource;
    
    [dataSource addRecipeWithName:name.stringValue category:category.stringValue summary:summary.stringValue picture:picture.image rating:[NSNumber numberWithInt:0] ingredients:ingredients recipe:recipe];
    
    [self close];
}

@end
