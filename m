Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:57954 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751939AbaFFBbM (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Jun 2014 21:31:12 -0400
Received: from mail-gw.jp.panasonic.com ([157.8.1.157])
	by smtp.mei.co.jp (8.12.11.20060614/3.7W/kc-maile12) with ESMTP id s561VALZ005152
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:31:10 +0900 (JST)
Received: from epochmail.jp.panasonic.com ([157.8.1.130])
	by mail.jp.panasonic.com (8.11.6p2/3.7W/kc-maili14) with ESMTP id s561VAL15339
	for <linux-kbuild@vger.kernel.org>; Fri, 6 Jun 2014 10:31:10 +0900
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH 2/5] kbuild: fix a bug of C++ host program handling
Date: Fri,  6 Jun 2014 10:31:00 +0900
Message-Id: <1402018263-30670-3-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1402018263-30670-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>

The comment claims:
  C++ executables compiled from at least one .cc file
  and zero or more .c files

But C++ executables with zero .c file fail in build.

For example, assume Makefile is like this:

  hostprogs-y := foo
  foo-cxxobjs := bar.o

In this case, foo is treated as host-csingle
and Kbuild searches foo.c source.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---
 scripts/Makefile.host | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 395a240..2632adf 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -34,7 +34,8 @@ __hostprogs := $(sort $(hostprogs-y) $(hostprogs-m))
 
 # C code
 # Executables compiled from a single .c file
-host-csingle	:= $(foreach m,$(__hostprogs),$(if $($(m)-objs),,$(m)))
+host-csingle	:= $(foreach m,$(__hostprogs), \
+		   $(if $($(m)-objs)$($(m)-cxxobjs),,$(m)))
 
 # C executables linked based on several .o files
 host-cmulti	:= $(foreach m,$(__hostprogs),\
-- 
1.9.1

