//
//  Absentees_Reminder.h
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MessageUI/MessageUI.h>
#import <sqlite3.h>
#import "Hiar_Style_NewAppDelegate.h"
#import "SendMail.h"
#import "DataBase.h"
@interface Absentees_Reminder : UIViewController <MFMailComposeViewControllerDelegate,UITableViewDelegate,UITableViewDataSource> {
	IBOutlet UITableView *tblnamelist;
	NSArray *arr1;
    DataBase *objdatabase;
    
	IBOutlet UIButton *myButton2;
	IBOutlet UIButton *myButton1;
	IBOutlet UISegmentedControl *seg;
	IBOutlet UILabel *lbldscr;
	sqlite3 *database;
	NSString *databasename;
	NSString *databasepath;
	NSMutableArray *arrclient;
	NSMutableDictionary *temp;
	Hiar_Style_NewAppDelegate *objappdel;
	NSMutableArray *catchArray;
	NSString *str1;
    NSMutableArray *arrlistemail;
    
	int selectall;
    
    
    
    SendMail *objSendMail;
    
    
    
    
    
    
}
@property(nonatomic,retain)NSMutableArray *catchArray;
-(void)showdata;

-(IBAction)buttonClicked1:(id)sender;

-(IBAction)buttonClicked2:(id)sender;

-(IBAction)selectAll:(id)sender;


@end
