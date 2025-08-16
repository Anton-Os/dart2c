#include <stdio.h>

#ifdef _WIN32
#define DllExport __declspec(dllexport)
#elif defined(__APPLE__)
#define DllExport __attribute__(( visibility("default") ))
#else
#define DllExport
#endif