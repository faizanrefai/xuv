//
//  En_Large_Image.h
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hiar_Style_NewAppDelegate.h"
#import "DataBase.h"
#import "JSONParser.h"
#import "JSON.h"
#import <sqlite3.h>

@interface En_Large_Image : UIViewController <UIActionSheetDelegate>{
	IBOutlet UIImageView *imgdisplay;
    sqlite3 *database;
    
	Hiar_Style_NewAppDelegate *objappdel;
	DataBase *objdatabase;
    
    NSString *path;
    
	UIImage *image;
	NSString *Imageid;
    NSString *imageName;
    
	int i;
	IBOutlet UILabel *lblnum;
	IBOutlet UILabel *lblcount;
    
    NSMutableArray *arrimages;
	
	NSString *StrImageCode3;
    NSString *strEmail;
    IBOutlet UIBarButtonItem *btnprev;
    IBOutlet UIBarButtonItem *btnnext;
    
}
-(void)showimage;

-(UIImage *)resizeImage:(UIImage *)image3 width:(int)width height:(int)height;

-(IBAction)back;

-(IBAction)next:(id)sender;
-(IBAction)mail:(id)sender;
-(IBAction)delete_image:(id)sender;
-(IBAction)prev:(id)sender;

@end
