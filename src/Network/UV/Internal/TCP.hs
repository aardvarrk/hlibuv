module Network.UV.Internal.TCP
( TCPWatcher(..)
) where

import           Foreign.Ptr

-- | A TCP watcher.
newtype TCPWatcher = TCPWatcher (Ptr ())
