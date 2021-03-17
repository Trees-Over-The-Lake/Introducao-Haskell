import Control.Monad
import Data.Array.IO
import Data.IORef

qsort :: IOUArray Int Int -> Int -> Int -> IO ()
qsort a lo hi = do
  (h,l,p,t) <- liftM4 (,,,) z z z z

  when (lo < hi) $ do
    l .= lo
    h .= hi
    p .=. (a!hi)

    doWhile (get l .< get h) $ do
      while ((get l .< get h) .&& ((a.!l) .<= get p)) $ do
        modifyIORef l succ
      while ((get h .> get l) .&& ((a.!h) .>= get p)) $ do
        modifyIORef h pred
      b <- get l .< get h
      when b $ do
        t .=. (a.!l)
        lVal <- get l
        hVal <- get h
        writeArray a lVal =<< a!hVal
        writeArray a hVal =<< get t

    lVal <- get l
    writeArray a hi =<< a!lVal
    writeArray a lVal =<< get p

    hi' <- fmap pred (get l)
    qsort a lo hi'
    lo' <- fmap succ (get l)
    qsort a lo' hi
