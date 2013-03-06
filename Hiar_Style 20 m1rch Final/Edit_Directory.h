//
//  Edit_Directory.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kCellImageViewTag		1000
#define kCellLabelTag			1001

#define kLabelIndentedRect1	CGRectMake(40.0, 12.0, 275.0, 20.0)
#define kLabelRect1			CGRectMake(15.0, 12.0, 275.0, 20.0)
#import "Hiar_Style_NewAppDelegate.h"
#import <sqlite3.h>



#import "DataBase.h"



@interface Edit_Directory : UIViewController<UITableViewDelegate,UITableViewDataSource> {

	
    DataBase *objdatabase;
    
    
    IBOutlet UITableView *tblDire;
	UIButton *myButton2;
	NSMutableArray *countries;
	NSMutableArray *selectedArray;
	BOOL inPseudoEditMode;
	IBOutlet UIBarButtonItem *btndelete;
	NSString *fileName;
	UIImage *selectedImage;
	UIImage *unselectedImage;
	Hiar_Style_NewAppDelegate *objappdel;
	sqlite3 *database;
	NSString *databaseName;
	NSString *databasePath;
	
	NSMutableArray *catchArray;
	NSMutableDictionary *temp;
	NSMutableArray *catchArray1;
	NSMutableDictionary *temp1;
	
	int clientid;
	
}
@property (nonatomic, retain) NSMutableArray *countries;
@property (nonatomic, retain) NSMutableArray *selectedArray;
@property(nonatomic,retain)UITableView *tblDire;
@property (nonatomic, retain) UIImage *selectedImage;
@property (nonatomic, retain) UIImage *unselectedImage;

@property BOOL inPseudoEditMode;

- (IBAction)togglePseudoEditMode;
- (IBAction)doDelete;

- (void)populateSelectedArray;

-(void)showdata;
-(void)showimage;
-(IBAction)cancel:(id)sender;


@end
