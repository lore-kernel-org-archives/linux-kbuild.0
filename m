Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:28353 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgD0QE0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Apr 2020 12:04:26 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: warn if always, hostprogs-y, or hostprogs-m is used
Date: Tue, 28 Apr 2020 01:03:57 +0900
Message-Id: <20200427160357.253085-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

always, hostprogs-y, and hostprogs-m are deprecated.

There is no user in upstream code, but I am keeping them for external
modules. I want to remove them entirely someday. Notify the deprecation
to downstream users.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cd52a8c6428f..f869a4b2646c 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -4,8 +4,14 @@ asflags-y  += $(EXTRA_AFLAGS)
 ccflags-y  += $(EXTRA_CFLAGS)
 cppflags-y += $(EXTRA_CPPFLAGS)
 ldflags-y  += $(EXTRA_LDFLAGS)
+ifneq ($(always),)
+$(warning 'always' is deprecated. Please use 'always-y' instead)
 always-y   += $(always)
+endif
+ifneq ($(hostprogs-y)$(hostprogs-m),)
+$(warning 'hostprogs-y' and 'hostprogs-m' are deprecated. Please use 'hostprogs' instead)
 hostprogs  += $(hostprogs-y) $(hostprogs-m)
+endif
 
 # flags that take effect in current and sub directories
 KBUILD_AFLAGS += $(subdir-asflags-y)
-- 
2.25.1
