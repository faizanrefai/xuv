//
//  Add_Service.m
//  HairStyleProj
//
//  Created by Vivek Rajput on 8/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Add_Service.h"
#import "Repeat_Service.h"
#import "Edit_Service.h"
#import "Service_Listing.h"
#import "Hiar_Style_NewAppDelegate.h"
@implementation Add_Service
@synthesize txtservicename,txtprice;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


-(IBAction)click{
	

}
-(IBAction)done:(id)sender{
	
	if([txtservicename.text isEqualToString:@""])
	   {
	   
	   
		   UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Enter Service Name" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
		   
		   [alert1 show];
		   [alert1 release];
		   
	   }
	
	else if ([txtprice.text isEqualToString:@""]) {
		UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"" message:@"Please Enter Price" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
		
		[alert1 show];
		[alert1 release];
		
	}
	else {
		[objdatabase InsertintoService:txtservicename.text :txtprice.text];
        
        
    
        
	txtprice.text=@"";
    txtservicename.text=@"";
    [txtprice resignFirstResponder];
    [txtservicename resignFirstResponder];
         doneButton.hidden=TRUE;
    }
	
	
}
-(IBAction)cancel{
	
//    for(id view in [self.view subviews])
//    {
//        if([view isKindOfClass:[UILabel class]])
//        {
//            UILabel *tempLable = (UILabel*)view;
//            
//            tempLable.font =[UIFont fontWithName:@"Ariral" size:12.0];
//            
//            
//        }
//    }
//
//
    
    [doneButton setImage:nil forState:UIControlStateNormal];
    
    [txtprice resignFirstResponder];
	[txtservicename resignFirstResponder];
     doneButton.hidden=TRUE;
    [self.navigationController popViewControllerAnimated:YES];
    
	
}
-(void)viewWillAppear:(BOOL)animated    {


    Hiar_Style_NewAppDelegate *obj=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
	
	
	
	if([obj.strname isEqualToString:@"edit"])
        
	{
		btndone.hidden=TRUE;
		btndelete.hidden=FALSE;
		txtprice.text=obj.strprice;
		txtservicename.text=obj.strservicename;
		
        
	}
	else
    {
		btndone.hidden=FALSE;
		btndelete.hidden=TRUE;
		txtprice.text=@"";
		txtservicename.text=@"";
		
		
	}

}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];

	self.navigationController.navigationBar.tintColor=[UIColor blackColor];
	self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    self.navigationController.navigationBar.hidden=TRUE;
	
    objdatabase=[[DataBase alloc]init];
    
	
	btndone.hidden=TRUE;
	btndelete.hidden=TRUE;
	
    txtprice.text=@"";
	txtservicename.text=@"";
	
    
	
    
    

}

-(IBAction)deletedata
{
		Hiar_Style_NewAppDelegate *objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
	
//	int deleteid;
//	deleteid=[objappdel.strserviceid intValue];
//	
    
    [objdatabase DeleteData:@"Add_Service" :@"ASID" :objappdel.strserviceid];
    txtprice.text=@"";
    txtservicename.text=@"";
	
    
    
	}	
- (void)keyboardWillShow:(NSNotification *)note {
	// if clause is just an additional precaution, you could also dismiss it
	if ([[[UIDevice currentDevice] systemVersion] floatValue] < 3.2) {
		[self addButtonToKeyboard];
	}
}

- (void)keyboardDidShow:(NSNotification *)note {
	// if clause is just an additional precaution, you could also dismiss it
	if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
		[self addButtonToKeyboard];
    }
}
- (void)addButtonToKeyboard {
	// create custom button
    
    if(k==1)
    {
        
        
        doneButton = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
        doneButton.frame = CGRectMake(0, 163, 106, 53);
        doneButton.adjustsImageWhenHighlighted = NO;
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.0) {
            [doneButton setImage:[UIImage imageNamed:@"DoneUp3.png"] forState:UIControlStateNormal];
            [doneButton setImage:[UIImage imageNamed:@"DoneDown3.png"] forState:UIControlStateHighlighted];
        } else {        
            [doneButton setImage:[UIImage imageNamed:@"DoneUp.png"] forState:UIControlStateNormal];
            [doneButton setImage:[UIImage imageNamed:@"DoneDown.png"] forState:UIControlStateHighlighted];
        }
        [doneButton addTarget:self action:@selector(doneButton:) forControlEvents:UIControlEventTouchUpInside];
        // locate keyboard view
        UIWindow* tempWindow = [[[UIApplication sharedApplication] windows] objectAtIndex:1];
       
        for(int i=0; i<[tempWindow.subviews count]; i++) {
            keyboard = [tempWindow.subviews objectAtIndex:i];
            // keyboard found, add the button
            if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
                if([[keyboard description] hasPrefix:@"<UIPeripheralHost"] == YES)
                    [keyboard addSubview:doneButton];
            } else {
                if([[keyboard description] hasPrefix:@"<UIKeyboard"] == YES)
                    [keyboard addSubview:doneButton];
            }
        }
        
    }
    else{
        [doneButton release];
        doneButton=nil;
    }
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    
    
    
    if(textField==txtprice)
    {
        [txtservicename resignFirstResponder];
        
        
        k=1;
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 3.2) {
            [[NSNotificationCenter defaultCenter] addObserver:self 
                                                     selector:@selector(keyboardDidShow:) 
                                                         name:UIKeyboardDidShowNotification 
                                                       object:nil];		
        } else {
            [[NSNotificationCenter defaultCenter] addObserver:self 
                                                     selector:@selector(keyboardWillShow:) 
                                                         name:UIKeyboardWillShowNotification 
                                                       object:nil];
        }
        
        
    }
    else{
        k=0;
        [txtprice resignFirstResponder];
        [doneButton release];
        doneButton=nil;
        
     //   doneButton.frame = CGRectMake(0, 172, 100, 40);
        
    }
    return YES;
    
}
-(void)viewWillDisappear:(BOOL)animated {
        
    k=0;
    
}
- (void)doneButton:(id)sender
{
    
//   
    [txtprice resignFirstResponder];
    [txtservicename resignFirstResponder];
    
    
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
     [objdatabase release];
}


@end
