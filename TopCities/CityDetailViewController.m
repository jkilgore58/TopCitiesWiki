//
//  CityDetailViewController.m
//  TopCities
//
//  Created by Jonathan Kilgore on 1/22/16.
//  Copyright © 2016 Jonathan Kilgore. All rights reserved.
//

#import "CityDetailViewController.h"
#import "WebViewController.h"

@interface CityDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *wikiLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;

@property WebViewController *webViewController;

//@property BOOL isEditing;

@end

@implementation CityDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageView.image = self.selectedCity.cityImage;
    self.nameTextField.text = self.selectedCity.cityName;
    self.stateTextField.text = self.selectedCity.cityState;
    
}

#pragma mark - UITextField
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return YES;
}

#pragma mark - Actions

- (IBAction)onNameTextField:(UITextField *)sender {
    
    [self.nameTextField endEditing:YES];
    [self.stateTextField endEditing:YES];
    [self.delegate selectedCity:self.selectedCity editName:self.nameTextField.text editState:self.stateTextField.text];
    
}

- (IBAction)onStateTextField:(UITextField *)sender {
    [self.stateTextField endEditing:YES];
    [self.delegate selectedCity:self.selectedCity editName:self.nameTextField.text editState:self.stateTextField.text];
}

- (void)changeNavTitle:(NSString *)title {
    self.navigationItem.title = title;
}

- (IBAction)changeTitle:(id)sender {
    [self.delegate changeNavTitle:self.selectedCity.cityName];

}

#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    WebViewController *webvc = segue.destinationViewController;
    webvc.selectedShowCity = self.selectedCity;

}

@end
