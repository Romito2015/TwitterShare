//
//  RSViewController.h
//  TwitterShare
//
//  Created by Roma Chopovenko on 11/2/15.
//  Copyright (c) 2015 RSChopovenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSViewController : UIViewController

- (IBAction)actionSendTweet:(UIBarButtonItem *)sender;

@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;


- (void) configureTweetTextView;
- (void) showAlertMaessage:(NSString *)message;

@end
