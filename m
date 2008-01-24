Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:37448 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757064AbYAXWEF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 24 Jan 2008 17:04:05 -0500
From: Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 43/77] kbuild: scripts/mkmakefile: dynamic determination of output directory
Date: Thu, 24 Jan 2008 23:03:24 +0100
Message-Id: <1201212238-4369-43-git-send-email-sam@ravnborg.org>
In-Reply-To: <20080124215813.GA4204@uranus.ravnborg.org>
References: <20080124215813.GA4204@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Jan Beulich <jbeulich@novell.com>, Sam Ravnborg <sam@ravnborg.org>

From: Jan Beulich <jbeulich@novell.com>

Rather than fixing the output directory in the generated Makefile,
determine it from the placement of Makefile. This allows moving
the build tree around or accessing it through different mount paths.

(The lastword definition is a compatibility one for make prior to 3.81;
newer make will simply ignore it and use the [faster] built-in.)

Signed-off-by: Jan Beulich <jbeulich@novell.com>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
---
 scripts/mkmakefile |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/mkmakefile b/scripts/mkmakefile
index e0f54b9..e65d8b3 100644
--- a/scripts/mkmakefile
+++ b/scripts/mkmakefile
@@ -25,8 +25,11 @@ cat << EOF > $2/Makefile
 VERSION = $3
 PATCHLEVEL = $4
 
-KERNELSRC    := $1
-KERNELOUTPUT := $2
+lastword = \$(word \$(words \$(1)),\$(1))
+makedir := \$(dir \$(call lastword,\$(MAKEFILE_LIST)))
+
+MAKEARGS := -C $1
+MAKEARGS += O=\$(if \$(patsubst /%,,\$(makedir)),\$(CURDIR)/)\$(patsubst %/,%,\$(makedir))
 
 MAKEFLAGS += --no-print-directory
 
@@ -35,10 +38,11 @@ MAKEFLAGS += --no-print-directory
 all	:= \$(filter-out all Makefile,\$(MAKECMDGOALS))
 
 all:
-	\$(MAKE) -C \$(KERNELSRC) O=\$(KERNELOUTPUT) \$(all)
+	\$(MAKE) \$(MAKEARGS) \$(all)
 
 Makefile:;
 
 \$(all) %/: all
 	@:
+
 EOF
-- 
1.5.4.rc3.14.g44397

