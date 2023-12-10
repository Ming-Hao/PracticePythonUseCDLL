#ifndef MATHFUNCT_H
#define MATHFUNCT_H

#ifdef _WIN32
#define DllExport __declspec( dllexport )
#else
#define DllExport
#endif

extern "C" {
    DllExport double add(double x, double y);
    DllExport int loop(int count);
}

#endif
