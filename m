Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:28188 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1753486AbdKABoz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Oct 2017 21:44:55 -0400
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH v2] kbuild: comments correction & update on Makefile.host
Date: Wed, 1 Nov 2017 09:43:14 +0800
Message-ID: <20171101014314.4575-1-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net

host-cmulti means the composite host program that is compiled/linked
from several .c file, not .o file, because .o file could also be
compiled from .cpp file.

Bonus: update the stale comment.
Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 scripts/Makefile.host | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 9cfd5c84d76f..8181df66d764 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -25,11 +25,11 @@ host-cshlib := $(sort $(hostlibs-y) $(hostlibs-m))
 host-cxxshlib := $(sort $(hostcxxlibs-y) $(hostcxxlibs-m))
 
 # C code
-# Executables compiled from a single .c file
+# C Executables compiled from a single .c file
 host-csingle	:= $(foreach m,$(__hostprogs), \
 			$(if $($(m)-objs)$($(m)-cxxobjs),,$(m)))
 
-# C executables linked based on several .o files
+# C executables compiled from several .c files, and only .c files
 host-cmulti	:= $(foreach m,$(__hostprogs),\
 		   $(if $($(m)-cxxobjs),,$(if $($(m)-objs),$(m))))
 
@@ -50,7 +50,7 @@ host-cxxshobjs	:= $(sort $(foreach m,$(host-cxxshlib),$($(m:.so=-objs))))
 
 # output directory for programs/.o files
 # hostprogs-y := tools/build may have been specified.
-# Retrieve also directory of .o files from prog-objs or prog-cxxobjs notation
+# Retrieve also directory of .o files from host-cobjs and host-cxxobjs notation
 host-objdirs := $(dir $(__hostprogs) $(host-cobjs) $(host-cxxobjs))
 
 host-objdirs := $(strip $(sort $(filter-out ./,$(host-objdirs))))
-- 
2.13.6



