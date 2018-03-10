//
//  HelloWorldAstraTest.cpp
//  
//
//  Created by Work on 3/3/18.
//

#include <astra/astra.hpp>
#include <cstdio>
#include <iostream>
using namespace std;

int main(int argc, char** argv)
{
    astra::initialize(); //initialize ASTRA
    
    //connecting to the Astra
    
    //talking to the Astra sensor, connecting to the first available Astra sensor
    astra::StreamSet streamset;
    
    //access the stream of the Astra
    astra::StreamReader reader = streamset.create_reader();
    
    //start the depth stream using StreamReader, the depth stream gives of anything the camera sees in pixels
    reader.stream<astra::DepthStream>().start();
    
    const int maxFramesToProcess = 100;
    int count = 0;
    
    do {
        //grabs a frame from the StreamReader
        astra::Frame frame = reader.get_latest_frame();
        //gets the depth frame data from the frame
        const auto depthFrame = frame.get<astra::DepthFrame>();
        
        //print info from the frame
        const int frameIndex = depthFrame.frame_index();
        const short pixelValue = depthFrame.data()[0];
        
        cout<<std::endl
        << "Depth frameIndex: " << frameIndex
        << " pixelValue " << pixelValue
        << endl
        << endl;
        
        count++;
    } while (count < maxFramesToProcess);
        
    cout<<"Press any key to continue...";
    cin.get();
    
    astra::terminate(); //terminate Astra
    
    cout << "hit enter to to exit program" << endl;
    std::cin.get();
    
    return 0;
    
}
