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

    private static String objectName = "Shoe";
    private static String s1 = " 0.0 0 0.0 ", s2 = "0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0";

    public JsonKittiConversion (String inputPath, String outputPath){
        jsonRootFolder = new File(inputPath);
        kittiOutputFolder = new File(outputPath);
    }

    public static void main(String[] args){
    	// Replace the code here with the paths to the folders on your computer
    	JsonKittiConversion main = new JsonKittiConversion("/Users/ethansoo/Desktop/Rectlabel-support-master/images_test/annotations",
                "/Users/ethansoo/Desktop/Voc-Kitti");
        main.convertAllFiles();
    }
    
    public void convertAllFiles(){
        File[] jsonFiles = jsonRootFolder.listFiles();
        for(File json : jsonFiles){
            if(json.toString().endsWith(".json")){
                File kittiFile = new File(kittiOutputFolder.toString() + "/" + json.getName().substring(0, json.getName().indexOf(".json")) + "_kitti.txt");
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
            while(true){
                line = br.readLine();
                if(line == null) break;
                input += line;
            }

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
        String keyWord = "x_y_w_h";
        while(input.contains(keyWord)){

            int labelIndex = input.indexOf(keyWord);
            input = input.substring(labelIndex + keyWord.length());

            int i;
            for(i = 0; i<input.length(); i++){
                if(Character.isDigit(input.charAt(i))){
                    break;
                }
            }


            int lastIndex;
            for(lastIndex = i; lastIndex < input.length(); lastIndex++){
                if(!(input.charAt(lastIndex) == ',' || Character.isDigit(input.charAt(lastIndex)) || input.charAt(lastIndex) == ' ')){
                    System.out.println("This character is " + input.charAt(lastIndex));
                    break;
                }
            }


            String coordinates = input.substring(i, lastIndex);
            StringTokenizer st = new StringTokenizer(coordinates, " ,");

            String label = objectName + s1;
            while(st.hasMoreElements()){
                label += st.nextToken() + ".0 ";
            }
            labels.add(label + s2);

            System.out.println("Point 4");
        }

        System.out.println("Point 5");
        return labels;
    }

}