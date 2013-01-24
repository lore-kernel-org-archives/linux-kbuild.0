Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hqemgate03.nvidia.com ([216.228.121.140]:19711 "EHLO
	hqemgate03.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753047Ab3AXBaj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Jan 2013 20:30:39 -0500
Message-ID: <51008E94.7020702@nvidia.com>
Date: Wed, 23 Jan 2013 19:29:56 -0600
From: Daniel Dadap <ddadap@nvidia.com>
MIME-Version: 1.0
Subject: [PATCH] KBUILD EXTMOD: Don't echo test -e for autoconf.h, even in
 verbose mode
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

The top-level Makefile tests to make sure autoconf.h is present before
building external modules. This test is performed silently unless
KBUILD_VERBOSE is set, in which case the test, along with the error
messages that gets printed when the test fails, shows up in `make`
output, regardless of whether the test succeeds.

Although there may be some utility in actually printing the test along
with the error message when building with KBUILD_VERBOSE, in practice,
the error message can confuse people building external modules.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
Reviewed-by:   Andy Ritger <aritger@nvidia.com>
---
  Makefile |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 07bc925..11f1e69 100644
--- a/Makefile
+++ b/Makefile
@@ -537,7 +537,7 @@ else
  PHONY += include/config/auto.conf

  include/config/auto.conf:
-    $(Q)test -e include/generated/autoconf.h -a -e $@ || (        \
+    @test -e include/generated/autoconf.h -a -e $@ || (        \
      echo;                                \
      echo "  ERROR: Kernel configuration is invalid.";        \
      echo "         include/generated/autoconf.h or $@ are missing.";\
-- 
1.7.10.4

-----------------------------------------------------------------------------------
This email message is for the sole use of the intended recipient(s) and may contain
confidential information.  Any unauthorized review, use, disclosure or distribution
is prohibited.  If you are not the intended recipient, please contact the sender by
reply email and destroy all copies of the original message.
-----------------------------------------------------------------------------------
