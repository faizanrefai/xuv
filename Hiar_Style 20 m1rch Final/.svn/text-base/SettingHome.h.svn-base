//
//  SettingHome.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"

#define kNameValueTag 1
#import "About_Hairworx.h"
@interface SettingHome : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource> {

	IBOutlet UIPickerView *picker;
    IBOutlet UIToolbar *picToolbar;
    
    IBOutlet UITableView *tblsetting;
		BOOL setting;
    UISwitch *onoff;
    UISwitch *onoff1;
    ContactSetting *objContactSetting;
    
    EmailSetting *objEmailSetting;
    
    About_Hairworx *objAbout_Hairworx;
    
    IBOutlet UITextField *myTextField;
    NSArray *arrlist;
    
    
	
}

-(IBAction)pickerDoneButtonTapped:(id)sender;
-(IBAction)searchResult1_clicked:(id)sender;
-(IBAction)flip:(id)sender;

@end
