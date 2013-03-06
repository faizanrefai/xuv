//
//  Add_Service.h
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataBase.h"

@interface Add_Service : UIViewController<UIAlertViewDelegate,UITextFieldDelegate>{
	IBOutlet UIButton *btndone;
	IBOutlet UITextField *txtservicename;
	IBOutlet UITextField *txtprice;
	IBOutlet UIButton *btndelete;
	UIButton *doneButton;
    
    int k;

     UIView* keyboard;
    DataBase *objdatabase;
    
    
    
    
}
@property(nonatomic,retain)IBOutlet UITextField *txtservicename;
@property(nonatomic,retain)IBOutlet UITextField *txtprice;
- (void)addButtonToKeyboard; 


-(IBAction)deletedata;
-(IBAction)cancel;

-(IBAction)done:(id)sender;
-(IBAction)click;
@end
