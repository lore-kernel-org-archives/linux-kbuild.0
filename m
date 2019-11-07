Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131]:40285 "EHLO
        out30-131.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731082AbfKGOdC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 09:33:02 -0500
From: shile.zhang@linux.alibaba.com
Subject: [RFC PATCH 2/4] kbuild: Sort ORC unwind tables in vmlinux link process
Date: Thu,  7 Nov 2019 22:32:03 +0800
Message-Id: <20191107143205.206606-3-shile.zhang@linux.alibaba.com>
In-Reply-To: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
References: <20191107143205.206606-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@redhat.com>, x86@kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Shile Zhang <shile.zhang@linux.alibaba.com>

From: Shile Zhang <shile.zhang@linux.alibaba.com>

To sort the ORC unwind tables in vmlinux link process, controlled
by configure BUILDTIME_ORCTABLE_SORT.

Signed-off-by: Shile Zhang <shile.zhang@linux.alibaba.com>
---
 scripts/link-vmlinux.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 06495379fcd8..43fe8c151c8d 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -183,6 +183,11 @@ sortextable()
 	${objtree}/scripts/sortextable ${1}
 }
 
+sortorctable()
+{
+	${objtree}/scripts/sortorctable ${1}
+}
+
 # Delete output files in case of error
 cleanup()
 {
@@ -303,6 +308,11 @@ if [ -n "${CONFIG_BUILDTIME_EXTABLE_SORT}" ]; then
 	sortextable vmlinux
 fi
 
+if [ -n "${CONFIG_BUILDTIME_ORCTABLE_SORT}" ]; then
+	info SORTORC vmlinux
+	sortorctable vmlinux
+fi
+
 info SYSMAP System.map
 mksysmap vmlinux System.map
 
-- 
2.24.0.rc2
