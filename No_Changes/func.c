#include <math.h>
double findPi(double accurancy){
    double res = 0;
    int counter = 1;
    while(100*(M_PI - sqrt(6*res))/M_PI > accurancy){
        res += 1/pow(counter,2);
        counter += 1;    
    }

    return sqrt(6*res);
}
