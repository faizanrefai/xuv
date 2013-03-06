//
//  UpdateClientDetail.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "Hiar_Style_NewAppDelegate.h"
#import "DataBase.h"
@interface UpdateClientDetail : UIViewController<UINavigationControllerDelegate,UITextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate> {

	NSString *picname1,*picname;
	NSMutableString *str;
	CGFloat animatedDistance;
	BOOL checkFlag;
	NSString *date1,*date2;
	
	IBOutlet UIButton *btnimage;
	
	Hiar_Style_NewAppDelegate *objappdel;
	
	IBOutlet UITextField *txtbdate;
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
	
	
	NSString *databaseName;
	NSString *databasePath;
	
	
    NSString *imagename;
	NSMutableArray *catchArrayImage;
	NSMutableDictionary *temp1;
	UIImage *image;
	IBOutlet UIImageView *imgview;
    int k;
    
    DataBase *objdatabase;
    NSMutableArray *arrlistClient;
    
    
    IBOutlet UIToolbar *datepickertoolbar;
    
    UIButton *doneButton;
    NSString *strdatepicker;
    UIDatePicker *myPicker;
  

	
}
-(UIImage *)resizeImage:(UIImage *)image3 width:(int)width height:(int)height;
  -(IBAction)DoneDate;
-(void)showdata;
-(IBAction)update;
-(IBAction)click;
- (void)addButtonToKeyboard;

-(IBAction)TakeButton:(id)sender;
-(IBAction)cancel;

@end
