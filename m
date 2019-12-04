Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:52231 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfLDCwR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Dec 2019 21:52:17 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: fix 'No such file or directory' warning when cleaning
Date: Wed,  4 Dec 2019 11:51:48 +0900
Message-Id: <20191204025148.32101-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

Since commit fcbb8461fd23 ("kbuild: remove header compile test"),
'make clean' with O= option in the pristine source tree emits
'No such file or directory' warning.

$ git clean -d -f -x
$ make O=foo clean
make[1]: Entering directory '/home/masahiro/linux/foo'
find: ‘usr/include’: No such file or directory
make[1]: Leaving directory '/home/masahiro/linux/foo'

Fixes: fcbb8461fd23 ("kbuild: remove header compile test")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/include/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 24543a30b9f0..e5895a79c45f 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -95,7 +95,7 @@ endif
 # asm-generic/*.h is used by asm/*.h, and should not be included directly
 header-test- += asm-generic/%
 
-extra-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h'))
+extra-y := $(patsubst $(obj)/%.h,%.hdrtest, $(shell find $(obj) -name '*.h' 2>/dev/null))
 
 quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
-- 
2.17.1
