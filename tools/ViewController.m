//
//  ViewController.m
//  tools
//
//  Created by CtecTeacher on 5/29/14.
//  Copyright (c) 2014 ABC Adult School. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)sendEmail:(id)sender {
    
    //Recipent
    NSString *emailRecipent = @"info@binjaloo.com";
    NSString *emailRecipent2 = @"admin2@internet.com";
    NSArray *emailReceipents = @[emailRecipent, emailRecipent2];
    //Subject
    NSString *emailSubject = @"Sending Emails From iOS";
    //Body
    NSString *emailBody = @"Sending mail uses MFMailComposeViewController!  Yay!";
    
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc]init];
    
    if ([MFMailComposeViewController canSendMail])
    {
    
    composer.mailComposeDelegate = self;
    [composer setSubject:emailSubject];
    [composer setMessageBody:emailBody isHTML:NO];
    [composer setToRecipients:emailReceipents];
    
    [self presentViewController:composer animated:YES completion:^{NSLog(@"Composer Finished Presenting");}];
        
    }else {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error!" message:@"Cannot Send Mail." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
    }
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{


    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail Cancelled.");
            break;
            
        case MFMailComposeResultSaved:
            NSLog(@"Mail Saved");
            break;
            
        case MFMailComposeResultSent:
            NSLog(@"Mail Sent.");
            break;
            
        case MFMailComposeResultFailed:
            NSLog(@"%@ /n %@",[error localizedDescription], [error localizedRecoverySuggestion]);
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:^{NSLog(@"MailComposeViewController Closed");}];
}

- (IBAction)sendText:(id)sender {
    
    if (![MFMessageComposeViewController canSendText]) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"This device does not support SMS" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
        
    } else {
    
    //Recipents
    NSArray *recipents = @[@"1234567890"];
    //Message
    NSString *message = @"Please bring me pizza";
    
    MFMessageComposeViewController *composer = [[MFMessageComposeViewController alloc]init];
    composer.messageComposeDelegate = self;
    [composer setRecipients:recipents];
    [composer setBody:message];
    
    [self presentViewController:composer animated:YES completion:^{
        NSLog(@"SMS Composer Presented");
    }];
    }
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    switch (result) {
        case MessageComposeResultCancelled:
            NSLog(@"Message was cancelled by User");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Message failed to send");
            break;
        case MessageComposeResultSent:
            NSLog(@"Message was sent");
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"messageComposeViewController was dismissed");
    }];
}

@end
