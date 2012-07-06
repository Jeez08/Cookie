//
//  CIWindowController.m
//  Cookie
//
//  Created by  on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIWindowController.h"

@implementation CIWindowController

@synthesize tableView = _tableView;
@synthesize window;
@synthesize currentImage = _currentImage;
@synthesize currentTitle = _currentTitle;
@synthesize currentType = _currentType;
@synthesize currentDescription = _currentDescription;
@synthesize currentIngredient = _currentIngredient;
@synthesize currentSteps = _currentSteps;

-(IBAction)selectedRecipe:(id)sender {
    CIRecipeDataSource *dataSource = [_tableView dataSource];
    CIRecipe *recipe = [dataSource tableView:_tableView objectValueForTableColumn:_tableView.highlightedTableColumn row:_tableView.selectedRow];
    [_currentImage setImage:[recipe Picture]];
    [_currentTitle setStringValue:[recipe Name]];
    [_currentType setStringValue:[recipe Category]];
    [_currentDescription setStringValue:[recipe Summary]];
    [_currentSteps setStringValue:[[recipe Recipe] stringValue]];
}

@end
