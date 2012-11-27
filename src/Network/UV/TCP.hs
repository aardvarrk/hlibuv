{-# LANGUAGE ForeignFunctionInterface #-}
module Network.UV.TCP
( TCPWatcher
, createTCPWatcher
) where

import           Foreign.C
import           Foreign.Ptr
import           Foreign.Marshal.Alloc
import           Network.UV.Internal.UV
import           Network.UV.Internal.TCP

foreign import ccall unsafe "huv_mallocTCPWatcher" c_huv_mallocTCPWatcher
    :: IO (Ptr ())

foreign import ccall unsafe "uv_tcp_init" c_uv_tcp_init
    :: Ptr () -> Ptr () -> IO CInt

foreign import ccall unsafe "uv_listen" c_uv_listen
    :: Ptr () -> CInt -> FunPtr (Ptr () -> CInt -> IO ()) -> IO CInt

-- | Create a new TCP watcher.
createTCPWatcher :: Loop -> IO TCPWatcher
createTCPWatcher (Loop loopPtr) = do
    handle <- c_huv_mallocTCPWatcher
    c_uv_tcp_init loopPtr handle
    return $ TCPWatcher handle
