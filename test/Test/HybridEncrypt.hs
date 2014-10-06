module Test.HybridEncrypt(hybridEncryptionTest)
 where

import Codec.Crypto.RSA
import Control.Applicative
import Control.Monad
import Crypto.Random.DRBG
import Data.ByteString.Lazy(ByteString,pack)
import qualified Data.ByteString.Lazy as BS
import Test.Framework
import Test.Framework.Providers.QuickCheck2
import Test.QuickCheck
import Test.Standard
import Tor.HybridCrypto

data InputValues = Input PublicKey PrivateKey ByteString HashDRBG

instance Eq InputValues where
  (Input pub priv bstr _) == (Input pub' priv' bstr' _) =
    (pub == pub') && (priv == priv') && (bstr == bstr')

instance Show InputValues where
  show (Input pub priv bstr _) =
    "Input " ++ show pub ++ " " ++ show priv ++ " " ++ show bstr

instance Arbitrary InputValues where
  arbitrary = do g <- arbitraryRNG
                 let (pub, priv, g') = generateKeyPair g 1024
                 len <- choose (0, 2048)
                 msg <- pack <$> replicateM len arbitrary
                 return (Input pub priv msg g')

prop_hybridEncWorks :: Bool -> InputValues -> Property
prop_hybridEncWorks force (Input pub priv m g) =
  (not force || (BS.length m > 70)) ==>
    let (em, _) = hybridEncrypt force pub m g
        m' = hybridDecrypt priv em
    in m == m'

hybridEncryptionTest :: Test
hybridEncryptionTest =
  testGroup "Hybrid encryption tests" [
    testProperty "Hybrid encryption works when forced"
                 (prop_hybridEncWorks True)
  , testProperty "Hybrid encryption works in general"
                 (prop_hybridEncWorks False)
  ]
