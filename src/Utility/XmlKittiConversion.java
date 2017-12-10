package Utility;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;

/*
 * Instructions:
 * 
 * In the main method, when creating the Main object, pass in two strings:
 *     String 1: The path to the folder with the xml files from RectLabel
 *     String 2: The path to the empty output folder where the kitti files will gp
 */

public class XmlKittiConversion {

    private static File xmlRootFolder;
    private static File kittiOutputFolder;
    
    private static String objectName = "";
    private static String s1 = " 0.0 0 0.0 ";
    private static String s2 = "0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0";
    
    //constructor for the XmlKittiConversion
    public XmlKittiConversion (String inputPath, String outputPath){
        xmlRootFolder = new File(inputPath);
        kittiOutputFolder = new File(outputPath);
    }

    public static void main(String[] args){
    	// Replace the code here with the paths to the folders on your computer
    	XmlKittiConversion main = new XmlKittiConversion("/Users/work/Desktop/EthansXMLstuff",
    			"/Users/work/Desktop/annotations_101");
        main.convertAllFiles();
    }
    
    //converts all files to kitti
    public void convertAllFiles(){
        System.out.println(xmlRootFolder.isDirectory());
    	File[] xmlFiles = xmlRootFolder.listFiles();
        //for each file
        for(File xml : xmlFiles){
            //check if it is a xml file
        	if(xml.toString().endsWith(".xml")){
                
        		File kittiFile = new 
        				File(kittiOutputFolder.toString() + "/" 
        						+ xml.getName().substring(0, xml.getName().indexOf(".xml")) 
        						+ ".txt");
                write(xml, kittiFile);
            }
        }
    }
    
    
    public void write(File xmlRootFile, File kittiOutputFile){
        try{
            InputStream is = new FileInputStream(xmlRootFile);
            InputStreamReader isr = new InputStreamReader(is);
            BufferedReader br = new BufferedReader(isr);

            OutputStream os = new FileOutputStream(kittiOutputFile);
            OutputStreamWriter osw = new OutputStreamWriter(os);
            PrintWriter pw = new PrintWriter(osw);

            String input = "";
            String line = "";
            
            //writes the entire file into an input string
            while(true){
                line = br.readLine();
                if(line == null) break;
                input += line;
            }
            
            //uses the convert method to ?????
            ArrayList<String> labels = convert(input);
            for(int i = 0; i<labels.size(); i++){
                pw.println(labels.get(i));
            }

            br.close();
            pw.flush();
            pw.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    private static ArrayList<String> convert(String input){
        ArrayList<String> labels = new ArrayList<String>();
        String keyWord_label = "<name>";
        String keyWord_dim = "<bndbox>";
        
        
        
        //while the string input contains the keyword
        while(input.contains(keyWord_label)){
        	objectName = "";
        	//finds index of keyWord_label
        	int labelIndex = input.indexOf(keyWord_label);
        	input = input.substring(labelIndex); 
        	
        	objectName = itemInsideTags(input);
        	
        	System.out.println(objectName);
        	
        	//finds index of keyWord_dim
            int dimIndex = input.indexOf(keyWord_dim);
            
            
            //sets the input into the substring of the input
            input = input.substring(dimIndex + keyWord_dim.length());
            
            System.out.println(input.substring(0,5));
            
            ArrayList<Float> dimens = new ArrayList<Float>();
            
            dimens.add((float) Integer.parseInt(itemInsideTags(input, "xmin")));
            dimens.add((float) Integer.parseInt(itemInsideTags(input, "ymin")));
            dimens.add((float) Integer.parseInt(itemInsideTags(input, "xmax")));
            dimens.add((float) Integer.parseInt(itemInsideTags(input, "ymax")));
            
            String label = objectName + s1;
            
            for(float d:dimens){
            	label+=d + " ";
            }
            
            labels.add(label + s2);
        }
        
        System.out.println(labels);
        //System.out.println("Point 5");
        return labels;
    }
    
    //precondition tagged contains both the tags
    //assumes that what is inside does not have tags
    private static String itemInsideTags(String tagged){
    	int start = tagged.indexOf('>') + 1;
    	int end = tagged.indexOf('<', start);
    	
    	
    	return tagged.substring(start, end);
    }
    
    private static String itemInsideTags(String tagged, String label){
    	int start = tagged.indexOf("<" + label + ">") + label.length() + 2;
    	int end = tagged.indexOf("</" + label + ">");
    	
    	return tagged.substring(start, end);
    }

}