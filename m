Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:47619 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759184AbaGPHMn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Jul 2014 03:12:43 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v3 5/5] kbuild: clean-up and bug fix of scripts/Makefile.host
Date: Wed, 16 Jul 2014 16:12:23 +0900
Message-Id: <1405494743-29566-6-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1405494743-29566-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1405494743-29566-1-git-send-email-yamada.m@jp.panasonic.com>
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

Changes in v3:
  - Compute host-objdirs more simply

Changes in v2:
  - More simplify host-objdirs

 scripts/Makefile.host | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index bb6a11f..ab5980f 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -43,12 +43,9 @@ host-cxxmulti	:= $(foreach m,$(__hostprogs),$(if $($(m)-cxxobjs),$(m)))
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
+host-objdirs := $(dir $(__hostprogs) $(host-cobjs) $(host-cxxobjs))
 
 host-objdirs := $(strip $(sort $(filter-out ./,$(host-objdirs))))
 
-- 
1.9.1

