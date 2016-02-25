//
//  City.h
//  TopCities
//
//  Created by Jonathan Kilgore on 1/22/16.
//  Copyright © 2016 Jonathan Kilgore. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject

@property NSString *cityName;
@property NSString *cityState;
@property UIImage *cityImage;
@property NSString *cityLink;

-(instancetype)initWithCityName:(NSString *)name andCityState:(NSString *)state andCityImage:(UIImage *)image andWikiLink:(NSString *)wikiLink;

-(void)setNewName:(NSString *)newName;
-(void)setNewState:(NSString *)newState;






@end
