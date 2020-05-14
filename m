Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727983AbgENSvy (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 May 2020 14:51:54 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.6 03/62] Makefile: disallow data races on gcc-10 as well
Date: Thu, 14 May 2020 14:50:48 -0400
Message-Id: <20200514185147.19716-3-sashal@kernel.org>
In-Reply-To: <20200514185147.19716-1-sashal@kernel.org>
References: <20200514185147.19716-1-sashal@kernel.org>
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
index 6a8f0b278f1bb..744245f0c96cf 100644
--- a/Makefile
+++ b/Makefile
@@ -714,6 +714,7 @@ endif
 
 # Tell gcc to never replace conditional load with a non-conditional one
 KBUILD_CFLAGS	+= $(call cc-option,--param=allow-store-data-races=0)
+KBUILD_CFLAGS	+= $(call cc-option,-fno-allow-store-data-races)
 
 include scripts/Makefile.kcov
 include scripts/Makefile.gcc-plugins
-- 
2.20.1
