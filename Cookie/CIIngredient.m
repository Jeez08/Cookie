//
//  CIIngredient.m
//  Cookie
//
//  Created by Matthieu Cote on 7/4/12.
//  Copyright (c) 2012 EPITA. All rights reserved.
//

#import "CIIngredient.h"

@implementation CIIngredient

@synthesize name = _name;
@synthesize unit = _unit;
@synthesize quantity = _quantity;

- (id) initWithName:(NSString*)name quantity:(NSString*)quantity unit:(NSString*)unit {
    self = [super init];
    
    if (nil != self) {
        _name = name;
        _unit = unit;
        _quantity = quantity;
    }
    
    return self;
}

+ (id) ingredientWithName:(NSString*)name quantity:(NSString*)quantity unit:(NSString*)unit {
    
    return [[[self alloc] initWithName:name quantity:quantity unit:unit] autorelease];
}

/*
+(NSDictionary*)convertIngredient:(CIIngredient *)ingredient {
    NSDictionary *dico = [[[NSDictionary alloc] initWithObjectsAndKeys:
                          @"Quantity", [ingredient quantity],
                          @"Description", [ingredient quantity],
                          @"Mesure", [ingredient quantity],
                          nil] autorelease];
    
    return dico;
}
*/

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (nil != self){
        _name = [[aDecoder decodeObjectForKey:@"Name"] retain];
        _unit = [[aDecoder decodeObjectForKey:@"Mesure"] retain];
        _quantity = [[aDecoder decodeObjectForKey:@"Quantity"] retain];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:@"Name"];
    [aCoder encodeObject:_unit forKey:@"Mesure"];
    [aCoder encodeObject:_quantity forKey:@"Quantity"];
}

- (void)dealloc {
    _name = nil;
    _quantity = nil;
    _unit = nil;
    
    [super dealloc];
}

@end
