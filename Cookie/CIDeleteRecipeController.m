//
//  CIDeleteRecipeController.m
//  Cookie
//
//  Created by Simon Relet on 08/07/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIDeleteRecipeController.h"

@implementation CIDeleteRecipeController

@synthesize window;
@synthesize sheet;
@synthesize recipeName;
@synthesize recipeList;

-(IBAction)open:(id)sender {
    if (-1 == recipeList.selectedRow)
        return;
    
    CIRecipeDataSource *dataSourceRecipe = (CIRecipeDataSource*)recipeList.dataSource;
    CIRecipe *selectedRecipe = [dataSourceRecipe tableView:recipeList objectValueForTableColumn:recipeList.highlightedTableColumn row:recipeList.selectedRow];
    
    self.recipeName.stringValue = [selectedRecipe Name];
    [NSApp beginSheet:sheet modalForWindow:window modalDelegate:self didEndSelector:NULL contextInfo:nil];
}

-(IBAction)close:(id)sender {
    [sheet orderOut:nil];
    [NSApp endSheet:sheet];
}

-(IBAction)deleteRecipe:(id)sender {
    CIRecipeDataSource *dataSourceRecipe = (CIRecipeDataSource*)recipeList.dataSource;
    CIRecipe *selectedRecipe = [dataSourceRecipe tableView:recipeList objectValueForTableColumn:recipeList.highlightedTableColumn row:recipeList.selectedRow];
    
    [dataSourceRecipe deleteRecipe:selectedRecipe];
    [self close:sender];
}

@end
