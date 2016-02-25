//
//  WebViewController.m
//  TopCities
//
//  Created by Jonathan Kilgore on 1/22/16.
//  Copyright © 2016 Jonathan Kilgore. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadReqestWithText:self.selectedShowCity.cityLink];
    
//    self.webView.delegate = self;
//    
//    if ([self.urlString containsString:@" "])
//    {
//        self.urlString = [self.urlString stringByReplacingOccurrencesOfString:@" " withString:@"_"];
//    }
//    NSURL *url = [NSURL URLWithString:self.urlString];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
}


-(void)loadReqestWithText:(NSString *)text{
    if ([text containsString:@"https://"]) {
        
    } else{
        text = [NSString stringWithFormat:@"https://en.wikipedia.org/wiki/%@", text];
    }
    NSURL *url = [NSURL URLWithString:text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark - UIWebView

- (IBAction)dismissButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end
