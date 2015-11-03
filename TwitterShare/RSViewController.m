//
//  RSViewController.m
//  TwitterShare
//
//  Created by Roma Chopovenko on 11/2/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import "RSViewController.h"
#import <Social/Social.h>

@interface RSViewController () <UIAlertViewDelegate>

@end

@implementation RSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureTweetTextView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - help methods

- (void) configureTweetTextView {
    
    self.tweetTextView.layer.backgroundColor = [UIColor orangeColor].CGColor;
    self.tweetTextView.layer.cornerRadius = 10.f;
    self.tweetTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.tweetTextView.layer.borderWidth = 2.f;
    
    
}

- (void) showAlertMaessage:(NSString *)message {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twitter Share" message:message delegate:nil cancelButtonTitle:@"Twitt" otherButtonTitles:nil, nil];
    
    [alert show];
}


#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex != [alertView cancelButtonIndex]) {
        
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
            
            SLComposeViewController *twiterVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            
            if (self.tweetTextView.text.length < 140) {
                
                [twiterVC setInitialText:self.tweetTextView.text];
                
            } else {
                
                NSString *shortText = [self.tweetTextView.text substringToIndex:140];
                [twiterVC setInitialText:shortText];
            }
            
            [self presentViewController:twiterVC animated:YES completion:nil];
            
        } else {
            [self showAlertMaessage:@"You are not signed in to twitter"];
            
        }
    }
    
}

#pragma mark - Actions

- (IBAction)actionSendTweet:(UIBarButtonItem *)sender {
    
    if ([self.tweetTextView isFirstResponder]) {
        [self.tweetTextView resignFirstResponder];
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sending" message:@"Send your message" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
    
}

@end
