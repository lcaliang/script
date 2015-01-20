#!/bin/bash
#
#
#sign update.zip
#
java -Xmx2048m -jar ../../out/host/linux-x86/framework/signapk.jar -w ../../build/target/product/security/testkey.x509.pem ../../build/target/product/security/testkey.pk8 $1 $2
