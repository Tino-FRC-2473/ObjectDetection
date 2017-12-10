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
import java.util.Scanner;
import java.util.StringTokenizer;


/*
 * Instructions:
 * 
 * In the main method, when creating the Main object, pass in two strings:
 *     String 1: The path to the folder with the json files from RectLabel
 *     String 2: The path to the empty output folder where the kitti files will gp
 */

public class JsonKittiConversion {

    private static File jsonRootFolder;
    private static File kittiOutputFolder;
    
    private static String objectName = "";
    private static String s1 = " 0.0 0 0.0 ";
    private static String s2 = "0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0";
    
    //constructor for the JsonKittiConversion
    public JsonKittiConversion (String inputPath, String outputPath){
        jsonRootFolder = new File(inputPath);
        kittiOutputFolder = new File(outputPath);
    }

    public static void main(String[] args){
    	// Replace the code here with the paths to the folders on your computer
    	JsonKittiConversion main = new JsonKittiConversion("/Users/work/Desktop/tanupa_annotations_1503-1735",
    			"/Users/work/Desktop/tanupa_kitti_annotations_1503-1735");
        main.convertAllFiles();
    }
    
    //converts all files to kitti
    public void convertAllFiles(){
        System.out.println(jsonRootFolder.isDirectory());
    	File[] jsonFiles = jsonRootFolder.listFiles();
        System.out.println(jsonFiles);
        //for each file
        for(File json : jsonFiles){
            //check if it is a json file
        	if(json.toString().endsWith(".json")){
                
        		File kittiFile = new File(kittiOutputFolder.toString() + "/" + json.getName().substring(0, json.getName().indexOf(".json")) + ".txt");
                write(json, kittiFile);
            }
        }
    }
    
    
    public void write(File jsonRootFile, File kittiOutputFile){
        try{
            InputStream is = new FileInputStream(jsonRootFile);
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
        String keyWord_label = "label";
        String keyWord_dim = "x_y_w_h";
        
        
        
        //while the string input contains the keyword
        while(input.contains(keyWord_label)){
        	objectName = "";
        	//finds index of keyWord_label
        	int labelIndex = input.indexOf(keyWord_label);
        	input = input.substring(labelIndex); 
        	
        	//System.out.println(input);
        	System.out.println(input.indexOf('"') + 1);
        	input = input.substring(input.indexOf('"') + 1);
        	for(int i = input.indexOf('"') + 1; i < input.length(); i++){
        		objectName+=input.charAt(i);
        		if(input.charAt(i+1) == '"') break;
        	}
        	System.out.println(objectName);
        	
        	//finds index of keyWord_dim
            int dimIndex = input.indexOf(keyWord_dim);
            
            //sets the input into the substring of the input
            input = input.substring(dimIndex + keyWord_dim.length());
            
            
            /*int i; //start index of digit 
            for(i = 0; i<input.length(); i++){
                if(Character.isDigit(input.charAt(i))){
                    break;
                }
            }*/
            

            
            ArrayList<Float> dimens = new ArrayList<Float>();
            String num = "";
            boolean prevIsChar = false;
            for(int i = 0; i < input.length(); i++){
            	if(dimens.size() == 4) break;
            	
            	if(Character.isDigit(input.charAt(i))){
            		if(!prevIsChar){
            			num = "";
            			prevIsChar = true;
            		}
            		num+=input.charAt(i);
            	}else if(prevIsChar){
            		dimens.add((float) Integer.parseInt(num));
            		prevIsChar = false;
            	}
            }
            
            System.out.println(dimens.toString());
            
            //make the third value x2 instead of width
            dimens.set(2, dimens.get(0)+dimens.get(2) - 1);
            //make the fourth value y2 instead of height
            dimens.set(3, dimens.get(1)+dimens.get(3) - 1);
            

            System.out.println(dimens.toString());
            
            /*int lastIndex; //last index of bounding box string
            for(lastIndex = i; lastIndex < input.length(); lastIndex++){
                
            	if(!(input.charAt(lastIndex) == ',' || 
            			Character.isDigit(input.charAt(lastIndex)) || 
            			input.charAt(lastIndex) == ' ')){
                    System.out.println("This character is " + input.charAt(lastIndex));
                    break;
                }
            }

            //takes the substring of the of where the bounding box is
            String coordinates = input.substring(i, lastIndex);
            //uses the StringTokenizer to create tokens with characters
            StringTokenizer st = new StringTokenizer(coordinates, " ,");*/

            String label = objectName + s1;
            /*while(st.hasMoreElements()){
                
            	label += st.nextToken() + ".0 ";
            }*/
            
            for(float d:dimens){
            	label+=d + " ";
            }
            
            labels.add(label + s2);
            System.out.println(labels);
            System.out.println("Point 4");
        }

        System.out.println("Point 5");
        return labels;
    }

}