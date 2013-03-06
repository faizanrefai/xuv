//
//  EmailSetting.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import "DataBase.h"
@interface EmailSetting : UIViewController <UITableViewDelegate,UITableViewDataSource,UIPickerViewDelegate,UIPickerViewDataSource,UITextViewDelegate>{

	DataBase *objdatabase;
    
    IBOutlet UITableView *tblcontactset1;
    UISwitch *onoff;
    IBOutlet UIPickerView *pickerView1;
	
    NSMutableArray *arrlist;
    
    int selectedRow;

    Hiar_Style_NewAppDelegate *objappdel;
    
    IBOutlet UITextView *txtSignature;
    
    CGFloat animatedDistance;
    
    
    
}
- (void)scheduleNotificationWithItem:(NSDictionary*)item ;

-(IBAction)click;

-(IBAction)flip:(id)sender;



@end
