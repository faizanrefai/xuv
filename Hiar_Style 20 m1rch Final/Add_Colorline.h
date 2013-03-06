//
//  Add_Colorline.h
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataBase.h"


@interface Add_Colorline : UIViewController <UITextFieldDelegate,UIAlertViewDelegate>{
		
    
    DataBase *objdatabase;
    
    
    
    IBOutlet UILabel *lbl1;
	IBOutlet UITextField *txtcolorname;
	
	
}
-(IBAction)done:(id)sender;
-(IBAction)back;
-(IBAction)click;

@end
