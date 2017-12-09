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

public class FlawedTextConverter {
	private File textRootFolder;
	private File kittiOutputFolder;
	
	public static void main(String args[]){
		FlawedTextConverter main = new FlawedTextConverter("/Users/work/Desktop/GearImagesForModel/trlab",
				"/Users/work/Desktop/GearImagesForModel/trlab_updated");
		main.convertAllFiles();
		
		FlawedTextConverter main1 = new FlawedTextConverter("/Users/work/Desktop/GearImagesForModel/valim",
				"/Users/work/Desktop/GearImagesForModel/valim_updated");
		main1.convertAllFiles();
		
		FlawedTextConverter main2 = new FlawedTextConverter("/Users/work/Desktop/GearImagesForModel/vallab",
				"/Users/work/Desktop/GearImagesForModel/vallab_updated");
		main2.convertAllFiles();
	}
	
	public FlawedTextConverter(String inputPath, String outputPath) {
		textRootFolder = new File(inputPath);
		kittiOutputFolder = new File(outputPath);
	}
	
	public void convertAllFiles(){
		File[] textFiles = textRootFolder.listFiles();
		
		for(File text: textFiles){
			if(text.toString().endsWith(".txt")){
				String fileName = text.getName();
				File kittiFile = new File(kittiOutputFolder.toString() + "/" + 
										fileName);
				
				write(text, kittiFile);
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

            ArrayList<String> labels = new ArrayList<String>();
            String line = "";
            
            //writes the entire file into an input string
            while(true){
                line = br.readLine();
                if(line == null) break;
                labels.add(convert(line));
            }
            
            //uses the convert method to ?????
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
	
	private String convert(String line){
		System.out.println(line);
		
		String label = "";
		
		Scanner lineScanner = new Scanner(line);
		ArrayList<String> vals = new ArrayList<String>(16);
		while(lineScanner.hasNext()){
			vals.add(lineScanner.next());
		}
		lineScanner.close();
		
		vals.set(6, Float.parseFloat(vals.get(4)) + Float.parseFloat(vals.get(6)) - 1 + "");
		vals.set(7, Float.parseFloat(vals.get(5)) + Float.parseFloat(vals.get(7)) - 1 + "");
		
		for(String val: vals){
			label+=val + " ";
		}
		
		System.out.println(label);
		return label;
	}
	
}
