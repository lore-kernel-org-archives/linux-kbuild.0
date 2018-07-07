Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:41764 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754111AbeGGBH0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Jul 2018 21:07:26 -0400
Received: by mail-qt0-f194.google.com with SMTP id y20-v6so11402447qto.8
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Jul 2018 18:07:26 -0700 (PDT)
From: Laura Abbott <labbott@redhat.com>
Subject: [PATCH 1/7] tools: build: Fixup host c flags
Date: Fri,  6 Jul 2018 18:07:03 -0700
Message-Id: <20180707010709.16648-2-labbott@redhat.com>
In-Reply-To: <20180707010709.16648-1-labbott@redhat.com>
References: <20180707010709.16648-1-labbott@redhat.com>
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
This seemed like a typo to the best of my understanding and certain
things wouldn't link properly until this was fixed.
---
 tools/build/Build.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/build/Build.include b/tools/build/Build.include
index a4bbb984941d..b5c679cd441c 100644
--- a/tools/build/Build.include
+++ b/tools/build/Build.include
@@ -98,4 +98,4 @@ cxx_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(CXXFLAGS) -D"BUILD_STR(s)=\#s" $(CXX
 ###
 ## HOSTCC C flags
 
-host_c_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(CHOSTFLAGS) -D"BUILD_STR(s)=\#s" $(CHOSTFLAGS_$(basetarget).o) $(CHOSTFLAGS_$(obj))
+host_c_flags = -Wp,-MD,$(depfile) -Wp,-MT,$@ $(HOSTCFLAGS) -D"BUILD_STR(s)=\#s" $(HOSTCFLAGS_$(basetarget).o) $(HOSTCFLAGS_$(obj))
-- 
2.17.1

