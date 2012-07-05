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

- (void) addRecipeWithName:(NSString*)name category:(NSString*)category summary:(NSString*)summary picture:(NSImage*)picture rating:(NSNumber*)rating ingredients:(NSTableView*)ingredients recipe:(NSTextField*)recipe;
- (void) deleteRecipeAtIndex:(NSInteger)row;

- (void) dealloc;

@end
