#include "../src/Hello.h"

int main (){
    Hello h1;

    if(h1.getMessage() == "Bonjour"){
        return 0;
    } else {
        return 1;
    }

}