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

- (id) initWithName:(NSString *)name category:(NSString *)category summary:(NSString *)summary picture:(NSImage *)picture rating:(NSNumber *)rating ingredients:(NSMutableArray *)ingredients recipe:(NSTextField *)recipe {
    
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
    }
    
    return self;
}

+ (id) recipeWithName:(NSString *)name category:(NSString *)category summary:(NSString *)summary picture:(NSImage *)picture rating:(NSNumber *)rating ingredients:(NSMutableArray *)ingredients recipe:(NSTextField *)recipe {
    
    return [[[self alloc] initWithName:name category:category summary:summary picture:picture rating:rating ingredients:ingredients recipe:recipe] autorelease];
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
}

/*
+(NSDictionary*)convertRecipe:(CIRecipe *)recipe {
    NSDictionary *dico = [[[NSDictionary alloc] initWithObjectsAndKeys:
                          @"UniqueID", [recipe UniqueId],
                          @"Name", [recipe Name],
                          @"Category", [recipe Category],       // FIXME -> NSNumber
                          @"PictureID", [recipe Picture],       // FIXME -> NSString
                          @"Rating", [recipe Rating],
                          @"Summary", [recipe Summary],         // FIXME -> NSData
                          @"Ingredients", [recipe Ingredients], // FIXME -> NSArray
                           nil] autorelease];
    
    return dico;
}
*/

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
