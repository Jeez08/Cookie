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
@synthesize ingredientList = _ingredientList;
@synthesize window;
@synthesize currentImage = _currentImage;
@synthesize currentTitle = _currentTitle;
@synthesize currentType = _currentType;
@synthesize currentDescription = _currentDescription;
@synthesize currentIngredient = _currentIngredient;
@synthesize currentSteps = _currentSteps;
@synthesize search = _search;
@synthesize numberOfPeople = _numberOfPeople;
@synthesize preparation = _preparation;
@synthesize baking = _baking;
@synthesize rest = _rest;
@synthesize total = _total;
@synthesize rating = _rating;
@synthesize stepper = _stepper;
@synthesize filter = _filter;
@synthesize grade = _grade;

- (void) awakeFromNib {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshIngredientList:) name:INGRECHANGE object:nil];
}

-(IBAction)selectedRecipe:(id)sender {
    if (-1 == _tableView.selectedRow)
        return;
    
    CIRecipeDataSource *dataSource = (CIRecipeDataSource*)_tableView.dataSource;
    CIRecipe *recipe = [dataSource tableView:_tableView objectValueForTableColumn:_tableView.highlightedTableColumn row:_tableView.selectedRow];
    [_currentImage setImage:[recipe Picture]];
    [_currentTitle setStringValue:[recipe Name]];
    [_currentType setStringValue:[recipe Category]];
    [_currentDescription setStringValue:[recipe Summary]];
    [_currentSteps setStringValue:[recipe Recipe]];
    [_numberOfPeople setStringValue:[NSString stringWithFormat:@"%d", [recipe NumberOfPeople]]];
    [_stepper setIntegerValue:[_numberOfPeople integerValue]];
    [_preparation setStringValue:[NSString stringWithFormat:@"%d", [recipe Preparation]]];
    [_baking setStringValue:[NSString stringWithFormat:@"%d", [recipe Baking]]];
    [_rest setStringValue:[NSString stringWithFormat:@"%d", [recipe Rest]]];
    [_total setStringValue:[NSString stringWithFormat:@"%d", ([recipe Rest] + [recipe Baking] + [recipe Preparation])]];
    [_rating setFloatValue:[[recipe Rating] floatValue]];
    CIIngredientDataSource *ingredientDataSource = (CIIngredientDataSource*)[_ingredientList dataSource];
    [ingredientDataSource selectRecipe:recipe numberOfPeople:[_numberOfPeople intValue]];
}

-(IBAction)numberOfPeopleHasCahnged:(id)sender {
    [_stepper setIntegerValue:[sender integerValue]];
    [_numberOfPeople setIntegerValue:[sender integerValue]];
    CIIngredientDataSource *ingredientDataSource = (CIIngredientDataSource*)[_ingredientList dataSource];
    ingredientDataSource.numberOfPeople = [_numberOfPeople intValue];
    [_ingredientList reloadData];
}

- (IBAction)SortRecipeList:(id)sender {
    CIRecipeDataSource *recipeDataSource = (CIRecipeDataSource*)[_tableView dataSource];
    [recipeDataSource changeFilterType:[_filter labelForSegment:[_filter selectedSegment]]];
}

- (IBAction)sortByGrade:(id)sender {
    CIRecipeDataSource *recipeDataSource = (CIRecipeDataSource*)[_tableView dataSource];
    [recipeDataSource changeRatingFilter:[[_grade itemObjectValueAtIndex:[_grade indexOfSelectedItem]]intValue]];
}

-(IBAction)search:(id)sender {
    CIRecipeDataSource *recipeDataSource = (CIRecipeDataSource *)[_tableView dataSource];
    [recipeDataSource changeSearchFilter:[_search stringValue]];
}

-(void)refreshIngredientList:(NSNotification*)n {
    [_ingredientList reloadData];
}

@end
