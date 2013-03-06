//
//  Hiar_Style_NewAppDelegate.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//




#import <UIKit/UIKit.h>
//#import "Service_Listing.h"

@interface Hiar_Style_NewAppDelegate : NSObject <UITabBarControllerDelegate,UIApplicationDelegate,UIAlertViewDelegate,UITextFieldDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
	NSString *strname;
IBOutlet UINavigationController *navigation;
    IBOutlet UINavigationController *editdire;
    IBOutlet UINavigationController *enlargeimage;
    NSMutableArray *arrdate;
    NSDate *earlierDate1;
    NSString *strBdayrem;
  //  Service_Listing *objservice;
    
    IBOutlet UITextField *myTextField;

	
	NSString *idvalue;
	NSString *strclientname;
	NSString *strdate;

	NSString *strvolume;
	NSString *strcolor;
	NSString *strformula;
	NSString *strcolorform;
	NSString *stradicolor;
	NSString *strtime;
	NSString *strservicename;
	NSString *strprice;
	NSString *strserviceid;
	IBOutlet UITabBarController *tabmain;
    IBOutlet UITabBarController *tabmainsub;
    
	NSString *strselect;
    NSString *strSubject;
    NSString *strMessage;
    
    NSString *strselectemail;
//    NSString *strselectemailcc;
//    
//    NSString *strselecttextfield;
//    
//    
    NSString *clientName;
    
    NSString *strEmailOrBday;
    
    
    NSString *strupdateFormulla;
    
    NSString *strSelectedreport;
    
    NSString *ClientNameForEmail;
    
    BOOL nottification;
    
    }

-(void)createEditableCopyOfDatabaseIfNeeded;


@property(nonatomic,retain)	IBOutlet UITabBarController *tabmain;
@property(nonatomic,retain)	IBOutlet UINavigationController *navigation;
@property(nonatomic,retain)	IBOutlet UINavigationController *editdire;
@property(nonatomic,retain)	IBOutlet UINavigationController *enlargeimage;
@property(nonatomic,retain)NSString *strSelectedreport;
@property(nonatomic,retain)NSString *ClientNameForEmail;

@property(nonatomic,retain)NSString *strupdateFormulla;

@property(nonatomic,retain)IBOutlet UITabBarController *tabmainsub;
@property(nonatomic,retain)NSString *strSubject;

//@property(nonatomic,retain)NSString *strselectemailcc;
//@property(nonatomic,retain)NSString *strselecttextfield;

@property(nonatomic,retain)NSString *strselectemail;
@property(nonatomic,retain)NSString *strMessage;


@property(nonatomic,retain)NSString *strselect;

@property(nonatomic,retain)NSString *strserviceid;

@property(nonatomic,retain)NSString *strservicename;
@property(nonatomic,retain)NSString *strprice;

@property(nonatomic,retain)NSString *strvolume;
@property(nonatomic,retain)NSString *strcolor;
@property(nonatomic,retain)NSString *strformula;
@property(nonatomic,retain)NSString *strcolorform;
@property(nonatomic,retain)NSString *stradicolor;
@property(nonatomic,retain)NSString *strtime;






@property(nonatomic,retain)NSString *strdate;

@property(nonatomic,retain)NSString *strclientname;
@property(nonatomic,retain)NSString *strname;
@property(nonatomic,retain)NSString *idvalue;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
extern NSString *kRemindMeNotificationDataKey;
- (void)showReminder:(NSString *)text;
- (void)scheduleNotification;

- (void)SetNottification;
- (void)SetEmailNottification;
- (void)clearNotification;

@end

