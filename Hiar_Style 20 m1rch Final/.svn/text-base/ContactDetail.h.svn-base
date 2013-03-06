//
//  ContactDetail.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVFoundation.h>
#import "Global.h"
#import "DataBase.h"


#import "UpdateClientDetail.h"
#import "TableCell.h"

static inline double radians (double degrees) {
    return degrees * M_PI/180;
}

@interface ContactDetail : UIViewController <UITabBarDelegate,UITableViewDelegate,UITableViewDataSource>{

    IBOutlet UITableView *tblContactDetail;
    IBOutlet TableCell *tblViewCell;
    
	IBOutlet UIScrollView *scrlview;
	IBOutlet UITabBar *tabhistory;
	//IBOutlet UITableViewCell *tbl;
	
    UIButton *BtnPre;
	UIButton *BtnNxt;
	
    IBOutlet UILabel *lblfname;
	IBOutlet UILabel *lbllname;
	IBOutlet UILabel *lblcmpn;
	IBOutlet UILabel *lblhomenum;
	IBOutlet UILabel *lblmobnum;
	IBOutlet UILabel *lbladd;
	IBOutlet UILabel *lblemail;
	IBOutlet UILabel *lblnotes;
	UpdateClientDetail *objupdate;
    
	
    
    IBOutlet UILabel *lblbdate;
	
	
    NSString *imagename;
	
	IBOutlet UIImageView *img;
	
	Hiar_Style_NewAppDelegate *objappdel;
	UIImage *image;
	IBOutlet UIImageView *imgview;
    IBOutlet UIButton *btnimage;
    
    
    
    NSMutableArray *arrlist;
    DataBase *objdatabase;
    
    
    
}
-(void)showdata;
-(UIImage *)resizeImage:(UIImage *)image3 width:(int)width height:(int)height;

@property(nonatomic,retain)UILabel *lblfname;
@property(nonatomic,retain)UILabel *lbllname;
@property(nonatomic,retain)UILabel *lblcmpn;
@property(nonatomic,retain)UILabel *lblhomenum;
@property(nonatomic,retain)UILabel *lblmobnum;
@property(nonatomic,retain)UILabel *lbladd;
@property(nonatomic,retain)UILabel *lblemail;

@property(nonatomic,retain)UILabel *lblnotes;

-(IBAction)searchResult1_clicked:(id)sender;
-(IBAction)edit;

@end
