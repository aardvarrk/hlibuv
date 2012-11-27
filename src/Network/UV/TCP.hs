{-# LANGUAGE ForeignFunctionInterface #-}
module Network.UV.TCP
(
) where

import           Foreign.C
import           Foreign.Ptr

foreign import ccall unsafe "uv_tcp_init" c_uv_tcp_init
    :: Ptr () -> Ptr () -> IO CInt

foreign import ccall unsafe "uv_listen" c_uv_listen
    :: Ptr () -> CInt -> (FunPtr (Ptr () -> CInt -> IO ())) -> IO CInt
