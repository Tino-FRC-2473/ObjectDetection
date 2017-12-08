package Utility;

import java.io.File;

public class RemoveExtraFiles {

	//end result is that dirExtra has all the files that dirVal already has 
	//extra files are deleted
	private File[] dirExtra;
	private File[] dirVal;

	public static void main (String args[]){
		String dir1 = "/Users/ethansoo/Desktop/hasDuplicates"; //has extra files
		String dir2 = "/Users/ethansoo/Desktop/validation";
		RemoveExtraFiles sys = new RemoveExtraFiles(dir1, dir2);
		sys.deleteExtra();
	}

	//input 2 strings
	// 1. First parameter is directory folder of extra files
	// 2. Second parameter is directory for validation to check for extra files
	public RemoveExtraFiles(String dirExtra, String dirVal){
		this.dirExtra = new File(dirExtra).listFiles();
		this.dirVal = new File(dirVal).listFiles();
	}

	public void deleteExtra(){
		int i = 0;
		boolean matchFound;
		while (i < dirExtra.length){
			matchFound = false;
			for (int j = 0; j < dirVal.length; j++){
				//if folder names match
				if ( doesMatch(dirExtra[i].getName(), dirVal[j].getName()) ){

					//match found, good to go
					matchFound = true;
					break;
				}	
			}

			//if match was not found then delete file
			if (!matchFound){
				System.out.println("delete");
				//				if (!dirExtra[i].delete()){
				//					System.out.println("Deleting was unsuccessful.");
				//				}
			}
			else {
				i++;
			}
			System.out.println("i" + i);
		}

	}

	//See if the two file directory paths have the same name
	// **Ignores everything after "."
	//Doesn't check type of file (.txt, .jpg, etc.)
	public boolean doesMatch(String fileName, String fileNameVal){

		if (fileName.indexOf(".") != -1){
			fileName = fileName.substring(0, fileName.indexOf("."));
			System.out.println("1: " + fileName);
		}
		if (fileNameVal.indexOf(".") != -1){
			fileNameVal = fileNameVal.substring(0, fileNameVal.indexOf("."));
			System.out.println("2: " + fileNameVal);
		}
		return (fileName == fileNameVal);
	}
}