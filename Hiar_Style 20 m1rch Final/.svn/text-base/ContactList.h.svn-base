//
//  ContactList.h
//  Hiar_Style_New
//
//  Created by apple on 12/20/11.
//  Copyright 2011 354456. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "Hiar_Style_NewAppDelegate.h"
@interface ContactList : UIViewController<UISearchBarDelegate,
UITableViewDelegate,UITableViewDataSource> {
    sqlite3 *database;
    NSString *databaseName;
    NSString *databasePath;
    
    NSMutableArray *catchArray;
    NSMutableDictionary *temp;
    
    IBOutlet UITableView *tblDire;
    IBOutlet UISearchBar *search;
    UIButton *BtnPre;
    UIButton *BtnNxt;
    Hiar_Style_NewAppDelegate *objappdel;
 
}



@property (nonatomic,retain)NSMutableArray *catchArray;
-(void)showdata;
-(IBAction)back;

@end
