Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:17155 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727341AbfD0Ddv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Apr 2019 23:33:51 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/5] samples: seccomp: turn CONFIG_SAMPLE_SECCOMP into a bool option
Date: Sat, 27 Apr 2019 12:33:39 +0900
Message-Id: <1556336020-15634-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1556336020-15634-1-git-send-email-yamada.masahiro@socionext.com>
References: <1556336020-15634-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

The prompt of CONFIG_SAMPLE_SECCOMP claims this is "loadable module
only", which is invalid.

samples/seccomp/ only contains host programs, so having it tristate
is pointless.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 samples/Kconfig          | 4 ++--
 samples/seccomp/Makefile | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index d19754c..b98a763 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -103,8 +103,8 @@ config SAMPLE_CONNECTOR
 	  See also Documentation/connector/connector.txt
 
 config SAMPLE_SECCOMP
-	tristate "Build seccomp sample code -- loadable modules only"
-	depends on SECCOMP_FILTER && m
+	bool "Build seccomp sample code"
+	depends on SECCOMP_FILTER
 	help
 	  Build samples of seccomp filters using various methods of
 	  BPF filter construction.
diff --git a/samples/seccomp/Makefile b/samples/seccomp/Makefile
index fb43a81..00e0b5e 100644
--- a/samples/seccomp/Makefile
+++ b/samples/seccomp/Makefile
@@ -40,5 +40,5 @@ HOSTLDLIBS_bpf-fancy += $(MFLAG)
 HOSTLDLIBS_dropper += $(MFLAG)
 HOSTLDLIBS_user-trap += $(MFLAG)
 endif
-always := $(hostprogs-m)
+always := $(hostprogs-y)
 endif
-- 
2.7.4
