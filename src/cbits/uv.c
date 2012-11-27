#include <stdlib.h>
#include "libuv/include/uv.h"

void *mallocTCPWatcher() {
    return malloc(sizeof(uv_loop_t));
}
