Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:25317 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752728AbdI3BKf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2017 21:10:35 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 9/9] kbuild: rpm-pkg: do not force -jN in submake
Date: Sat, 30 Sep 2017 10:10:11 +0900
Message-Id: <1506733811-24636-9-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
References: <1506733811-24636-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

The spec file always passes %{?_smp_mflags}, but we have two
problems here.

[1] "make -jN rpm-pkg" emits the following warning message:

    make[2]: warning: -jN forced in submake: disabling jobserver mode.

[2] We can not specify the number of jobs that run in parallel.
    Whether we give -jN or not from the top Makefile, the spec file
    always passes ${?_smp_mflags} to the build commands.

${?_smp_mflags} will be useful when we run rpmbuild by hand.  When we
invoke it from Makefile, -jN is propagated down to submake; it should
not be overridden because we want to respect the number of jobs given
by the user.  Set _smp_mflags to empty string in this case.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/package/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 70eea1e..9ed96aef 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -50,7 +50,8 @@ rpm-pkg rpm: FORCE
 	$(MAKE) clean
 	$(CONFIG_SHELL) $(MKSPEC) >$(objtree)/kernel.spec
 	$(call cmd,src_tar,$(KERNELPATH),kernel.spec)
-	+rpmbuild $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz
+	+rpmbuild $(RPMOPTS) --target $(UTS_MACHINE) -ta $(KERNELPATH).tar.gz \
+	--define='_smp_mflags %{nil}'
 
 # binrpm-pkg
 # ---------------------------------------------------------------------------
-- 
2.7.4

