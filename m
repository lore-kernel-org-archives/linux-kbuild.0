Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728229AbgENWng (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 May 2020 18:43:36 -0400
From: Yuxuan Shui <yshuiv7@gmail.com>
Subject: [PATCH] kbuild: compile_h: fix compiler version detection with clang
Date: Thu, 14 May 2020 23:19:05 +0100
Message-ID: <87imgykunh.fsf@m5Zedd9JOGzJrf0>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: masahiroy@kernel.org, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com

--=-=-=
Content-Type: text/plain


In some setup clang will print a line about CUDA version it detects,
like this:

    Found CUDA installation: /opt/cuda, version 10.1

So grepping ' version ' matches 2 lines, and results in a broken string in
compiler.h, which doesn't compile.

This commit adds a "head -n1" to fix this problem.

Signed-off-by: Yuxuan Shui <yshuiv7@gmail.com>
---
 scripts/mkcompile_h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index 5b80a4699740..8e6b4fc6fdd9 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -62,7 +62,7 @@ UTS_VERSION="$(echo $UTS_VERSION $CONFIG_FLAGS $TIMESTAMP | cut -b -$UTS_LEN)"
   printf '#define LINUX_COMPILE_BY "%s"\n' "$LINUX_COMPILE_BY"
   echo \#define LINUX_COMPILE_HOST \"$LINUX_COMPILE_HOST\"

-  CC_VERSION=$($CC -v 2>&1 | grep ' version ' | sed 's/[[:space:]]*$//')
+  CC_VERSION=$($CC -v 2>&1 | grep ' version ' | head -n1 | sed 's/[[:space:]]*$//')
   LD_VERSION=$($LD -v | head -n1 | sed 's/(compatible with [^)]*)//' \
 		      | sed 's/[[:space:]]*$//')
   printf '#define LINUX_COMPILER "%s"\n' "$CC_VERSION, $LD_VERSION"
--
2.26.2

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEL6EJkr0WlitWahBy06RAW+bMF/QFAl69yYwACgkQ06RAW+bM
F/QVYA/+Iqa09i83Gi0bUr1ZSpujLj3Pke7A3qzGr1WxDx+WgeUsN466dtbmo3x3
Gvxocu+lzO2fhJuG8/Lk3DcNUrpBaxi/qfTq5SXK0IMQmAbhIQRVVQw8Vz+C9nuk
IatyTz5sgaBpVZlQzOs81bcfcF3Q1jlP57okNbZLIkhDk74seIRFddiY3gR3TNb1
3VUQDmoPT7Xo0N7whzERmfzCPlrWZphDT8nh6OwOt/InJJPvB1i8235ckCZbhIty
KFYH1nxB19QkURZ12zGxmnHJeGEXTc+Yy/NcpNH/lA1h2IvcD9qmE/E1TBoueiPy
MrgxczwhPgjhzeNv0AwSK0JhjWEDl3Jg2GXNhngIckfn+DrEZN4WreF5fNZNctqs
4+GOKreqGvJqXL9hUF6Pjwv/ef4zi3Py2qkJEQRxATPEf8Kk8t2Ok/Xkf+e0uRCL
tWVlCbHtkotEjycImzNbyRGoquIfIamuidtq+k5Bs0OIGUETVK6hEng45F2PQ27E
YHo7SXKDeQjrHHr/05ues02xecf0JRhvn/vBr8E/uddXAPEgYn25P7N5Al4KpMiV
U7TlikB/r6V8IUfQjqki9qGaPmMGp790QNQwx/jR8hOPZ5aBN57qTcRM/NSs4vgl
RFTwHAK9KrWpRsrU9E9s9BWXgGdTwKOjzAZpLX0jygr2iJXVjP4=
=WfVw
-----END PGP SIGNATURE-----
--=-=-=--
