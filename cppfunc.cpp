#include "cppfunc.h"

double add(double x, double y)
{
    return x + y;
}

DllExport int loop(int count)
{
    int sum = 0;
    int i = 0;
    while(i++ < count) {
        sum += i;
    }
    return sum;
}