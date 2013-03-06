//
//  Delete_email_temp.h
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "Hiar_Style_NewAppDelegate.h"

@interface Delete_email_temp : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	IBOutlet UITableView *tblemailtemp;
	sqlite3 *database;
	NSMutableArray *arremailtemp;
	NSMutableDictionary *temp;
	Hiar_Style_NewAppDelegate *objappdel;
	
	NSArray *arr3;
	IBOutlet UIButton *myButton1;
	IBOutlet UIButton *myButton2;
	IBOutlet UIBarButtonItem *btnEdit;
    NSMutableArray *arrayOfCharacters;
    
    NSMutableDictionary *objectsForCharacters;

}
-(void)showdata;
-(IBAction)edit;
-(IBAction)Dodelete;

-(IBAction)buttonClicked1:(id)sender;



@end
