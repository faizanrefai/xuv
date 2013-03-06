//
//  Client_History_More.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hiar_Style_NewAppDelegate.h"
#define kNameValueTag 1
#import "TableCell.h"
#import "DataBase.h"
#import "Service_Listing.h"
#import "Formulla.h"
#import "Repeat_Service.h"
@class Repeat_Service;
#import <sqlite3.h>

@interface Client_History_More : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UITableViewDelegate,UITableViewDataSource,UITabBarDelegate> {
	
    sqlite3 *database;
    
    DataBase *objdatabase;
    NSMutableArray *arrlistservice;
    NSMutableArray *arrliformula;
    NSMutableArray *arrliimage;
    
    Service_Listing *objservice;
    Formulla *objFormulla;
    
    Repeat_Service *objRepeatService;
    
    
    IBOutlet UITabBar *tab;
	
    IBOutlet UIScrollView *scrl;
	
    IBOutlet UITableView *tblservice;
	
    IBOutlet UITableView *tblform;
	
        IBOutlet TableCell *tblViewCell;
	
	int val;
	
	Hiar_Style_NewAppDelegate *objappdel;

	IBOutlet UILabel *lblname;
	
	IBOutlet UILabel *lbldate;
	IBOutlet UILabel *lblvalue;
	IBOutlet UILabel *lblvalue1;
	IBOutlet UILabel *lblvalue2;
	IBOutlet UILabel *lblvalue3;
	IBOutlet UILabel *lblvalue4;
	IBOutlet UILabel *lblvalue5;
	
    NSArray *arr;
	
	NSString *str;
	
	NSString *str1;
	
	NSString *str2;
	
	NSString *str3;
	
	NSString *str4;
	
    IBOutlet UIImageView *imageView;
	
	NSString *picname1,*picname;
	NSString *date1,*date2;
	NSString *imagename;
	
    
	IBOutlet UIButton *btnimage1;
	IBOutlet UIButton *btnimage2;
	IBOutlet UIButton *btnimage3;
	
    
    int total;
    
    int tot;

	UIImage *image;
	IBOutlet UILabel *frml;
	IBOutlet UIButton *btnfrml;
	BOOL lbl;
    UILabel *label2;
    
    BOOL Camera;
    BOOL Library;
    IBOutlet UIBarButtonItem *btnedit;
    
}
-(UIImage *)resizeImage:(UIImage *)image width:(int)width height:(int)height;
-(void)updateFavorite;

-(void)showdata;
-(void)showformula;
-(void)saveimage;
-(void)showimage;
@property (nonatomic,retain) TableCell *tblViewCell;


@property(nonatomic,retain)IBOutlet UIScrollView *scrl;

-(IBAction)Add_Photo:(id)sender;
-(IBAction)View_Photo:(id)sender;

-(IBAction)select_service:(id)sender;
-(IBAction)select_formula:(id)sender;
-(IBAction)back;

-(IBAction)option:(id)sender;
@end
