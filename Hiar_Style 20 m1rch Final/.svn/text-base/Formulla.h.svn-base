//
//  Formulla.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

#import "Hiar_Style_NewAppDelegate.h"
#define kNameValueTag 1
#import "ColorLIne.h"
@interface Formulla : UIViewController <UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource>{
	IBOutlet UITableView *tblformulla;
	NSArray *arrformula;

	IBOutlet UILabel *lblvalue;
	IBOutlet UILabel *lblvalue1;
	IBOutlet UILabel *lblvalue2;
	IBOutlet UILabel *lblvalue3;
	IBOutlet UILabel *lblvalue4;
	IBOutlet UILabel *lblvalue5;
    NSString *strcolor;
    NSString *strcolor2;
    
	
	sqlite3 *database;
	
	Hiar_Style_NewAppDelegate *objappdel;
	NSString *strdate;
	
	NSString *date1,*date2;
	
	
	IBOutlet UIPickerView *pickerView1;
		int i;
	
	NSArray *arr;
	NSArray *arrlistchar;
	NSArray *arrvolume;
	NSArray *arrtime;
	

    ColorLIne *objColor;
    


}


@property(nonatomic,retain)UITableView *tblformulla;

-(IBAction)done;
-(IBAction)cancel;


@end
