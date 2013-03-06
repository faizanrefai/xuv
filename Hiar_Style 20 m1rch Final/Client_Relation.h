//
//  Client_Relation.h
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kNameValueTag 1
#import <sqlite3.h>

#import "Hiar_Style_NewAppDelegate.h"
#import <MessageUI/MessageUI.h>
#import "AddMail_Temp.h"
#import "Delete_email_temp.h"
#import "Birthday_Reminder.h"
#import "SendMail.h"
#import "SettingHome.h"
#import "Absentees_Reminder.h"
#import "CustomBadge.h"
#import "DataBase.h"
@interface Client_Relation : UIViewController<MFMailComposeViewControllerDelegate,UITableViewDelegate,UITableViewDataSource,UITabBarDelegate> {
//	IBOutlet UITableView *tblcustomerrel;
	IBOutlet UITabBar *tab;
    
    DataBase *objdatabase;
    
	IBOutlet UINavigationBar *navi;
	sqlite3 *database;
	NSMutableArray *arremailtemp;
	NSMutableDictionary *temp;
	Hiar_Style_NewAppDelegate *objappdel;
	
	NSArray *arr1;
	NSArray *arr2;
	NSArray *arr3;
	IBOutlet UIButton *myButton1;
	IBOutlet UIButton *myButton2;
	IBOutlet UITableView *tblreminder;
	IBOutlet UITableView *tblemail;
	IBOutlet UISegmentedControl *seg;
	AddMail_Temp *objAdd;
    Delete_email_temp *objDeleteMail;
    Birthday_Reminder *objBirthday_Reminder;
    
    Absentees_Reminder *objAbsentees_Reminder;
    
    SendMail *objSendMail;
    
    SettingHome *objSettingHome;
    NSString *strCountBirthdate;
    NSString *strCountAbsence;
    
    
    
    
    NSMutableArray *arrayOfCharacters;
    
    NSMutableDictionary *objectsForCharacters;
    NSMutableArray *arrlistname;
    
   // CustomBadge *customBadge1;
    
}

-(IBAction)click;
-(void)showdata;
-(IBAction)back;
-(void)countBirthdayList;
-(void)countAbsenselist;

-(IBAction)settings;

@end
