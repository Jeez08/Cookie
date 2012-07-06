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
        [self loadRecipe];
    }
    return self;
}

-(void)loadRecipe {
    NSString *directoryPath = @"Cookie";
    
    [_recipeList removeAllObjects];
    NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:directoryPath error:nil];
    for (NSString *path in files) {
        if ([path hasSuffix:@".meal"]) {
            CIRecipe *r = [[NSKeyedUnarchiver unarchiveObjectWithFile:[directoryPath stringByAppendingPathComponent:path]] retain];
            [_recipeList addObject:r];
        }
    }
}

-(BOOL)saveRecipe:(CIRecipe *)recipe {
    NSString *directoryPath = @"Cookie";
    
    [recipe retain];
    NSLog(@"%@", [[directoryPath stringByAppendingPathComponent:[recipe Name]] stringByAppendingPathExtension:@"meal"]);
    
    NSString *outputName = [[recipe Name] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
    BOOL result = [NSKeyedArchiver archiveRootObject:recipe toFile:[[directoryPath stringByAppendingPathComponent:outputName] stringByAppendingPathExtension:@"meal"]];
    
    [recipe release];
    
    return result;
}

- (void) dealloc {
    _recipeList = nil;
    [super dealloc];
}

- (void) addRecipeWithName:(NSString *)name category:(NSString *)category summary:(NSString *)summary picture:(NSImage *)picture rating:(NSNumber *)rating ingredients:(NSMutableArray *)ingredients recipe:(NSTextField*)recipe {
    CIRecipe *r = [[CIRecipe recipeWithName:name category:category summary:summary picture:picture rating:rating ingredients:ingredients recipe:recipe] retain];
    
    if (![self saveRecipe:r]) {
        [r release];
        NSLog(@"%@", @"Save FAIL");
        return;
    }
    
    [r release];
    //[_recipeList addObject:r];
         
    [[NSNotificationCenter defaultCenter] postNotificationName:RECIPECHANGE object:self];
}

- (void) deleteRecipeAtIndex:(NSInteger)row {
    [_recipeList removeObjectAtIndex:row];
    [[NSNotificationCenter defaultCenter] postNotificationName:RECIPECHANGE object:self];
}

- (NSInteger) numberOfRowsInTableView:(NSTableView*) tableView {
    return [_recipeList count];
}

-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row {
    return [_recipeList objectAtIndex:row];
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
