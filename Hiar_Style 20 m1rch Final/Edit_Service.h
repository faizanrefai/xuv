//
//  Edit_Service.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kNameValueTag 1
#import "DataBase.h"
#import "Hiar_Style_NewAppDelegate.h"
#import "Add_Service.h"
@interface Edit_Service : UIViewController <UITableViewDelegate,UITableViewDataSource>{

    
    DataBase *objdatabase;
    
    
	IBOutlet UITableView *tbleditservice;

	NSMutableArray *arrlistserviceName;
    
    
    NSArray *arr;
	Hiar_Style_NewAppDelegate *objappdel;
	
    
    Add_Service *objAddService;
    
    
    
}

-(void)showdata;



-(IBAction)done;
-(IBAction)back;

@end
