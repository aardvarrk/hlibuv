module Network.UV.Internal.UV
( Loop(..)
) where

import          Foreign.Ptr

-- | A loop.
newtype Loop = Loop (Ptr ())
