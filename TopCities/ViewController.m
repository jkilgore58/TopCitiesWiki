//
//  ViewController.m
//  TopCities
//
//  Created by Jonathan Kilgore on 1/22/16.
//  Copyright © 2016 Jonathan Kilgore. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "CityDetailViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, CityDetailViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *allCities;

@property NSIndexPath *selectedIndexPath;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    City *stlouis = [[City alloc]initWithCityName:@"St. Louis"
                                     andCityState:@"MO"
                                     andCityImage:[UIImage imageNamed:@"StLouis.png"]
                                      andWikiLink:@"https://en.wikipedia.org/wiki/St._Louis"];
    
    City *chicago = [[City alloc]initWithCityName:@"Chicago"
                                     andCityState:@"IL"
                                     andCityImage:[UIImage imageNamed:@"Chicago.png"]
                                      andWikiLink:@"https://en.wikipedia.org/wiki/Chicago"];
    
    City *newOrleans = [[City alloc]initWithCityName:@"New Orleans"
                                        andCityState:@"LA"
                                        andCityImage:[UIImage imageNamed:@"NewOrleans.png"]
                                         andWikiLink:@"https://en.wikipedia.org/wiki/New_Orleans"];
    
    City *lasVegas = [[City alloc]initWithCityName:@"Las Vegas"
                                      andCityState:@"NV"
                                      andCityImage:[UIImage imageNamed:@"LasVegas.png"]
                                       andWikiLink:@"https://en.wikipedia.org/wiki/Las_Vegas"];
    
    City *sanFran = [[City alloc]initWithCityName:@"San Francisco"
                                     andCityState:@"CA"
                                     andCityImage:[UIImage imageNamed:@"SanFran.png"]
                                      andWikiLink:@"https://en.wikipedia.org/wiki/San_Francisco"];
    
    
    self.allCities = [NSMutableArray arrayWithObjects:stlouis, chicago, newOrleans, lasVegas, sanFran, nil];
    self.title = @"Top Citites";
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource items

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.allCities.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CityCell" forIndexPath:indexPath];
    City *cities = [self.allCities objectAtIndex:indexPath.row];
    
    cell.textLabel.text = cities.cityName;
    cell.detailTextLabel.text = cities.cityState;
    cell.imageView.image = cities.cityImage;
    
    //Formatting purposes only to have all the images the same size
    UIImage *image = cities.cityImage;
    CGSize sacleSize = CGSizeMake(100, 100);
    UIGraphicsBeginImageContextWithOptions(sacleSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, sacleSize.width, sacleSize.height)];
    UIImage * resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    cell.imageView.image = resizedImage;
    
    return cell;
    
}

#pragma mark - UITableView

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

//Should allow user to swipe and delete a city row
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.allCities removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailView"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        CityDetailViewController *destination = segue.destinationViewController;
        destination.selectedCity = [self.allCities objectAtIndex:indexPath.row];
        destination.delegate = self;
    }
    
}

- (void)changeNavTitle:(NSString *)title {
    self.navigationItem.title = title;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndexPath = indexPath;
}

-(void) selectedCity:(City *)city editName:(NSString *)name editState:(NSString *)state{
    City *theCity = [self.allCities objectAtIndex:self.selectedIndexPath.row];
    theCity.cityName = name;
    theCity.cityState = state;
    self.title = name;
    [self.tableView reloadData];
}

@end
