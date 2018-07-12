Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:38055 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732298AbeGLW2q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Jul 2018 18:28:46 -0400
Received: from ben by shadbolt.decadent.org.uk with local (Exim 4.84_2)
        (envelope-from <ben@decadent.org.uk>)
        id 1fdjte-0007jO-QC
        for linux-kbuild@vger.kernel.org; Thu, 12 Jul 2018 23:17:11 +0100
Date: Thu, 12 Jul 2018 23:17:10 +0100
From: Ben Hutchings <ben@decadent.org.uk>
Message-ID: <20180712221710.GI14131@decadent.org.uk>
References: <20180712221619.GH14131@decadent.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180712221619.GH14131@decadent.org.uk>
Subject: [RFC PATCH 1/3] kbuild: Move final argument to modpost into
 $(cmd_modpost)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

The following changes to the definition of $(cmd) will require that it
is given a complete command line, and no additional arguments can be
appended..

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 scripts/Makefile.modpost | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index df4174405feb..4e56df933b79 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -85,11 +85,11 @@ MODPOST_OPT=$(subst -i,-n,$(filter -i,$(MAKEFLAGS)))
 
 # We can go over command line length here, so be careful.
 quiet_cmd_modpost = MODPOST $(words $(filter-out vmlinux FORCE, $^)) modules
-      cmd_modpost = $(MODLISTCMD) | sed 's/\.ko$$/.o/' | $(modpost) $(MODPOST_OPT) -s -T -
+      cmd_modpost = $(MODLISTCMD) | sed 's/\.ko$$/.o/' | $(modpost) $(MODPOST_OPT) -s -T - $(wildcard vmlinux)
 
 PHONY += __modpost
 __modpost: $(modules:.ko=.o) FORCE
-	$(call cmd,modpost) $(wildcard vmlinux)
+	$(call cmd,modpost)
 
 quiet_cmd_kernel-mod = MODPOST $@
       cmd_kernel-mod = $(modpost) $@

