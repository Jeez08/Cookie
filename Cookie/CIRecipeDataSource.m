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

-(BOOL)saveRecipeInDB:(CIRecipe *)recipe {
    NSString *directoryPath = @"Cookie";
    
    [recipe retain];
    NSString *outputName = [[recipe Name] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
    BOOL result = [NSKeyedArchiver archiveRootObject:recipe toFile:[[directoryPath stringByAppendingPathComponent:outputName] stringByAppendingPathExtension:@"meal"]];
    [recipe release];
    
    return result;
}

-(BOOL)deleteRecipeFromDB:(CIRecipe *)recipe {
    NSString *directoryPath = @"Cookie";
    
    [recipe retain];
    NSString *outputName = [[recipe Name] stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    
    BOOL result = [[NSFileManager defaultManager] removeItemAtPath:[[directoryPath stringByAppendingPathComponent:outputName] stringByAppendingPathExtension:@"meal"] error:nil];
    
    [recipe release];
    
    return result;
}

- (void) dealloc {
    _recipeList = nil;
    [super dealloc];
}

- (void) addRecipeWithName:(NSString *)name category:(NSString *)category summary:(NSString *)summary picture:(NSImage *)picture rating:(NSNumber *)rating ingredients:(NSMutableArray *)ingredients recipe:(NSString*)recipe preparation:(int)preparation baking:(int)baking rest:(int)rest numberOfPeople:(int)numberOfPeople {
    CIRecipe *r = [[CIRecipe recipeWithName:name category:category summary:summary picture:picture rating:rating ingredients:ingredients recipe:recipe preparation:preparation baking:baking rest:rest numberOfPeople:numberOfPeople] retain];
    
    if (![self saveRecipeInDB:r]) {
        [r release];
        NSLog(@"%@", @"Save FAIL");
        return;
    }
    
    [r release];
    
    [self loadRecipe];
    [[NSNotificationCenter defaultCenter] postNotificationName:RECIPECHANGE object:self];
}

-(void)updateRecipe:(CIRecipe *)oldRecipe name:(NSString *)name category:(NSString *)category summary:(NSString *)summary picture:(NSImage *)picture rating:(NSNumber *)rating ingredients:(NSMutableArray *)ingredients recipe:(NSString*)recipe preparation:(int)preparation baking:(int)baking rest:(int)rest numberOfPeople:(int)numberOfPeople {
    CIRecipe *r = [[CIRecipe recipeWithName:name category:category summary:summary picture:picture rating:rating ingredients:ingredients recipe:recipe preparation:preparation baking:baking rest:rest numberOfPeople:numberOfPeople] retain];
    
    [self deleteRecipeFromDB:oldRecipe];
    
    if (![self saveRecipeInDB:r]) {
        [r release];
        NSLog(@"%@", @"Save FAIL");
        return;
    }
    
    [r release];
    
    [self loadRecipe];
    [[NSNotificationCenter defaultCenter] postNotificationName:RECIPECHANGE object:self];
}

-(void)deleteRecipe:(CIRecipe *)recipe {
    
    if (![self deleteRecipeFromDB:recipe])
        return;
    
    [self loadRecipe];
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
    
    [rc.Rating setFloatValue:[[r Rating] floatValue]];
    rc.textField.stringValue = r.Name;
    rc.imageView.image = r.Picture;
    
    return rc;
}

@end
