//
//  Client_History.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kNameValueTag 1
#define kColorValueTag 2
#define kpriceValueTag 3
#define kdateValueTag 4
#import "Hiar_Style_NewAppDelegate.h"
#define kimagevalue 5
#import "DataBase.h"
#import "Client_History_More.h"
@class Client_History_More;

@interface Client_History : UIViewController<UINavigationBarDelegate,UITabBarDelegate,UITableViewDelegate,UITableViewDataSource>{
	IBOutlet UITabBar *tab;
	IBOutlet UITableView *tblclienthistory;
		
	IBOutlet UINavigationBar *navi;
	IBOutlet  UIBarButtonItem *btnedit;
	Hiar_Style_NewAppDelegate *objappdel;

	DataBase *objdatabase;
    
    
    NSMutableArray *arrlistName;
    
    NSMutableArray *arrlistImage;
    
    
    
    
    
    
    
    
    NSString *imagename;
	
	UIImage *image;
	IBOutlet UIImageView *imgview;
	
    
    
    
    
    
    Client_History_More *objclientHistory;
    
    
    
}

-(void)showdata;
-(void)showimage:(NSString *)date;
-(UIImage *)resizeImage:(UIImage *)image3 width:(int)width height:(int)height;



-(IBAction)searchResult1_clicked:(id)sender;


@property(nonatomic,retain)UINavigationBar *navi;

@property(nonatomic,retain)UITableView *tblclienthistory;


@end
