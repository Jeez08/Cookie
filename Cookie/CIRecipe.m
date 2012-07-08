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
        self.Name = name;
        self.UniqueId = [NSString stringWithFormat:@"%d", uniqueIDGen++];
        self.Category = category;
        self.Summary = summary;
        self.Picture = [picture copy];
        self.Rating = rating;
        self.Ingredients = ingredients;
        self.Recipe = recipe;
        self.Preparation = preparation;
        self.Baking = baking;
        self.Rest = rest;
        self.NumberOfPeople = numberOfPeople;
    }
    
    return self;
}

+ (id) recipeWithName:(NSString *)name category:(NSString *)category summary:(NSString *)summary picture:(NSImage *)picture rating:(NSNumber *)rating ingredients:(NSMutableArray *)ingredients recipe:(NSString *)recipe preparation:(int)preparation baking:(int)baking rest:(int)rest numberOfPeople:(int)numberOfPeople {
    
    return [[[self alloc] initWithName:name category:category summary:summary picture:picture rating:rating ingredients:ingredients recipe:recipe preparation:preparation baking:baking rest:rest numberOfPeople:numberOfPeople] autorelease];
}

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (nil != self){
        self.Name = [[aDecoder decodeObjectForKey:@"Name"] retain];
        self.UniqueId = [[aDecoder decodeObjectForKey:@"UniqueID"] retain];
        self.Category = [[aDecoder decodeObjectForKey:@"Category"] retain];
        self.Summary = [[aDecoder decodeObjectForKey:@"Summary"] retain];
        self.Picture = [[aDecoder decodeObjectForKey:@"Picture"] retain];
        self.Rating = [[aDecoder decodeObjectForKey:@"Rating"] retain];
        self.Ingredients = [[aDecoder decodeObjectForKey:@"Ingredients"] retain];
        self.Recipe = [[aDecoder decodeObjectForKey:@"Recipe"] retain];
        self.Preparation = [aDecoder decodeIntForKey:@"Preparation"];
        self.Baking = [aDecoder decodeIntForKey:@"Baking"];
        self.Rest = [aDecoder decodeIntForKey:@"Rest"];
        self.NumberOfPeople = [aDecoder decodeIntForKey:@"NumberOfPeople"];
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
    self.Name = nil;
    self.UniqueId = nil;
    self.Category = nil;
    self.Summary = nil;
    self.Picture = nil;
    self.Rating = nil;
    self.Ingredients = nil;
    self.Recipe = nil;
    
    [super dealloc];
}

@end
