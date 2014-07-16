Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:47570 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759143AbaGPHMi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Jul 2014 03:12:38 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v3 2/5] kbuild: fix a bug of C++ host program handling
Date: Wed, 16 Jul 2014 16:12:20 +0900
Message-Id: <1405494743-29566-3-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1405494743-29566-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1405494743-29566-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Masahiro Yamada <yamada.m@jp.panasonic.com>

The comment claims:
  C++ executables compiled from at least one .cc file
  and zero or more .c files

But C++ executables with zero .c file fail in build.

For example, assume we have a Makefile like this:

  hostprogs-y := foo
  foo-cxxobjs := bar.o

In this case, foo is treated as host-csingle
and Kbuild tries to search non-existing foo.c source.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---

Changes in v3: None
Changes in v2: None

 scripts/Makefile.host | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 395a240..bf44e79 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -34,7 +34,8 @@ __hostprogs := $(sort $(hostprogs-y) $(hostprogs-m))
 
 # C code
 # Executables compiled from a single .c file
-host-csingle	:= $(foreach m,$(__hostprogs),$(if $($(m)-objs),,$(m)))
+host-csingle	:= $(foreach m,$(__hostprogs), \
+			$(if $($(m)-objs)$($(m)-cxxobjs),,$(m)))
 
 # C executables linked based on several .o files
 host-cmulti	:= $(foreach m,$(__hostprogs),\
-- 
1.9.1

