//
//  SendMail.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCellImageViewTag		1000
#define kCellLabelTag			1001
#define kLabelIndentedRect	CGRectMake(40.0, 12.0, 275.0, 20.0)
#define kLabelRect			CGRectMake(15.0, 12.0, 275.0, 20.0)
#import "JSON.h"
#import "JSONParser.h"

#define kNameValueTag 1
#define kColorValueTag 2
#import "ContactList.h"
#import "Hiar_Style_NewAppDelegate.h"

#import "CustomCellForMail.h"
#import <sqlite3.h>


@interface SendMail : UIViewController<UITextViewDelegate,UIAlertViewDelegate,UITableViewDataSource,UITableViewDelegate ,UITextFieldDelegate,UIActionSheetDelegate> {
    
    sqlite3 *database;
    
    NSString *strSubjectTect;
    NSString *clientId;
    
    
    NSString *strmessabges;

    Hiar_Style_NewAppDelegate   *objappdel;
    NSString *selectvalue;
    
  //  NSString *selectvalue1;
    
    
    NSString *strTOemail;
    NSString *strCCemail;
    IBOutlet UIScrollView *scrl;
    
    //IBOutlet UITableViewCell *customcell;
    
    CGFloat animatedDistance;
	 JSONParser *parser;
	IBOutlet UITableView *tblemail;

	
    
    UIButton *Sendbtn;
    ContactList *objcontact;
    IBOutlet CustomCellForMail *customcell;
    
    
    NSString *strToemails;
    NSString *strCcemails;
    NSString *strSubject;
    NSString *strMessage;
    
    NSMutableArray *arremaildata;
    
    
    
    
    
    
}
//@property(nonatomic,retain)IBOutlet UITableViewCell *customcell;
@property(nonatomic,retain)IBOutlet CustomCellForMail *customcell;

-(void)AddinTemplate;
-(void)SendEmail;

-(IBAction)PhoneBook:(id)sender;
-(IBAction)click;
-(IBAction)Send;

-(IBAction)back;

@end
