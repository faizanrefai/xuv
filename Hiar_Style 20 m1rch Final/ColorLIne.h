//
//  ColorLIne.h
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Hiar_Style_NewAppDelegate.h"
#import "DataBase.h"
#import "Add_Colorline.h"

@interface ColorLIne : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	
    
    DataBase *objdatabase;
    
	IBOutlet UITableView *tblcolorline;
	IBOutlet UIButton *myButton1;
	IBOutlet UIButton *myButton2;
	
    UIButton *BtnPre;
	UIButton *BtnNxt;
	
    
    IBOutlet UINavigationBar *navi;
	
    Hiar_Style_NewAppDelegate *objappdel;
	
    NSMutableArray *arrColorname;
    
    Add_Colorline *objColorLine;
    
    
    
    
    
		
}


@property(nonatomic,retain)UINavigationBar *navi;

- (IBAction)buttonClicked2:(id)sender;
-(IBAction)btnnxt;

@end
