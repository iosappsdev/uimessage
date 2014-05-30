//
//  ViewController.h
//  tools
//
//  Created by CtecTeacher on 5/29/14.
//  Copyright (c) 2014 ABC Adult School. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MessageUI;

@interface ViewController : UIViewController<MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>

- (IBAction)sendEmail:(id)sender;
- (IBAction)sendText:(id)sender;

@end
