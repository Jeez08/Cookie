//
//  CIRecipeDataSource.h
//  Cookie
//
//  Created by Matthieu Cote on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CIRecipe.h"
#import "CIRecipeCell.h"
#import "defineChange.h"

@interface CIRecipeDataSource : NSObject<NSTableViewDataSource, NSTableViewDelegate>

@property (nonatomic, retain) NSMutableArray *recipeList;
@property (nonatomic, copy) NSString *filterType;
@property (nonatomic, copy) NSString *searchFilter;
@property (nonatomic) int ratingFilter;

- (void) addRecipeWithName:(NSString*)name category:(NSString*)category summary:(NSString*)summary picture:(NSImage*)picture rating:(NSNumber*)rating ingredients:(NSMutableArray*)ingredients recipe:(NSString*)recipe preparation:(int)preparation baking:(int)baking rest:(int)rest numberOfPeople:(int)numberOfPeople;
- (void) updateRecipe:(CIRecipe*)oldRecipe name:(NSString*)name category:(NSString*)category summary:(NSString*)summary picture:(NSImage*)picture rating:(NSNumber*)rating ingredients:(NSMutableArray*)ingredients recipe:(NSString*)recipe preparation:(int)preparation baking:(int)baking rest:(int)rest numberOfPeople:(int)numberOfPeople;
-(void)deleteRecipe:(CIRecipe*)recipe;
-(void)loadRecipe;
-(void)changeFilterType:(NSString*)filterType;
-(void)changeSearchFilter:(NSString*)seachFilter;
-(void)changeRatingFilter:(int)ratingFilter;
-(BOOL)saveRecipeInDB:(CIRecipe*)recipe;
-(BOOL)deleteRecipeFromDB:(CIRecipe*)recipe;
-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;

-(void)dealloc;

@end
