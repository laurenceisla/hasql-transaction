module Hasql.Transaction.Sessions
  ( transaction,

    -- * Transaction settings
    C.Mode (..),
    C.IsolationLevel (..),
  )
where

import Hasql.Session qualified as B
import Hasql.Transaction.Config qualified as C
import Hasql.Transaction.Private.Prelude
import Hasql.Transaction.Private.Transaction qualified as A

-- |
-- Execute the transaction using the provided isolation level and mode.
{-# INLINE transaction #-}
transaction :: C.IsolationLevel -> C.Mode -> Bool -> A.Transaction a -> B.Session a
transaction isolation mode retryOnError transaction =
  A.run transaction isolation mode retryOnError
