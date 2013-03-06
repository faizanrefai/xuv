//
//  Birthday_Reminder.h
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
#import "SettingHome.h"
#import "DataBase.h"

@interface Birthday_Reminder : UIViewController <MFMailComposeViewControllerDelegate,UITableViewDelegate,UITableViewDataSource>{
	IBOutlet UITableView *tblnamelist;
    
    DataBase *objdatabase;
    
    
	NSArray *arr1;
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
	
	SendMail *objsendmail;
    NSMutableArray *arrlistemail;
    
    int selectall;
    
    
    SettingHome *objSetting;
    
    
    
    
}

@property(nonatomic,retain)NSMutableArray *catchArray;
-(void)showdata;

-(IBAction)back;
-(IBAction)settings;

-(IBAction)buttonClicked1:(id)sender;

- (void)showReminder:(NSString *)text;
-(IBAction)selectAll:(id)sender;

@end
