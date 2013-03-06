//
//  Service_Listing.h
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCellImageViewTag		1000
#define kCellLabelTag			1001
#define kLabelIndentedRect2	CGRectMake(40.0, 12.0, 200.0, 20.0)
#define kLabelRect2			CGRectMake(15.0, 12.0, 200.0, 20.0)
#import "Client_History.h"
#define kNameValueTag 1
#define kColorValueTag 2
#import "Hiar_Style_NewAppDelegate.h"
#import "DataBase.h"
#import "Add_Service.h"
#import "Edit_Service.h"
@class Client_History_More;
#import <sqlite3.h>

@interface Service_Listing : UIViewController<UITableViewDelegate,UITableViewDataSource> {

	
    
    Client_History_More *objclient;
    
    Edit_Service *objEditService;
    
    Add_Service *objAddService;
    
    
    DataBase *objdatabase;
    NSMutableArray *arrservicelist;
    
    
    
    
    
    
	UIButton *myButton2;
	NSMutableArray *countries;
	NSMutableArray *selectedArray;
	BOOL inPseudoEditMode;
	
	UIImage *selectedImage;
	UIImage *unselectedImage;
	NSString *strname;
	NSString *strprice;
	NSString *strdate;
	NSString *strtotal;
	
	NSString *date1,*date2;
	int total;
	
	IBOutlet UITableView *tblservicelisting;
	NSArray *arr;
	UIButton *BtnPre;
	UIButton *BtnNxt;
	IBOutlet UILabel *lblcount;
	int i;
	IBOutlet UINavigationBar *navi;
	Hiar_Style_NewAppDelegate *objappdel;
	
    
    
	sqlite3 *database;
	NSString *databasename;
	NSString *databasepath;
    
    
}
@property(nonatomic,retain)UITableView *tblservicelisting;
@property(nonatomic,retain)UINavigationBar *navi;

@property (nonatomic, retain) NSMutableArray *countries;
@property (nonatomic, retain) NSMutableArray *selectedArray;
@property (nonatomic, retain) UIImage *selectedImage;
@property (nonatomic, retain) UIImage *unselectedImage;

@property BOOL inPseudoEditMode;

- (IBAction)doDelete;

- (void)populateSelectedArray;

-(void)showdata;

-(IBAction)buttonClicked2:(id)sender;

-(IBAction)done:(id)sender;
-(void)updateAddClientLastdate;

@end
