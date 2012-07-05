//
//  CIRecipeDataSource.m
//  Cookie
//
//  Created by Matthieu Cote on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIRecipeDataSource.h"

@implementation CIRecipeDataSource

@synthesize recipeList = _recipeList;

- (id) init {
    self = [super init];
    if (self) {
        self.recipeList = [NSMutableArray array];
    }
    return self;
}

- (void) dealloc {
    _recipeList = nil;
    [super dealloc];
}

- (void) addRecipeWithName:(NSString *)name category:(NSString *)category summary:(NSString *)summary picture:(NSImage *)picture rating:(NSNumber *)rating ingredients:(NSMutableArray *)ingredients recipe:(NSTextField*)recipe {
    CIRecipe *r = [[CIRecipe recipeWithName:name category:category summary:summary picture:picture rating:rating ingredients:ingredients recipe:recipe] retain];
    [_recipeList addObject:r];
    [[NSNotificationCenter defaultCenter] postNotificationName:RECIPECHANGE object:self];
}

- (void) deleteRecipeAtIndex:(NSInteger)row {
    [_recipeList removeObjectAtIndex:row];
    [[NSNotificationCenter defaultCenter] postNotificationName:RECIPECHANGE object:self];
}

- (NSInteger) numberOfRowsInTableView:(NSTableView*) tableView {
    return [_recipeList count];
}


- (NSTableCellView*) tableView:(NSTableView*)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    CIRecipe *r = [_recipeList objectAtIndex:row];
    CIRecipeCell *rc = [tableView makeViewWithIdentifier:tableColumn.identifier owner:nil];
    
    [rc.Rating setFloatValue:r.Rating.floatValue];
    rc.textField.stringValue = r.Name;
    rc.imageView.image = r.Picture;
    
    return rc;
}

@end
