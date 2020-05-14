Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729159AbgENSy6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 May 2020 14:54:58 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.14 01/39] Makefile: disallow data races on gcc-10 as well
Date: Thu, 14 May 2020 14:54:18 -0400
Message-Id: <20200514185456.21060-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Sergei Trofimovich <slyfox@gentoo.org>, Jiri Kosina <jkosina@suse.cz>, Masahiro Yamada <masahiroy@kernel.org>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Sergei Trofimovich <slyfox@gentoo.org>

[ Upstream commit b1112139a103b4b1101d0d2d72931f2d33d8c978 ]

gcc-10 will rename --param=allow-store-data-races=0
to -fno-allow-store-data-races.

The flag change happened at https://gcc.gnu.org/PR92046.

Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
Acked-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 525565f44b171..35640d40a7845 100644
--- a/Makefile
+++ b/Makefile
@@ -670,6 +670,7 @@ KBUILD_CFLAGS += $(call cc-ifversion, -lt, 0409, \
 
 # Tell gcc to never replace conditional load with a non-conditional one
 KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
+KBUILD_CFLAGS	+= $(call cc-option,-fno-allow-store-data-races)
 
 # check for 'asm goto'
 ifeq ($(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)), y)
-- 
2.20.1
