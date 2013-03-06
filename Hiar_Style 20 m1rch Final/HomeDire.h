//
//  HomeDire.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


#import "Global.h"



#import "Edit_Directory.h"
#import "DataBase.h"

#import "ContactDetail.h"

@interface HomeDire : UIViewController<UISearchBarDelegate,UITabBarControllerDelegate,UITableViewDelegate,UITableViewDataSource,UITabBarDelegate> {

    SettingHome *objSetting;
    
    Edit_Directory *objEdit_Directory;
    
    NewContact *objNewContact;
    
    
    ContactDetail *objcontact;
    
    
    DataBase *objdatabase;
    
    
	
	IBOutlet UILabel *lblcount;
    IBOutlet UITabBarController *tab;
    
	  
	
	IBOutlet UITableView *tblDire;

    IBOutlet UISearchBar *search;
	IBOutlet UIToolbar *toolbar;
	
	UIButton *BtnPre;
	UIButton *BtnNxt;
	
   IBOutlet UINavigationBar *navi;
	
    UIButton *btnsettings;
	Hiar_Style_NewAppDelegate *objappdel;
    
    
    
    NSMutableArray *arrlistname;
    NSMutableArray *arrayOfCharacters;
    
    NSMutableDictionary *objectsForCharacters;
    
	int SearchTag;
    
    
    
    //IBOutlet UIBarButtonItem *btnedit;
    
    
    
}

@property(nonatomic,retain)UINavigationBar *navi;

-(void)seacrhDate:(NSString *)StrsearchValue;



-(void)showdata;

-(IBAction)back;


-(IBAction)searchResult1_clicked:(id)sender;	
-(IBAction)ButtonPressed:(id)sender;
-(IBAction)ButtonPressed1:(id)sender;

@end
