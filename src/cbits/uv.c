#include <stdlib.h>
#include "libuv/include/uv.h"

void *huv_mallocTCPWatcher() {
    return malloc(sizeof(uv_loop_t));
}
