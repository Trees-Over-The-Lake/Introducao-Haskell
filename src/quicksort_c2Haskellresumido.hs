let z :: IO (IORef Int)
      z = newIORef 0
      (.=) = writeIORef
      ref .=. action = do v <- action; ref .= v
      (!) = readArray
      (.!) a ref = readArray a =<< get ref
      get = readIORef
      (.<) = liftM2 (<)
      (.>) = liftM2 (>)
      (.<=) = liftM2 (<=)
      (.>=) = liftM2 (>=)
      (.&&) = liftM2 (&&)
  -- ...
  where doWhile cond foo = do
          foo
          b <- cond
          when b $ doWhile cond foo
        while cond foo = do
          b <- cond
          when b $ foo >> while cond foo