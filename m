Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk1-f202.google.com ([209.85.221.202]:38496 "EHLO
        mail-vk1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbfFQI1D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Jun 2019 04:27:03 -0400
Received: by mail-vk1-f202.google.com with SMTP id u202so4497957vku.5
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Jun 2019 01:27:02 -0700 (PDT)
Date: Mon, 17 Jun 2019 01:26:01 -0700
In-Reply-To: <20190617082613.109131-1-brendanhiggins@google.com>
Message-Id: <20190617082613.109131-7-brendanhiggins@google.com>
Mime-Version: 1.0
References: <20190617082613.109131-1-brendanhiggins@google.com>
Subject: [PATCH v5 06/18] kbuild: enable building KUnit
From: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, tytso@mit.edu, yamada.masahiro@socionext.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com, linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org, linux-um@lists.infradead.org, Alexander.Levin@microsoft.com, Tim.Bird@sony.com, amir73il@gmail.com, dan.carpenter@oracle.com, daniel@ffwll.ch, jdike@addtoit.com, joel@jms.id.au, julia.lawall@lip6.fr, khilman@baylibre.com, knut.omang@oracle.com, logang@deltatee.com, mpe@ellerman.id.au, pmladek@suse.com, rdunlap@infradead.org, richard@nod.at, rientjes@google.com, rostedt@goodmis.org, wfg@linux.intel.com, Brendan Higgins <brendanhiggins@google.com>

KUnit is a new unit testing framework for the kernel and when used is
built into the kernel as a part of it. Add KUnit to the root Kconfig and
Makefile to allow it to be actually built.

Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
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
index b81e172612507..4b544a8eebee4 100644
--- a/Makefile
+++ b/Makefile
@@ -991,7 +991,7 @@ endif
 PHONY += prepare0
 
 ifeq ($(KBUILD_EXTMOD),)
-core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/
+core-y		+= kernel/ certs/ mm/ fs/ ipc/ security/ crypto/ block/ kunit/
 
 vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
 		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
-- 
2.22.0.410.gd8fdbe21b5-goog
