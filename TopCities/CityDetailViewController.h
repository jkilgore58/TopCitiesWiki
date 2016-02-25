//
//  CityDetailViewController.h
//  TopCities
//
//  Created by Jonathan Kilgore on 1/22/16.
//  Copyright © 2016 Jonathan Kilgore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@protocol CityDetailViewControllerDelegate <NSObject>

-(void)changeNavTitle:(NSString *)title;
-(void) selectedCity:(City *)city editName:(NSString *)name editState:(NSString *)state;



@end


@interface CityDetailViewController : UIViewController

@property City *selectedCity;

@property (nonatomic, assign) id <CityDetailViewControllerDelegate> delegate;

@end
