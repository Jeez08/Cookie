//
//  CIRecipe.m
//  Cookie
//
//  Created by Matthieu Cote on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIRecipe.h"

@implementation CIRecipe

@synthesize Name = _Name;
@synthesize UniqueId = _UniqueId;
@synthesize Category = _Category;
@synthesize Summary = _Summary;
@synthesize Picture = _Picture;
@synthesize Rating = _Rating;
@synthesize Ingredients = _Ingredients;
@synthesize Recipe = _Recipe;

- (id) initWithName:(NSString *)name category:(NSString *)category summary:(NSString *)summary picture:(NSImage *)picture rating:(NSNumber *)rating ingredients:(NSMutableArray *)ingredients recipe:(NSTextField *)recipe {
    
    self = [super init];
    
    if (nil != self) {
        _Name = name;
        _UniqueId = 0;
        _Category = category;
        _Summary = summary;
        _Picture = [picture copy];
        _Rating = rating;
        _Ingredients = ingredients;
        _Recipe = recipe;
    }
    
    return self;
}

+ (id) recipeWithName:(NSString *)name category:(NSString *)category summary:(NSString *)summary picture:(NSImage *)picture rating:(NSNumber *)rating ingredients:(NSMutableArray *)ingredients recipe:(NSTextField *)recipe {
    
    return [[[self alloc] initWithName:name category:category summary:summary picture:picture rating:rating ingredients:ingredients recipe:recipe] autorelease];
}

- (void) dealloc {
    _Name = nil;
    _UniqueId = nil;
    _Category = nil;
    _Summary = nil;
    _Picture = nil;
    _Rating = nil;
    _Ingredients = nil;
    _Recipe = nil;
    
    [super dealloc];
}

@end
