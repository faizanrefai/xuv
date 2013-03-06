//
//  UpdateClientDetail.m
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UpdateClientDetail.h"
#import "ContactDetail.h"

static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;

@implementation UpdateClientDetail

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

-(void)viewWillAppear:(BOOL)animated{

    objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
	[objappdel createEditableCopyOfDatabaseIfNeeded];
	
	[scrlview setScrollEnabled:YES];
	[scrlview setContentSize:CGSizeMake(320, 550)];
	self.navigationController.navigationBar.hidden=TRUE;
	
	
	self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
	
    arrlistClient=[[NSMutableArray alloc]init];
                   
    objdatabase=[[DataBase alloc]init];
    
    
    
    
    
	[self showdata];
	
	
	
	txtfname.text=[(NSDictionary *)[arrlistClient objectAtIndex:0]valueForKey:@"name"];
	txtlname.text=[(NSDictionary *)[arrlistClient objectAtIndex:0]valueForKey:@"lname"];
	txtcmpn.text=[(NSDictionary *)[arrlistClient objectAtIndex:0]valueForKey:@"cmpnname"];
	txthomenum.text=[(NSDictionary *)[arrlistClient objectAtIndex:0]valueForKey:@"homenum"];
	txtmobnum.text=[(NSDictionary *)[arrlistClient objectAtIndex:0]valueForKey:@"mobnum"];
	txtadd.text=[(NSDictionary *)[arrlistClient objectAtIndex:0]valueForKey:@"add"];
	txtemail.text=[(NSDictionary *)[arrlistClient objectAtIndex:0]valueForKey:@"email"];
	txtnotes.text=[(NSDictionary *)[arrlistClient objectAtIndex:0]valueForKey:@"notes"];
	txtbdate.text=[(NSDictionary *)[arrlistClient objectAtIndex:0]valueForKey:@"date"];
    
    
    
    NSString *imageString=[[arrlistClient objectAtIndex:0]valueForKey:@"image"];
    
    
    
	if(imageString==nil||[imageString isEqualToString:@"(null"] || [imageString isEqualToString:@""]){
        
	}
    else {
        
        
        NSArray *dirArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,    NSUserDomainMask, YES);
        NSString *path = [NSString stringWithFormat:@"%@/%@", [dirArray objectAtIndex:0],[(NSDictionary *)[arrlistClient objectAtIndex:0]valueForKey:@"image"]];
        
        NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]];
        image = [[UIImage alloc] initWithData:imageData];
        
        //[btnimage setImage:image forState:UIControlStateNormal];
        
        [btnimage setImage:[self resizeImage:image width:image.size.width height:image.size.height]  forState:UIControlStateNormal];
       
        if(image.imageOrientation==UIImageOrientationRight)
        {
            
            btnimage.transform=CGAffineTransformMakeRotation(M_PI / 2);
            
            
            
        }
        
        else{
            
            btnimage.transform=CGAffineTransformMakeRotation(M_PI * 2 );
            
            
        }
        
        picname=[(NSDictionary *)[arrlistClient objectAtIndex:0]valueForKey:@"image"];
        
        [imageData release];
        [image release];
        image=nil;
        
        
    }
    
    
    

}
-(void)viewWillDisappear:(BOOL)animated {

    k=0;
    
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    datepickertoolbar.hidden=TRUE;
    
    CGRect pickerFrame = CGRectMake(0,250,0,0);
    
    myPicker = [[UIDatePicker alloc] initWithFrame:pickerFrame];
    
    myPicker.datePickerMode=UIDatePickerModeDate;
    
    
    [myPicker addTarget:self action:@selector(pickerChanged:)forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:myPicker];
    
    [myPicker release]; 
    myPicker.hidden=TRUE;
    
	
}


-(IBAction)DoneDate{
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc]init]autorelease];
	
	[dateFormatter setDateFormat:@"yyyy-MM-dd"];
	txtbdate.text = [dateFormatter  stringFromDate:myPicker.date];
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.3];
	datepickertoolbar.frame = CGRectMake(0, 500, 320, 40);
	myPicker.frame = CGRectMake(0,480, 320, 216);
	[UIView commitAnimations];
    
    
    
}
- (void)pickerChanged:(id)sender
{
    NSLog(@"value: %@",[sender date]);
    
    // strdatepicker=[NSString string:@"%@",[sender date]];
    
}

-(IBAction)cancel{
	[self.navigationController popViewControllerAnimated:YES];
    


}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    
    if(textField == txtbdate)
	{   
        
        [txtadd resignFirstResponder];
        [txtcmpn resignFirstResponder];
        [txtemail resignFirstResponder];
        [txtfname resignFirstResponder];
        [txtlname resignFirstResponder];
        [txthomenum resignFirstResponder];
        [txtmobnum resignFirstResponder];
        [txtnotes resignFirstResponder];
        [txtbdate resignFirstResponder];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        
        myPicker.frame = CGRectMake(0,250, 320, 216);
        datepickertoolbar.frame=CGRectMake(0, myPicker.frame.origin.y-50.0f, 320, 50);
        
        
        [UIView commitAnimations];
        myPicker.hidden=FALSE;
        
        datepickertoolbar.hidden=FALSE;
        return NO;
        
	}
    
    
    
    
    if((textField==txtmobnum)||(textField==txthomenum))
    {
        [txtbdate resignFirstResponder];
        
        
        [txtadd resignFirstResponder];
        [txtcmpn resignFirstResponder];
        [txtemail resignFirstResponder];
        [txtfname resignFirstResponder];
        [txtlname resignFirstResponder];
        
        [txtnotes resignFirstResponder];
        
        
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
        [txthomenum resignFirstResponder];
        [txtmobnum resignFirstResponder];
        k=0;
        
        doneButton.hidden=TRUE;
        
        
    }
    
    return YES;
    
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
        UIView* keyboard;
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
}
- (void)doneButton:(id)sender
{
    [txtmobnum  resignFirstResponder];
    [txthomenum resignFirstResponder];
    
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField;        
{	
	CGRect textFieldRect =[self.view.window convertRect:textField.bounds fromView:textField];
	CGRect viewRect =[self.view.window convertRect:self.view.bounds fromView:self.view];
	
	CGFloat midline = textFieldRect.origin.y +1.0 * textFieldRect.size.height;
	CGFloat numerator =midline - viewRect.origin.y- MINIMUM_SCROLL_FRACTION * viewRect.size.height;
	CGFloat denominator =(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)* viewRect.size.height;
	CGFloat heightFraction = numerator / denominator;
	
	animatedDistance = floor(162.0 * heightFraction);
	
	CGRect viewFrame =scrlview.frame;
	
	//self.view.frame;
	
	viewFrame.origin.y -= animatedDistance;
	
	[UIScrollView beginAnimations:nil context:NULL];
	[UIScrollView setAnimationBeginsFromCurrentState:YES];
	[UIScrollView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
	
	[scrlview setFrame:viewFrame];
	
	[UIScrollView commitAnimations];
	
		
}	

- (void)textFieldDidEndEditing:(UITextField *)textField
{
	
	CGRect viewFrame = scrlview.frame;
	
	//self.view.frame;
	viewFrame.origin.y += animatedDistance;
	
	[UIScrollView beginAnimations:nil context:NULL];
	[UIScrollView setAnimationBeginsFromCurrentState:YES];
	[UIScrollView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
	
	[scrlview setFrame:viewFrame];
	
	[UIScrollView commitAnimations];
	
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event 
{ 
	[txtbdate resignFirstResponder];
	
	
	[txtadd resignFirstResponder];
	[txtcmpn resignFirstResponder];
	[txtemail resignFirstResponder];
	[txtfname resignFirstResponder];
	[txtlname resignFirstResponder];
	[txthomenum resignFirstResponder];
	[txtmobnum resignFirstResponder];
	[txtnotes resignFirstResponder];
	
	
	[super touchesBegan:touches withEvent:event]; 
} 
-(IBAction)TakeButton:(id)sender
{
    
    checkFlag=FALSE;
    
	UIActionSheet *actionsheet=[[UIActionSheet alloc] initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take Photo or Video",@"Choose from Library",nil];
	
	[actionsheet showInView:self.parentViewController.tabBarController.view];
    
	
	[actionsheet release];
}

- (void) actionSheet:(UIActionSheet *)actionsheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	// After saving iamge, dismiss camera
	if(!checkFlag)
    {
	if (buttonIndex == 0) {
		UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
		imagePicker.delegate = self;
		if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        else {
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        }
        imagePicker.editing=NO;
		
		[self presentModalViewController:imagePicker animated:YES];
		
		[imagePicker release];
	}        
	if(buttonIndex ==1) {
		UIImagePickerController *picker;
		picker = [[UIImagePickerController alloc]init];
		picker.delegate = self;
		picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		picker.editing=NO;
		
		
		[self presentModalViewController:picker animated:YES];
	}	
	
	[self dismissModalViewControllerAnimated:YES];	

    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
        
    }

}




-(void)showdata{
	NSString *s = [NSString stringWithFormat:@"WHERE Cid=%@",objappdel.idvalue];
    
    
    [objdatabase ShowDataForClientname:s];
    [arrlistClient addObjectsFromArray:objdatabase.catchArray];
    
	
	
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
	[picker dismissModalViewControllerAnimated:YES];
	imageView.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
	imageView.hidden = TRUE;
	//	NSString *date1,*date2;
	//	NSString *picname1,*picname;
	NSDate *date = [NSDate date];
	NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
	[formatter setDateFormat:@"MMddYYHHMMSS"];
	date1= [formatter stringFromDate:date];
	date2=[date1 stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	picname1=[@"image" stringByAppendingString:date2];
	picname=[[picname1 stringByAppendingString:@".jpg"]retain];
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *dataFilePath = [[documentsDirectory stringByAppendingPathComponent:picname] retain];
    [UIImageJPEGRepresentation(imageView.image, 1.0) writeToFile:dataFilePath atomically:YES];
    
    //[UIImagePNGRepresentation(imageView.image) writeToFile:dataFilePath atomically:YES ];
	
    [btnimage setImage:imageView.image forState:UIControlStateNormal];
    
    
    //[btnimage setImage:[self resizeImage:imageView.image  width:imageView.frame.size.width height:imageView.frame.size.height] forState:UIControlStateNormal];
    
	
    [dataFilePath release];
    
    
    
	//NSArray *myArray = [dataFilePath componentsSeparatedByString: @"/"];
	//	NSString *fileName = (NSString*)[myArray lastObject];
	//	//nslog(@"%@",fileName);
	//	
	//	[str appendString:@","];
	//	[str appendString:fileName];
	//	
	//	NSArray *fileArray = [str componentsSeparatedByString:@","];
	//	//	NSArray *fileArray = [str stringByTrimmingCharactersInSet: @"/"];
	//	
	//	//nslog(@"Arrar : %@",fileArray);
	//	//nslog(@" str : %@",str);
	
}	

-(UIImage *)resizeImage:(UIImage *)image3 width:(int)width height:(int)height {
    
    CGImageRef imageRef = [image3 CGImage];
	CGImageAlphaInfo alphaInfo = CGImageGetAlphaInfo(imageRef);
	
	//if (alphaInfo == kCGImageAlphaNone)
    alphaInfo = kCGImageAlphaNoneSkipLast;
	
	CGContextRef bitmap = CGBitmapContextCreate(NULL, width, height, CGImageGetBitsPerComponent(imageRef), 4 * width, CGImageGetColorSpace(imageRef), alphaInfo);
	CGContextDrawImage(bitmap, CGRectMake(0, 0, width, height), imageRef);
	CGImageRef ref = CGBitmapContextCreateImage(bitmap);
	UIImage *result = [UIImage imageWithCGImage:ref];
	
	CGContextRelease(bitmap);
	CGImageRelease(ref);
	
	return result;	
    
}

-(IBAction)update{

	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Hairstyle.sqlite"];
	
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		int ia;
		ia=[objappdel.idvalue intValue];
		//nslog(@"%d",ia);
		
		static sqlite3_stmt *statement;
		statement = nil;
		
		NSString *sql=[NSString stringWithFormat:@"update AddClient set Image=?,First_Name=?,Last_Name=?,Company=?,Home_Phone=?,Mobile_Phone=?,Address=?,Email=?,Notes=?,Date=? where Cid=%d",ia ];
		
		if(sqlite3_prepare_v2(database, [sql UTF8String] , -1, &statement, NULL) == SQLITE_OK)
		{
			
			sqlite3_bind_text(statement, 1, [picname UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 2, [txtfname.text UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 3, [txtlname.text UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement,  4, [txtcmpn.text UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 5, [txthomenum.text UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 6, [txtmobnum.text UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 7, [txtadd.text UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 8, [txtemail.text UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 9, [txtnotes.text UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 10, [txtbdate.text UTF8String], -1, SQLITE_TRANSIENT);
			
			
			txtadd.text=@""; 
			txtcmpn.text=@"";
			txtemail.text=@"";
			txtfname.text=@"";
			txtlname.text=@"";
			txthomenum.text=@"";
			txtmobnum.text=@"";
			txtnotes.text=@"";
			txtbdate.text=@"";
			
                       
		}
		else
		{
			
			NSAssert1(0, @"Error while creating insert statement. '%s'", sqlite3_errmsg(database));
		}
		
		if(sqlite3_step(statement) == SQLITE_DONE) 
		{
			sqlite3_finalize(statement);
			
			
		}
		else
		{
			NSAssert1(0, @"Error while inserting. '%s'", sqlite3_errmsg(database));
		}
		sqlite3_close(database);
		
	}
	else 
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}
	
	

	[txtbdate resignFirstResponder];
	
	
	[txtadd resignFirstResponder];
	[txtcmpn resignFirstResponder];
	[txtemail resignFirstResponder];
	[txtfname resignFirstResponder];
	[txtlname resignFirstResponder];
	[txthomenum resignFirstResponder];
	[txtmobnum resignFirstResponder];
	[txtnotes resignFirstResponder];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Updated" message:@"Data Are Updated" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];	
    [alert show];
    [alert release];
checkFlag=TRUE;
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(IBAction)click{}



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

	[catchArrayImage release];
    [objdatabase release];
    
    [arrlistClient release];
    
}


@end
