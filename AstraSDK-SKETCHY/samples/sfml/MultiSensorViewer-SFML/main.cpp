//
//  simple depth reader
//  
//
//  Created by Work on 3/10/18.
//

#include <astra/astra.hpp>
#include <cstdio> //for std:: printf

int main(int argc, char** arvg){
    astra::initialize();
    
    //creates a new streamSet that contains a lot of streams I guess
    astra::StreamSet streamSet;
    //stream reader
    astra::StreamReader reader = streamSet.create_reader();
    
    //we want the depth stream
    reader.stream<astra::DepthStream>().start();
    
    //OK so we add some code here....
    
    astra::terminate();
    
    return 0;
}
