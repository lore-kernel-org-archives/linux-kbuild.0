Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:30962 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbgD2Dqg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Apr 2020 23:46:36 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 09/15] samples: connector: build sample program for target architecture
Date: Wed, 29 Apr 2020 12:45:21 +0900
Message-Id: <20200429034527.590520-10-masahiroy@kernel.org>
In-Reply-To: <20200429034527.590520-1-masahiroy@kernel.org>
References: <20200429034527.590520-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: bpf <bpf@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

This userspace program includes UAPI headers exported to usr/include/.
'make headers' always works for the target architecture (i.e. the same
architecture as the kernel), so the sample program should be built for
the target as well. Kbuild now supports 'userprogs' for that.

$(CC) can always compile cn_text.o since it is the kenrel-space code,
but building ucon requires libc.

I guarded it by:

  always-$(CONFIG_CC_CAN_LINK) := $(userprogs)

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

Changes in v2: None

 samples/connector/Makefile | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/samples/connector/Makefile b/samples/connector/Makefile
index b785cbde5ffa..50cb40e09a7b 100644
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
+userccflags += -I usr/include
-- 
2.25.1
