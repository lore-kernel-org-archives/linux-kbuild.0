Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:31738 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726639AbgDWHkb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 03:40:31 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 10/16] samples: connector: build sample program for target architecture
Date: Thu, 23 Apr 2020 16:39:23 +0900
Message-Id: <20200423073929.127521-11-masahiroy@kernel.org>
In-Reply-To: <20200423073929.127521-1-masahiroy@kernel.org>
References: <20200423073929.127521-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org

This userspace program includes UAPI headers exported to usr/include/.
'make headers' always works for the target architecture (i.e. the same
architecture as the kernel), so the sample program must be built for
the target as well. Kbuild now supports the 'userprogs' syntax to
describe it cleanly.

$(CC) can always compile cn_text.o since it is the kenrel-space code,
but building ucon requires libc.

I guarded it by:

  always-$(CONFIG_CC_CAN_LINK) := $(userprogs)

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 samples/connector/Makefile | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/samples/connector/Makefile b/samples/connector/Makefile
index b785cbde5ffa..7b5117e96fd0 100644
--- a/samples/connector/Makefile
+++ b/samples/connector/Makefile
@@ -1,13 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_SAMPLE_CONNECTOR) += cn_test.o
 
-# List of programs to build
-hostprogs := ucon
-always-y := $(hostprogs)
+userprogs := ucon
+always-$(CONFIG_CC_CAN_LINK) := $(userprogs)
 
-HOSTCFLAGS_ucon.o += -I$(objtree)/usr/include
-
-all: modules
-
-modules clean:
-	$(MAKE) -C ../.. M=$(CURDIR) $@
+user-ccflags += -I usr/include
-- 
2.25.1
