Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:39498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732709AbfJRWHT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Oct 2019 18:07:19 -0400
From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 077/100] kbuild: fix build error of 'make nsdeps' in clean tree
Date: Fri, 18 Oct 2019 18:05:02 -0400
Message-Id: <20191018220525.9042-77-sashal@kernel.org>
In-Reply-To: <20191018220525.9042-1-sashal@kernel.org>
References: <20191018220525.9042-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Maennich <maennich@google.com>, Jessica Yu <jeyu@kernel.org>, Sasha Levin <sashal@kernel.org>, linux-kbuild@vger.kernel.org

From: Masahiro Yamada <yamada.masahiro@socionext.com>

[ Upstream commit d85103ac78a6d8573b21348b36f4cca2e1839a31 ]

Running 'make nsdeps' in a clean source tree fails as follows:

$ make -s clean; make -s defconfig; make nsdeps
   [ snip ]
awk: fatal: cannot open file `init/modules.order' for reading (No such file or directory)
make: *** [Makefile;1307: modules.order] Error 2
make: *** Deleting file 'modules.order'
make: *** Waiting for unfinished jobs....

The cause of the error is 'make nsdeps' does not build modules at all.
Set KBUILD_MODULES to fix it.

Reviewed-by: Matthias Maennich <maennich@google.com>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Jessica Yu <jeyu@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4d29c7370b464..80f169534c4a7 100644
--- a/Makefile
+++ b/Makefile
@@ -566,7 +566,7 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all _all modules,$(MAKECMDGOALS)),)
+ifneq ($(filter all _all modules nsdeps,$(MAKECMDGOALS)),)
   KBUILD_MODULES := 1
 endif
 
-- 
2.20.1
