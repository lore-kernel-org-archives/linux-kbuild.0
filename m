Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:44105 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750741AbaFIERD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Jun 2014 00:17:03 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v2 5/5] kbuild: clean-up and bug fix of scripts/Makefile.host
Date: Mon,  9 Jun 2014 13:16:34 +0900
Message-Id: <1402287394-31133-6-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1402287394-31133-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1402287394-31133-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Masahiro Yamada <yamada.m@jp.panasonic.com>

Assume we have a Makefile like this:

  hostprogs-y := foo
  foo-cxxobjs := bar/baz.o
  foo-objs := qux/quux.o

In this case, Kbuild creates bar/ directory,
but fails to create qux/ directory.

This commit re-writes directory creation more simply,
fixing that bug.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---

Changes in v2:
  - More simplify host-objdirs

 scripts/Makefile.host | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index bb6a11f..064d825 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -43,12 +43,10 @@ host-cxxmulti	:= $(foreach m,$(__hostprogs),$(if $($(m)-cxxobjs),$(m)))
 host-cxxobjs	:= $(sort $(foreach m,$(host-cxxmulti),$($(m)-cxxobjs)))
 
 # output directory for programs/.o files
-# hostprogs-y := tools/build may have been specified. Retrieve directory
-host-objdirs := $(dir $(__hostprogs))
-# directory of .o files from prog-objs notation
-host-objdirs += $(dir $(foreach f,$(host-cmulti), $($(f)-objs)))
-# directory of .o files from prog-cxxobjs notation
-host-objdirs += $(dir $(foreach f,$(host-cxxmulti), $($(f)-cxxobjs)))
+# hostprogs-y := tools/build may have been specified.
+# Retrieve also directory of .o files from prog-objs or prog-cxxobjs notation
+host-objdirs := $(dir \
+	     $(foreach f, $(__hostprogs), $(f) $($(f)-objs) $($(f)-cxxobjs)))
 
 host-objdirs := $(strip $(sort $(filter-out ./,$(host-objdirs))))
 
-- 
1.9.1

