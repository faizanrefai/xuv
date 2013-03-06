//
//  NewContact.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/12/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#import <sqlite3.h>
#import "Hiar_Style_NewAppDelegate.h"

@interface NewContact : UIViewController<UIAlertViewDelegate,UINavigationControllerDelegate,UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UITableViewDataSource,UITableViewDelegate> {
	Hiar_Style_NewAppDelegate *objappde;
	IBOutlet UIButton *btnimage;
	IBOutlet UITextField *txtbdate;
	BOOL im;
	
	IBOutlet UIScrollView *scrlview;
	IBOutlet UITextField *txtfname;
	IBOutlet UITextField *txtlname;
	IBOutlet UITextField *txtcmpn;
	IBOutlet UITextField *txthomenum;
	IBOutlet UITextField *txtmobnum;
	IBOutlet UITextField *txtemail;
	IBOutlet UITextField *txtnotes;
	IBOutlet UITextField *txtadd;
	sqlite3 *database;
	IBOutlet UIImageView *imageView;
	
	NSString *picname1,*picname;
	NSMutableString *str;
	CGFloat animatedDistance;
	BOOL checkFlag;
	NSString *date1,*date2;
    IBOutlet UIToolbar *datepickertoolbar;
    
	
		UITableView *myTableView;
	NSMutableArray *tableViewData;
	BOOL shouldPushAnotherView;
	NSString *reminder;
	IBOutlet UILabel *reminder1;
    UIButton *doneButton;
    NSString *strdatepicker;
    
    int k;
  	UIDatePicker *myPicker;
    
    
    BOOL Camera;
    BOOL Library;
    
    NSString *dataFilePath;
    
    int donevalue;
    
    // table view
    IBOutlet UITableView *tblviewAddContect;

    
}
-(UIImage *)resizeImage:(UIImage *)image width:(int)width height:(int)height ;

-(IBAction)DoneDate;
@property(nonatomic,retain)UIScrollView *scrlview;
-(IBAction)click;
-(IBAction)done;
- (void)addButtonToKeyboard; 

-(IBAction) backgroundClick:(id)sender;
-(IBAction)TakeButton:(id)sender;

-(IBAction)searchResult1_clicked:(id)sender;

@end
