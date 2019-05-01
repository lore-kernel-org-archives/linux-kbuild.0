Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw1-f73.google.com ([209.85.161.73]:36146 "EHLO
        mail-yw1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726405AbfEAXDw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 May 2019 19:03:52 -0400
Received: by mail-yw1-f73.google.com with SMTP id j62so1157800ywe.3
        for <linux-kbuild@vger.kernel.org>; Wed, 01 May 2019 16:03:51 -0700 (PDT)
Date: Wed,  1 May 2019 16:01:15 -0700
In-Reply-To: <20190501230126.229218-1-brendanhiggins@google.com>
Message-Id: <20190501230126.229218-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
Subject: [PATCH v2 06/17] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, dan.j.williams@intel.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>

Add KUnit to root Kconfig and Makefile allowing it to actually be built.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
---
 Kconfig  | 2 ++
 Makefile | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Kconfig b/Kconfig
index 48a80beab6853..10428501edb78 100644
--- a/Kconfig
+++ b/Kconfig
@@ -30,3 +30,5 @@ source "crypto/Kconfig"
 source "lib/Kconfig"
 
 source "lib/Kconfig.debug"
+
+source "kunit/Kconfig"
diff --git a/Makefile b/Makefile
index 2b99679148dc7..77368f498d84c 100644
--- a/Makefile
+++ b/Makefile
@@ -969,7 +969,7 @@ endif
 PHONY += prepare0
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-- 
2.21.0.593.g511ec345e18-goog
