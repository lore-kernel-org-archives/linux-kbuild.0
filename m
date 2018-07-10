Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:35640 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933324AbeGJAqP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Jul 2018 20:46:15 -0400
Received: by mail-qt0-f195.google.com with SMTP id a5-v6so2471211qtp.2
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jul 2018 17:46:14 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCHv2 1/7] tools: build: Fixup host c flags
Date: Mon,  9 Jul 2018 17:45:56 -0700
Message-Id: <20180710004602.21599-2-labbott@redhat.com>
In-Reply-To: <20180710004602.21599-1-labbott@redhat.com>
References: <20180710004602.21599-1-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>
Cc: Laura Abbott <labbott@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>

Commit 0c3b7e42616f ("tools build: Add support for host programs format")
introduced host_c_flags which referenced CHOSTFLAGS. The actual name of the
variable is HOSTCFLAGS. Fix this up.

Fixes: 0c3b7e42616f ("tools build: Add support for host programs format")
Signed-off-by: Laura Abbott <labbott@redhat.com>
---
v2: Also fixed another instance in perf pmu-events.
---
 tools/build/Build.include   | 2 +-
 tools/perf/pmu-events/Build | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/build/Build.include b/tools/build/Build.include
index a4bbb984941d..b5c679cd441c 100644
--- a/tools/build/Build.include
+++ b/tools/build/Build.include
@@ -98,4 +98,4 @@ cxx_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(CXXFLAGS) -D"BUILD_STR(s)=\#s" $(CXX
 ###
 ## HOSTCC C flags
 
-host_c_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(CHOSTFLAGS) -D"BUILD_STR(s)=\#s" $(CHOSTFLAGS_$(basetarget).o) $(CHOSTFLAGS_$(obj))
+host_c_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(HOSTCFLAGS) -D"BUILD_STR(s)=\#s" $(HOSTCFLAGS_$(basetarget).o) $(HOSTCFLAGS_$(obj))
diff --git a/tools/perf/pmu-events/Build b/tools/perf/pmu-events/Build
index 17783913d330..215ba30b8534 100644
--- a/tools/perf/pmu-events/Build
+++ b/tools/perf/pmu-events/Build
@@ -1,7 +1,7 @@
 hostprogs := jevents
 
 jevents-y	+= json.o jsmn.o jevents.o
-CHOSTFLAGS_jevents.o	= -I$(srctree)/tools/include
+HOSTCFLAGS_jevents.o	= -I$(srctree)/tools/include
 pmu-events-y	+= pmu-events.o
 JDIR		=  pmu-events/arch/$(SRCARCH)
 JSON		=  $(shell [ -d $(JDIR) ] &&				\
-- 
2.17.1

