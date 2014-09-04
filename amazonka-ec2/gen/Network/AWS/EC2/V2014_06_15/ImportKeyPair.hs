{-# LANGUAGE DeriveGeneric               #-}
{-# LANGUAGE FlexibleInstances           #-}
{-# LANGUAGE NoImplicitPrelude           #-}
{-# LANGUAGE OverloadedStrings           #-}
{-# LANGUAGE RecordWildCards             #-}
{-# LANGUAGE TypeFamilies                #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}

-- Module      : Network.AWS.EC2.V2014_06_15.ImportKeyPair
-- Copyright   : (c) 2013-2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

-- | Imports the public key from an RSA key pair that you created with a
-- third-party tool. Compare this with CreateKeyPair, in which AWS creates the
-- key pair and gives the keys to you (AWS keeps a copy of the public key).
-- With ImportKeyPair, you create the key pair and give AWS just the public
-- key. The private key is never transferred between you and AWS. For more
-- information about key pairs, see Key Pairs in the Amazon Elastic Compute
-- Cloud User Guide. Example This example imports the public key named
-- my-key-pair. https://ec2.amazonaws.com/?Action=ImportKeyPair
-- &amp;KeyName=my-key-pair
-- &amp;PublicKeyMaterial=MIICiTCCAfICCQD6m7oRw0uXOjANBgkqhkiG9w0BAQUFADCBiDELMAkGA1UEBhMC
-- VVMxCzAJBgNVBAgTAldBMRAwDgYDVQQHEwdTZWF0dGxlMQ8wDQYDVQQKEwZBbWF6
-- b24xFDASBgNVBAsTC0lBTSBDb25zb2xlMRIwEAYDVQQDEwlUZXN0Q2lsYWMxHzAd
-- BgkqhkiG9w0BCQEWEG5vb25lQGFtYXpvbi5jb20wHhcNMTEwNDI1MjA0NTIxWhcN
-- MTIwNDI0MjA0NTIxWjCBiDELMAkGA1UEBhMCVVMxCzAJBgNVBAgTAldBMRAwDgYD
-- VQQHEwdTZWF0dGxlMQ8wDQYDVQQKEwZBbWF6b24xFDASBgNVBAsTC0lBTSBDb25z
-- b2xlMRIwEAYDVQQDEwlUZXN0Q2lsYWMxHzAdBgkqhkiG9w0BCQEWEG5vb25lQGFt
-- YXpvbi5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAMaK0dn+a4GmWIWJ
-- 21uUSfwfEvySWtC2XADZ4nB+BLYgVIk60CpiwsZ3G93vUEIO3IyNoH/f0wYK8m9T
-- rDHudUZg3qX4waLG5M43q7Wgc/MbQITxOUSQv7c7ugFFDzQGBzZswY6786m86gpE
-- Ibb3OhjZnzcvQAaRHhdlQWIMm2nrAgMBAAEwDQYJKoZIhvcNAQEFBQADgYEAtCu4
-- nUhVVxYUntneD9+h8Mg9q6q+auNKyExzyLwaxlAoo7TJHidbtS4J5iNmZgXL0Fkb
-- FFBjvSfpJIlJ00zbhNYS5f6GuoEDmFJl0ZxBHjJnyp378OD8uTs7fLvjx79LjSTb
-- NYiytVbZPQUQ5Yaxu2jXnimvw3rrszlaEXAMPLE &amp;AUTHPARAMS
-- &lt;ImportKeyPairResponse
-- xmlns="http://ec2.amazonaws.com/doc/2013-10-01/"&gt;
-- &lt;requestId&gt;7a62c49f-347e-4fc4-9331-6e8eEXAMPLE&lt;/requestId&gt;
-- &lt;keyName&gt;my-key-pair&lt;/keyName&gt;
-- &lt;keyFingerprint&gt;1f:51:ae:28:bf:89:e9:d8:1f:25:5d:37:2d:7d:b8:ca:9f:f5:f1:6f&lt;/keyFingerprint&gt;
-- &lt;/ImportKeyPairResponse&gt;.
module Network.AWS.EC2.V2014_06_15.ImportKeyPair
    (
    -- * Request
      ImportKeyPair
    -- ** Request constructor
    , importKeyPair
    -- ** Request lenses
    , ikprKeyName
    , ikprPublicKeyMaterial

    -- * Response
    , ImportKeyPairResponse
    -- ** Response lenses
    , ikpsKeyName
    , ikpsKeyFingerprint
    ) where

import Network.AWS.Request.Query
import Network.AWS.EC2.V2014_06_15.Types
import Network.AWS.Prelude

-- | Minimum specification for a 'ImportKeyPair' request.
importKeyPair :: Text -- ^ 'ikprKeyName'
              -> ByteString -- ^ 'ikprPublicKeyMaterial'
              -> ImportKeyPair
importKeyPair p1 p2 = ImportKeyPair
    { _ikprKeyName = p1
    , _ikprPublicKeyMaterial = p2
    }
{-# INLINE importKeyPair #-}

data ImportKeyPair = ImportKeyPair
    { _ikprKeyName :: Text
      -- ^ A unique name for the key pair.
    , _ikprPublicKeyMaterial :: ByteString
      -- ^ The public key. You must base64 encode the public key material
      -- before sending it to AWS.
    } deriving (Show, Generic)

-- | A unique name for the key pair.
ikprKeyName :: Lens' ImportKeyPair Text
ikprKeyName f x =
    f (_ikprKeyName x) <&> \y -> x { _ikprKeyName = y }
{-# INLINE ikprKeyName #-}

-- | The public key. You must base64 encode the public key material before
-- sending it to AWS.
ikprPublicKeyMaterial :: Lens' ImportKeyPair ByteString
ikprPublicKeyMaterial f x =
    f (_ikprPublicKeyMaterial x) <&> \y -> x { _ikprPublicKeyMaterial = y }
{-# INLINE ikprPublicKeyMaterial #-}

instance ToQuery ImportKeyPair where
    toQuery = genericQuery def

data ImportKeyPairResponse = ImportKeyPairResponse
    { _ikpsKeyName :: Maybe Text
      -- ^ The key pair name you provided.
    , _ikpsKeyFingerprint :: Maybe Text
      -- ^ The MD5 public key fingerprint as specified in section 4 of RFC
      -- 4716.
    } deriving (Show, Generic)

-- | The key pair name you provided.
ikpsKeyName :: Lens' ImportKeyPairResponse (Maybe Text)
ikpsKeyName f x =
    f (_ikpsKeyName x) <&> \y -> x { _ikpsKeyName = y }
{-# INLINE ikpsKeyName #-}

-- | The MD5 public key fingerprint as specified in section 4 of RFC 4716.
ikpsKeyFingerprint :: Lens' ImportKeyPairResponse (Maybe Text)
ikpsKeyFingerprint f x =
    f (_ikpsKeyFingerprint x) <&> \y -> x { _ikpsKeyFingerprint = y }
{-# INLINE ikpsKeyFingerprint #-}

instance FromXML ImportKeyPairResponse where
    fromXMLOptions = xmlOptions

instance AWSRequest ImportKeyPair where
    type Sv ImportKeyPair = EC2
    type Rs ImportKeyPair = ImportKeyPairResponse

    request = post "ImportKeyPair"
    response _ = xmlResponse
