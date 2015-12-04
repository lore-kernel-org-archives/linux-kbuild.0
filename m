Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:53852 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753012AbbLDP0r (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Dec 2015 10:26:47 -0500
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH v2 1/8] tags: Treat header files as C code
Date: Fri,  4 Dec 2015 16:26:20 +0100
Message-Id: <1449242787-16598-2-git-send-email-mmarek@suse.com>
In-Reply-To: <1449242787-16598-1-git-send-email-mmarek@suse.com>
References: <1449242787-16598-1-git-send-email-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

This allows to apply the same patters to both source and header files.
The effect is mostly visible in the case of DECLARE_BITMAP, but there
are small gains all over the place. There is also lots of random changes
in the diff, I believe this is simply because there are still lots of
unexpanded macros in the code and the C and C++ parsers fail and recover
at different points. Also, qconf.h is parsed as C, but that's a
negligible regression.

Signed-off-by: Michal Marek <mmarek@suse.com>
---
v2: Rebased on current linux-next

 scripts/tags.sh | 64 ++++++++++++++++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/scripts/tags.sh b/scripts/tags.sh
index 3df83161da56..abcf43eed874 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -165,41 +165,41 @@ exuberant()
 	-I EXPORT_SYMBOL,EXPORT_SYMBOL_GPL,ACPI_EXPORT_SYMBOL   \
 	-I DEFINE_TRACE,EXPORT_TRACEPOINT_SYMBOL,EXPORT_TRACEPOINT_SYMBOL_GPL \
 	-I static,const						\
-	--extra=+f --c-kinds=+px                                \
+	--extra=+f --c-kinds=+px --langmap=c:+.h                \
 	--regex-asm='/^(ENTRY|_GLOBAL)\(([^)]*)\).*/\2/'        \
 	--regex-c='/^SYSCALL_DEFINE[[:digit:]]?\(([^,)]*).*/sys_\1/' \
 	--regex-c='/^COMPAT_SYSCALL_DEFINE[[:digit:]]?\(([^,)]*).*/compat_sys_\1/' \
-	--regex-c++='/^TRACE_EVENT\(([^,)]*).*/trace_\1/'		\
-	--regex-c++='/^TRACE_EVENT\(([^,)]*).*/trace_\1_rcuidle/'	\
-	--regex-c++='/^DEFINE_EVENT\([^,)]*, *([^,)]*).*/trace_\1/'	\
-	--regex-c++='/^DEFINE_EVENT\([^,)]*, *([^,)]*).*/trace_\1_rcuidle/' \
-	--regex-c++='/PAGEFLAG\(([^,)]*).*/Page\1/'			\
-	--regex-c++='/PAGEFLAG\(([^,)]*).*/SetPage\1/'			\
-	--regex-c++='/PAGEFLAG\(([^,)]*).*/ClearPage\1/'		\
-	--regex-c++='/TESTSETFLAG\(([^,)]*).*/TestSetPage\1/'		\
-	--regex-c++='/TESTPAGEFLAG\(([^,)]*).*/Page\1/'			\
-	--regex-c++='/SETPAGEFLAG\(([^,)]*).*/SetPage\1/'		\
-	--regex-c++='/__SETPAGEFLAG\(([^,)]*).*/__SetPage\1/'		\
-	--regex-c++='/TESTCLEARFLAG\(([^,)]*).*/TestClearPage\1/'	\
-	--regex-c++='/__TESTCLEARFLAG\(([^,)]*).*/TestClearPage\1/'	\
-	--regex-c++='/CLEARPAGEFLAG\(([^,)]*).*/ClearPage\1/'		\
-	--regex-c++='/__CLEARPAGEFLAG\(([^,)]*).*/__ClearPage\1/'	\
-	--regex-c++='/__PAGEFLAG\(([^,)]*).*/__SetPage\1/'		\
-	--regex-c++='/__PAGEFLAG\(([^,)]*).*/__ClearPage\1/'		\
-	--regex-c++='/PAGEFLAG_FALSE\(([^,)]*).*/Page\1/'		\
-	--regex-c++='/TESTSCFLAG\(([^,)]*).*/TestSetPage\1/'		\
-	--regex-c++='/TESTSCFLAG\(([^,)]*).*/TestClearPage\1/'		\
-	--regex-c++='/SETPAGEFLAG_NOOP\(([^,)]*).*/SetPage\1/'		\
-	--regex-c++='/CLEARPAGEFLAG_NOOP\(([^,)]*).*/ClearPage\1/'	\
-	--regex-c++='/__CLEARPAGEFLAG_NOOP\(([^,)]*).*/__ClearPage\1/'	\
-	--regex-c++='/TESTCLEARFLAG_FALSE\(([^,)]*).*/TestClearPage\1/' \
-	--regex-c++='/_PE\(([^,)]*).*/PEVENT_ERRNO__\1/'		\
-	--regex-c++='/TASK_PFA_TEST\([^,]*,\s*([^)]*)\)/task_\1/'	\
-	--regex-c++='/TASK_PFA_SET\([^,]*,\s*([^)]*)\)/task_set_\1/'	\
-	--regex-c++='/TASK_PFA_CLEAR\([^,]*,\s*([^)]*)\)/task_clear_\1/'\
-	--regex-c++='/DEF_MMIO_(IN|OUT)_(X|D)\(([^,]*),\s*[^)]*\)/\3/'	\
-	--regex-c++='/DEBUGGER_BOILERPLATE\(([^,]*)\)/\1/'		\
-	--regex-c++='/DEF_PCI_AC_(NO)?RET\(([^,]*),.*/\2/'		\
+	--regex-c='/^TRACE_EVENT\(([^,)]*).*/trace_\1/'			\
+	--regex-c='/^TRACE_EVENT\(([^,)]*).*/trace_\1_rcuidle/'		\
+	--regex-c='/^DEFINE_EVENT\([^,)]*, *([^,)]*).*/trace_\1/'	\
+	--regex-c='/^DEFINE_EVENT\([^,)]*, *([^,)]*).*/trace_\1_rcuidle/' \
+	--regex-c='/PAGEFLAG\(([^,)]*).*/Page\1/'			\
+	--regex-c='/PAGEFLAG\(([^,)]*).*/SetPage\1/'			\
+	--regex-c='/PAGEFLAG\(([^,)]*).*/ClearPage\1/'			\
+	--regex-c='/TESTSETFLAG\(([^,)]*).*/TestSetPage\1/'		\
+	--regex-c='/TESTPAGEFLAG\(([^,)]*).*/Page\1/'			\
+	--regex-c='/SETPAGEFLAG\(([^,)]*).*/SetPage\1/'			\
+	--regex-c='/__SETPAGEFLAG\(([^,)]*).*/__SetPage\1/'		\
+	--regex-c='/TESTCLEARFLAG\(([^,)]*).*/TestClearPage\1/'		\
+	--regex-c='/__TESTCLEARFLAG\(([^,)]*).*/TestClearPage\1/'	\
+	--regex-c='/CLEARPAGEFLAG\(([^,)]*).*/ClearPage\1/'		\
+	--regex-c='/__CLEARPAGEFLAG\(([^,)]*).*/__ClearPage\1/'		\
+	--regex-c='/__PAGEFLAG\(([^,)]*).*/__SetPage\1/'		\
+	--regex-c='/__PAGEFLAG\(([^,)]*).*/__ClearPage\1/'		\
+	--regex-c='/PAGEFLAG_FALSE\(([^,)]*).*/Page\1/'			\
+	--regex-c='/TESTSCFLAG\(([^,)]*).*/TestSetPage\1/'		\
+	--regex-c='/TESTSCFLAG\(([^,)]*).*/TestClearPage\1/'		\
+	--regex-c='/SETPAGEFLAG_NOOP\(([^,)]*).*/SetPage\1/'		\
+	--regex-c='/CLEARPAGEFLAG_NOOP\(([^,)]*).*/ClearPage\1/'	\
+	--regex-c='/__CLEARPAGEFLAG_NOOP\(([^,)]*).*/__ClearPage\1/'	\
+	--regex-c='/TESTCLEARFLAG_FALSE\(([^,)]*).*/TestClearPage\1/' \
+	--regex-c='/_PE\(([^,)]*).*/PEVENT_ERRNO__\1/'		\
+	--regex-c='/TASK_PFA_TEST\([^,]*,\s*([^)]*)\)/task_\1/'	\
+	--regex-c='/TASK_PFA_SET\([^,]*,\s*([^)]*)\)/task_set_\1/'	\
+	--regex-c='/TASK_PFA_CLEAR\([^,]*,\s*([^)]*)\)/task_clear_\1/'\
+	--regex-c='/DEF_MMIO_(IN|OUT)_(X|D)\(([^,]*),\s*[^)]*\)/\3/'	\
+	--regex-c='/DEBUGGER_BOILERPLATE\(([^,]*)\)/\1/'		\
+	--regex-c='/DEF_PCI_AC_(NO)?RET\(([^,]*),.*/\2/'		\
 	--regex-c='/PCI_OP_READ\((\w*).*[1-4]\)/pci_bus_read_config_\1/' \
 	--regex-c='/PCI_OP_WRITE\((\w*).*[1-4]\)/pci_bus_write_config_\1/' \
 	--regex-c='/DEFINE_(MUTEX|SEMAPHORE|SPINLOCK)\((\w*)/\2/v/'	\
-- 
2.1.4

