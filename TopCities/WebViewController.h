//
//  WebViewController.h
//  TopCities
//
//  Created by Jonathan Kilgore on 1/22/16.
//  Copyright © 2016 Jonathan Kilgore. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"
#import "CityDetailViewController.h"

@interface WebViewController : UIViewController

@property NSString *urlString;

@property City *selectedShowCity;

@end
