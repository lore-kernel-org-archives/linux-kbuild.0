Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:59036 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756496AbdCGXtx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Mar 2017 18:49:53 -0500
Subject: [PATCH] kbuild: external module build warnings when KBUILD_OUTPUT
 set and W=1
From: Bruce Allan <bruce.w.allan@intel.com>
Date: Tue, 07 Mar 2017 15:48:23 -0800
Message-ID: <20170307234823.17093.94956.stgit@bwallan-cwp1.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: mmarek@suse.com, arnd@arndb.de

Commit db547ef19064 ("Kbuild: don't add obj tree in additional includes")
causes warnings (-Wmissing-include-dirs) when compiling external modules
with KBUILD_OUTPUT set and W=1.  This is because $src can be an absolute
path to the external module source which when prefixed with -I$(srctree)/
generates an incorrect directory path.

Signed-off-by: Bruce Allan <bruce.w.allan@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>
---
 scripts/Makefile.lib |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0a07f90..7234e61 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -155,7 +155,7 @@ else
 # $(call addtree,-I$(obj)) locates .h files in srctree, from generated .c files
 #   and locates generated .h files
 # FIXME: Replace both with specific CFLAGS* statements in the makefiles
-__c_flags	= $(if $(obj),-I$(srctree)/$(src) -I$(obj)) \
+__c_flags	= $(if $(obj),$(call addtree,-I$(src)) -I$(obj)) \
 		  $(call flags,_c_flags)
 __a_flags	= $(call flags,_a_flags)
 __cpp_flags     = $(call flags,_cpp_flags)

