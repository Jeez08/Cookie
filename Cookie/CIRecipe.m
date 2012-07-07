//
//  CIRecipe.m
//  Cookie
//
//  Created by Matthieu Cote on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIRecipe.h"

static int uniqueIDGen = 1000;

@implementation CIRecipe

@synthesize Name = _Name;
@synthesize UniqueId = _UniqueId;
@synthesize Category = _Category;
@synthesize Summary = _Summary;
@synthesize Picture = _Picture;
@synthesize Rating = _Rating;
@synthesize Ingredients = _Ingredients;
@synthesize Recipe = _Recipe;
@synthesize Preparation = _Preparation;
@synthesize Baking = _Baking;
@synthesize Rest = _Rest;
@synthesize NumberOfPeople = _NumberOfPeople;

- (id) initWithName:(NSString *)name category:(NSString *)category summary:(NSString *)summary picture:(NSImage *)picture rating:(NSNumber *)rating ingredients:(NSMutableArray *)ingredients recipe:(NSString
 *)recipe preparation:(int)preparation baking:(int)baking rest:(int)rest numberOfPeople:(int)numberOfPeople {
    
    self = [super init];
    
    if (nil != self) {
        _Name = name;
        _UniqueId = [NSString stringWithFormat:@"%d", uniqueIDGen++];
        _Category = category;
        _Summary = summary;
        _Picture = [picture copy];
        _Rating = rating;
        _Ingredients = ingredients;
        _Recipe = recipe;
        _Preparation = preparation;
        _Baking = baking;
        _Rest = rest;
        _NumberOfPeople = numberOfPeople;
    }
    
    return self;
}

+ (id) recipeWithName:(NSString *)name category:(NSString *)category summary:(NSString *)summary picture:(NSImage *)picture rating:(NSNumber *)rating ingredients:(NSMutableArray *)ingredients recipe:(NSString *)recipe preparation:(int)preparation baking:(int)baking rest:(int)rest numberOfPeople:(int)numberOfPeople {
    
    return [[[self alloc] initWithName:name category:category summary:summary picture:picture rating:rating ingredients:ingredients recipe:recipe preparation:preparation baking:baking rest:rest numberOfPeople:numberOfPeople] autorelease];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (nil != self){
        _Name = [[aDecoder decodeObjectForKey:@"Name"] retain];
        _UniqueId = [[aDecoder decodeObjectForKey:@"UniqueID"] retain];
        _Category = [[aDecoder decodeObjectForKey:@"Category"] retain];
        _Summary = [[aDecoder decodeObjectForKey:@"Summary"] retain];
        _Picture = [[aDecoder decodeObjectForKey:@"Picture"] retain];
        _Rating = [[aDecoder decodeObjectForKey:@"Rating"] retain];
        _Ingredients = [[aDecoder decodeObjectForKey:@"Ingredients"] retain];
        _Recipe = [[aDecoder decodeObjectForKey:@"Recipe"] retain];
        _Preparation = [aDecoder decodeIntForKey:@"Preparation"];
        _Baking = [aDecoder decodeIntForKey:@"Baking"];
        _Rest = [aDecoder decodeIntForKey:@"Rest"];
        _NumberOfPeople = [aDecoder decodeIntForKey:@"NumberOfPeople"];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_Name forKey:@"Name"];
    [aCoder encodeObject:_UniqueId forKey:@"UniqueID"];
    [aCoder encodeObject:_Category forKey:@"Category"];
    [aCoder encodeObject:_Summary forKey:@"Summary"];
    [aCoder encodeObject:_Picture forKey:@"Picture"];
    [aCoder encodeObject:_Rating forKey:@"Rating"];
    [aCoder encodeObject:_Ingredients forKey:@"Ingredients"];
    [aCoder encodeObject:_Recipe forKey:@"Recipe"];
    [aCoder encodeInt:_Preparation forKey:@"Preparation"];
    [aCoder encodeInt:_Baking forKey:@"Baking"];
    [aCoder encodeInt:_Rest forKey:@"Rest"];
    [aCoder encodeInt:_NumberOfPeople forKey:@"NumberOfPeople"];
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
