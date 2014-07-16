Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:34722 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1759080AbaGPHMh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 16 Jul 2014 03:12:37 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v3 4/5] kbuild: clean up scripts/Makefile.host
Date: Wed, 16 Jul 2014 16:12:22 +0900
Message-Id: <1405494743-29566-5-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1405494743-29566-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1405494743-29566-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Masahiro Yamada <yamada.m@jp.panasonic.com>

The directory creation can be more simplified by two levels.

[1] Drop $(dir ...)

 $(dir $(f)) always returns non-empty string.

So, $(if $(dir $(f)),$(dir $(f)) is equivalent to $(dir $(f)).

[2] Unroll $(foreach ...) loop

$(dir ...) can take one or more arguments and returns a list of
directories of them.

$(foreach f, $(progs), $(dir $(f))) can be unrolled as $(dir $(progs)).

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
---

Changes in v3: None
Changes in v2:
  - Further more clean-up by enrolling $(foreach ) loop

 scripts/Makefile.host | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/Makefile.host b/scripts/Makefile.host
index 1c2e570..bb6a11f 100644
--- a/scripts/Makefile.host
+++ b/scripts/Makefile.host
@@ -44,15 +44,11 @@ host-cxxobjs	:= $(sort $(foreach m,$(host-cxxmulti),$($(m)-cxxobjs)))
 
 # output directory for programs/.o files
 # hostprogs-y := tools/build may have been specified. Retrieve directory
-host-objdirs := $(foreach f,$(__hostprogs), $(if $(dir $(f)),$(dir $(f))))
+host-objdirs := $(dir $(__hostprogs))
 # directory of .o files from prog-objs notation
-host-objdirs += $(foreach f,$(host-cmulti),                  \
-                    $(foreach m,$($(f)-objs),                \
-                        $(if $(dir $(m)),$(dir $(m)))))
+host-objdirs += $(dir $(foreach f,$(host-cmulti), $($(f)-objs)))
 # directory of .o files from prog-cxxobjs notation
-host-objdirs += $(foreach f,$(host-cxxmulti),                  \
-                    $(foreach m,$($(f)-cxxobjs),                \
-                        $(if $(dir $(m)),$(dir $(m)))))
+host-objdirs += $(dir $(foreach f,$(host-cxxmulti), $($(f)-cxxobjs)))
 
 host-objdirs := $(strip $(sort $(filter-out ./,$(host-objdirs))))
 
-- 
1.9.1

