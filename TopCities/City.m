//
//  City.m
//  TopCities
//
//  Created by Jonathan Kilgore on 1/22/16.
//  Copyright © 2016 Jonathan Kilgore. All rights reserved.
//

#import "City.h"

@implementation City

-(instancetype)initWithCityName:(NSString *)name andCityState:(NSString *)state andCityImage:(UIImage *)image andWikiLink:(NSString *)wikiLink

{
    self = [super init];
    
    if (self) {
        self.cityName = name;
        self.cityState = state;
        self.cityImage = image;
        self.cityLink = wikiLink;

    }
    
    return self;
}

-(void)setNewName:(NSString *)newName{
    self.cityName = newName;
}

-(void)setNewState:(NSString *)newState {
    self.cityState = newState;
}

@end
