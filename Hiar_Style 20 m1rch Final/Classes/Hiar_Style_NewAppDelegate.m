//
//  Hiar_Style_NewAppDelegate.m
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Hiar_Style_NewAppDelegate.h"
#import "Birthday_Reminder.h"
#import "DataBase.h"
//#import "HomeDire.h"
//#import "Service_Listing.h"
@implementation Hiar_Style_NewAppDelegate

@synthesize window;
@synthesize navigationController,strname,idvalue,strclientname,strdate;
@synthesize strvolume;
@synthesize strcolor;
@synthesize strformula;
@synthesize strcolorform;
@synthesize stradicolor;
@synthesize strtime,strselect;
@synthesize strservicename;
@synthesize strprice,strserviceid;
@synthesize tabmain,tabmainsub;
@synthesize navigation,editdire,ClientNameForEmail;
@synthesize enlargeimage,strSubject,strMessage,strselectemail,strupdateFormulla,strSelectedreport;
//,strselectemail,strselectemailcc,strselecttextfield;
NSString *kRemindMeNotificationDataKey = @"kRemindMeNotificationDataKey";

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	
    // Override point for customization after application launch.
    
    [self SetNottification];

	//[self createCopyOfDataIfNeeded];
	//self.tabmain.navigationController.navigationBar.hidden=TRUE;
    Birthday_Reminder *OBJVIEW;
    OBJVIEW =[[Birthday_Reminder alloc]init];
    
    [window makeKeyAndVisible];
//	self.navigationController.navigationBar.tintColor=[UIColor blackColor];
//	self.navigationController.navigationBar.hidden=TRUE;
	tabmainsub.delegate=self;

	tabmain.delegate=self;
    
	    NSString *lock;
    //				

lock = [[NSUserDefaults standardUserDefaults] valueForKey:@"Password"];
    
    
    
    if([lock isEqualToString:@"On"])
    {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Please Enter Password!" message:@"Hello" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        myTextField.delegate=self;
        myTextField.secureTextEntry=YES;
        
        myTextField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
        myTextField.secureTextEntry=YES;
        
        
        [myTextField setBackgroundColor:[UIColor whiteColor]];
        [myAlertView addSubview:myTextField];
        [myAlertView show];
        [myAlertView release];
        
        
        
    }
    else{
    
        self.window.rootViewController = self.navigationController;
        
    }
    Class cls = NSClassFromString(@"UILocalNotification");
	if (cls) {
		UILocalNotification *notification = [launchOptions objectForKey:
                                             UIApplicationLaunchOptionsLocalNotificationKey];
		
		if (notification) {
			NSString *reminderText = [notification.userInfo 
									  objectForKey:kRemindMeNotificationDataKey];
			[OBJVIEW showReminder:reminderText];
		}
	}
	
	application.applicationIconBadgeNumber = 0;
	
    [window addSubview:navigationController.view];

    
    
    
    
	
    return YES;
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex   {
    
    if (buttonIndex==0){
        
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Please Enter Password!" message:@"Hello" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
        myTextField.delegate=self;
        
        myTextField = [[UITextField alloc] initWithFrame:CGRectMake(12.0, 45.0, 260.0, 25.0)];
        myTextField.secureTextEntry=YES;
        
        [myTextField setBackgroundColor:[UIColor whiteColor]];
        [myAlertView addSubview:myTextField];
        [myAlertView show];
        [myAlertView release];
        
    }

    if (buttonIndex==1) {
        NSLog(@"hiii%@",myTextField.text);
        
        NSString *LockPassword;
        LockPassword=[[NSUserDefaults   standardUserDefaults]valueForKey:@"LockPassword"];
        
        if([LockPassword isEqualToString:myTextField.text])
        {
            
            
            self.window.rootViewController = self.navigationController;
            
            
        }
        else{
        
            UIAlertView *alertdisplay=[[UIAlertView alloc]initWithTitle:@"Error" message:@"Invalid password" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:nil, nil];
            [alertdisplay show];
            [alertdisplay release];
        
        }
    }
}
-(void)createEditableCopyOfDatabaseIfNeeded 
{
    
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"Hairstyle.sqlite"];
    success = [fileManager fileExistsAtPath:writableDBPath];
	//	NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"FishApp.sqlite"];
	//	success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
    if (success) 
		return;
    else
	{
		NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Hairstyle.sqlite"];
		success = [fileManager copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
		if (!success) 
		{
			NSAssert1(0, @"Failed to create writable database file with message '%@'.", [error localizedDescription]);
		}
	}
}


-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
     
   [(UINavigationController*)viewController popToRootViewControllerAnimated:NO];
    if(tabmainsub.selectedIndex==2)
{
   
    
    
//    self.navigationController.navigationBarHidden = YES;
    
    CGRect newFrame = self.tabmainsub.view.frame;
    newFrame.size.height += self.tabmainsub.tabBar.frame.size.height;
    
    self.tabmainsub.view.frame = newFrame;

    
    
    //self.window.rootViewController=self.editdire;
    
//     Service_Listing *obj;
//    obj=[[Service_Listing alloc]initWithNibName:@"Service_Listing" bundle:nil];
//
//    self.tabmainsub.tabBar.hidden=TRUE;
//    
//    [self.navigationController pushViewController:self.editdire animated:NO];
//    [self.navigationController popViewControllerAnimated:NO];
//
    
    
//    
//    
//    Service_Listing *obj;
//    obj=[[Service_Listing alloc]initWithNibName:@"Service_Listing" bundle:nil];
//    [self.navigationController pushViewController:obj animated:YES];
//    
//    //obj.view.frame=CGRectMake(0, 50, 320, 500);
//    

    
  
    
    
}
   
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	
	application.applicationIconBadgeNumber = 0;
}

- (void)application:(UIApplication *)application 
didReceiveLocalNotification:(UILocalNotification *)notification {
	
	// UIApplicationState state = [application applicationState];
	// if (state == UIApplicationStateInactive) {
    
    // Application was in the background when notification
    // was delivered.
	// }
	
	Birthday_Reminder *OBJVIEW;
    OBJVIEW =[[Birthday_Reminder alloc]init];
    
	application.applicationIconBadgeNumber = 0;
	NSString *reminderText = [notification.userInfo
							  objectForKey:kRemindMeNotificationDataKey];
	[OBJVIEW showReminder:reminderText];
}

//- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
//}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}
-(void)SetEmailNottification{
    
    NSDate *now1 = [NSDate date];
	
    NSString *strBdayrem1;
    strBdayrem1=[[NSUserDefaults standardUserDefaults]valueForKey:@"EmailReminder"];
    
    NSDate *earlierDate11;
    
    
    
    
    if ([strBdayrem1 isEqualToString:@"Off"]) {
        earlierDate11=[now1 dateByAddingTimeInterval:(-30*24*60*60)];
    }
    
    
    else if ([strBdayrem1 isEqualToString:@"After 30 days"]) {
        earlierDate11= [now1 dateByAddingTimeInterval:(-30*24*60*60)];
    }
    else if ([strBdayrem1 isEqualToString:@"After 60 days"]) {
        earlierDate11= [now1 dateByAddingTimeInterval:(-60*24*60*60)];
    }
    else if ([strBdayrem1 isEqualToString:@"After 90 days"]) {
        earlierDate11= [now1 dateByAddingTimeInterval:(-90*24*60*60)];
    }
    else if ([strBdayrem1 isEqualToString:@"After 120 days"]) {
        earlierDate11= [now1 dateByAddingTimeInterval:(-120*24*60*60)];
    }
    
    else{
        earlierDate11= [now1 dateByAddingTimeInterval:(-30*24*60*60)]; 
    
        nottification   =FALSE;
        
    }
	
    
    if(nottification==FALSE)
    {
    
        [self clearNotification];
        
    }
    
    else{    
	
	//nslog(@"%@",earlierDate);
	
	
	
	NSString *strDate = [[NSString alloc] initWithFormat:@"%@",earlierDate11];
	NSArray *arr = [strDate componentsSeparatedByString:@" "];
	NSString *str;
	str = [arr objectAtIndex:0];
    
    [strDate release];
    
    NSString *condition=[NSString stringWithFormat:@"where LastServiceList <'%@'",str];
  
    
    
    arrdate=[[NSMutableArray alloc]init];
    DataBase *objdatabase=[[DataBase alloc]init];
    
    
    [objdatabase    ShowDataForClientname:condition];
    
    [arrdate addObjectsFromArray:objdatabase.catchArray];
    
    for(int i=0;i<[arrdate count];i++)
    {
        //clientName=[[arrdate objectAtIndex:i] valueForKey:@"name"];
        
        
//        NSDateFormatter *formater=[[NSDateFormatter alloc]init];
//        [formater setDateFormat:@"yyyy-MM-dd h:mm:ss a"];
//        [formater setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
//        
//        NSDate *now1 = [formater dateFromString:[NSString stringWithFormat:@"%@ 11:07:00 PM",[[arrdate objectAtIndex:i]valueForKey:@"date"]]];
//        
//        NSLog(@"%@",now1);
//        
//        NSString *now=[NSString stringWithFormat:@"%@",now1];
        
//        if(now==nil || now==NULL || [now isEqualToString:@"(null)"] || [now isEqualToString:@""])
//        {
//            
//        }
//        else{
//            
//            strBdayrem=[[NSUserDefaults standardUserDefaults]valueForKey:@"BirthdayReminder"];
//            if ([strBdayrem isEqualToString:@"Off"]) {
//                [self clearNotification];
//                
//            }
//            
//            else if ([strBdayrem isEqualToString:@"At time of event"]) {
//                earlierDate1= now1 ;
//                
//            }
//            else if ([strBdayrem isEqualToString:@"1 day prior"]) {
//                earlierDate1= [now1 dateByAddingTimeInterval:(-1*24*60*60)];
//            }
//            else if ([strBdayrem isEqualToString:@"2 days prior"]) {
//                earlierDate1= [now1 dateByAddingTimeInterval:(-2*24*60*60)];
//            }
//            else if ([strBdayrem isEqualToString:@"1 week prior"]) {
//                earlierDate1= [now1 dateByAddingTimeInterval:(-7*24*60*60)];
//            }
//            else if ([strBdayrem isEqualToString:@"2 weeks prior"]) {
//                earlierDate1= [now1 dateByAddingTimeInterval:(-14*24*60*60)];
//            }
//            else if ([strBdayrem isEqualToString:@"3 weeks prior"]) {
//                earlierDate1= [now1 dateByAddingTimeInterval:(-21*24*60*60)];
//            }
//            else if ([strBdayrem isEqualToString:@"4 weeks prior"]) {
//                earlierDate1= [now1 dateByAddingTimeInterval:(-28*24*60*60)];
//            }
//            
//            else{
//                earlierDate1= now1 ;
//                
//            }
            strEmailOrBday=@"Absense";
        
            [self scheduleNotification];
            //         NSDictionary *dataDict;
            //        dataDict = [NSDictionary dictionaryWithObjectsAndKeys:earlierDate1,@"FIRE_TIME_KEY",@"Task Reminder",@"NOTIFICATION_MESSAGE_KEY",nil];
            //        earlierDate1=nil;
            //        [self scheduleNotificationWithItem:dataDict]; 
            
            
       //}
    }
    if ([strBdayrem1 isEqualToString:@"Off"]) {
        [self clearNotification];
        
    }
    }
}
-(void)SetNottification{
    arrdate=[[NSMutableArray alloc]init];
    DataBase *objdatabase=[[DataBase alloc]init];
    
    [objdatabase    ShowDataForClientname:@""];
    
    [arrdate addObjectsFromArray:objdatabase.catchArray];
    
    
    
    
    
    
    
    
    for(int i=0;i<[arrdate count];i++)
    {
        
        
        NSDateFormatter *formater=[[NSDateFormatter alloc]init];
        [formater setDateFormat:@"yyyy-MM-dd h:mm:ss a"];
        [formater setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
        
        NSDate *now1 = [formater dateFromString:[NSString stringWithFormat:@"%@ 11:07:00 PM",[[arrdate objectAtIndex:i]valueForKey:@"date"]]];

        NSLog(@"%@",now1);
        
        NSString *now=[NSString stringWithFormat:@"%@",now1];
        
        if(now==nil || now==NULL || [now isEqualToString:@"(null)"] || [now isEqualToString:@""])
        {
            
        }
        else{
            
            strBdayrem=[[NSUserDefaults standardUserDefaults]valueForKey:@"BirthdayReminder"];
            if ([strBdayrem isEqualToString:@"Off"]) {
                [self clearNotification];
                
            }
            
            else if ([strBdayrem isEqualToString:@"At time of event"]) {
                earlierDate1= now1 ;
                
            }
            else if ([strBdayrem isEqualToString:@"1 day prior"]) {
                earlierDate1= [now1 dateByAddingTimeInterval:(-1*24*60*60)];
            }
            else if ([strBdayrem isEqualToString:@"2 days prior"]) {
                earlierDate1= [now1 dateByAddingTimeInterval:(-2*24*60*60)];
            }
            else if ([strBdayrem isEqualToString:@"1 week prior"]) {
                earlierDate1= [now1 dateByAddingTimeInterval:(-7*24*60*60)];
            }
            else if ([strBdayrem isEqualToString:@"2 weeks prior"]) {
                earlierDate1= [now1 dateByAddingTimeInterval:(-14*24*60*60)];
            }
            else if ([strBdayrem isEqualToString:@"3 weeks prior"]) {
                earlierDate1= [now1 dateByAddingTimeInterval:(-21*24*60*60)];
            }
            else if ([strBdayrem isEqualToString:@"4 weeks prior"]) {
                earlierDate1= [now1 dateByAddingTimeInterval:(-28*24*60*60)];
            }
            
            else{
                earlierDate1= now1 ;
                nottification=FALSE;
                
            }
        if(nottification==FALSE)
        {
        
            [self clearNotification];
            
        }
        else{
            strEmailOrBday=@"bday";
            
            [self scheduleNotification];
        }
            //         NSDictionary *dataDict;
            //        dataDict = [NSDictionary dictionaryWithObjectsAndKeys:earlierDate1,@"FIRE_TIME_KEY",@"Task Reminder",@"NOTIFICATION_MESSAGE_KEY",nil];
            //        earlierDate1=nil;
            //        [self scheduleNotificationWithItem:dataDict]; 
            
            
        }
    }
    
    
}
- (void)clearNotification {
	
	[[UIApplication sharedApplication] cancelAllLocalNotifications];
}
- (void)scheduleNotification {
	
	//[[UIApplication sharedApplication] cancelAllLocalNotifications];
    if ([strBdayrem isEqualToString:@"Off"]) {
        [self clearNotification];
        
    }
    else{
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        Class cls = NSClassFromString(@"UILocalNotification");
        if (cls != nil) {
            
            UILocalNotification *notif = [[cls alloc] init];
            if([strEmailOrBday isEqualToString:@"bday"])
            {
            notif.fireDate = earlierDate1;
            }
            else{
                NSDate *date2;
                date2=[NSDate date];
                notif.fireDate=date2;
                
            }
                notif.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
            
            notif.alertBody = @"Did you forget something?";
            notif.alertAction = @"Show me";
            notif.soundName = UILocalNotificationDefaultSoundName;
           // notif.applicationIconBadgeNumber = 1;
            
            NSInteger index = 6;
            switch (index) {
                case 1:
                    notif.repeatInterval = NSMinuteCalendarUnit;
                    break;
                case 2:
                    notif.repeatInterval = NSHourCalendarUnit;
                    break;
                case 3:
                    notif.repeatInterval = NSDayCalendarUnit;
                    break;
                case 4:
                    notif.repeatInterval = NSWeekCalendarUnit;
                    break;
                default:
                    notif.repeatInterval = 0;
                    break;
            }
            NSDictionary *userDict;
            if([strEmailOrBday isEqualToString:@"bday"])
            {
                 userDict= [NSDictionary dictionaryWithObject:@"Birthday Reminder"
                                                                     forKey:kRemindMeNotificationDataKey];
                
            }
            else{
               userDict = [NSDictionary dictionaryWithObject:@"Absentee Reminder"
                                                                     forKey:kRemindMeNotificationDataKey];
                
                
            }
               notif.userInfo = userDict;
            
            [[UIApplication sharedApplication] scheduleLocalNotification:notif];
            [notif release];
        }
        
    }
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

