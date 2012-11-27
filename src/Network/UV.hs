{-# LANGUAGE ForeignFunctionInterface #-}
module Network.UV
( Loop
, defaultLoop
, createLoop
, run
) where

import           Foreign.C
import           Foreign.Ptr
import           Network.UV.TCP
import           Network.UV.Internal.UV

foreign import ccall unsafe "uv_loop_new" c_uv_loop_new
    :: IO (Ptr a)

foreign import ccall unsafe "uv_default_loop" c_uv_default_loop
    :: IO (Ptr a)

foreign import ccall unsafe "uv_run" c_uv_run
    :: Ptr a -> IO CInt

-- | Get the default loop.
--
-- This function always returns the same loop.
defaultLoop :: IO Loop
defaultLoop = do
    ptr <- c_uv_default_loop
    return $ Loop ptr

-- | Create a new loop.
createLoop :: IO Loop
createLoop = do
    ptr <- c_uv_loop_new
    return $ Loop ptr

-- | Run the given loop.
run :: Loop -> IO ()
run (Loop ptr) = c_uv_run ptr >> return ()
