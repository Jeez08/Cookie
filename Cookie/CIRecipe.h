//
//  CIRecipe.h
//  Cookie
//
//  Created by Matthieu Cote on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CIRecipe : NSObject

@property (nonatomic, retain) NSString *UniqueId;
@property (nonatomic, retain) NSString *Name;
@property (nonatomic, retain) NSString *Category;
@property (nonatomic, retain) NSString *Summary;
@property (nonatomic, retain) NSImage *Picture;
@property (nonatomic, retain) NSNumber *Rating;
@property (nonatomic, retain) NSTableView *Ingredients;
@property (nonatomic, retain) NSTextField *Recipe;

- (id) initWithName:(NSString*)name category:(NSString*)category summary:(NSString*)summary picture:(NSImage*)picture rating:(NSNumber*)rating ingredients:(NSTableView*)ingredients recipe:(NSTextField*)recipe;
+ (id) recipeWithName:(NSString*)name category:(NSString*)category summary:(NSString*)summary picture:(NSImage*)picture rating:(NSNumber*)rating ingredients:(NSTableView*)ingredients recipe:(NSTextField*)recipe;

- (void)dealloc;

@end
