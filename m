Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55013 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753122AbbJOUR1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Oct 2015 16:17:27 -0400
From: Michal Marek <mmarek@suse.com>
Subject: [PATCH 8/9] tags: Unify emacs and exuberant rules
Date: Thu, 15 Oct 2015 22:16:34 +0200
Message-Id: <1444940195-28272-9-git-send-email-mmarek@suse.com>
In-Reply-To: <1444940195-28272-1-git-send-email-mmarek@suse.com>
References: <1444940195-28272-1-git-send-email-mmarek@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

The emacs rules were constantly lagging behind the exuberant ones. Use a
single set of rules for both, to make the script easier to maintain.
The language understood by both tools is basic regular expression with
some limitations, which are documented in a comment. To be able to store
the rules in an array and easily iterate over it, the script requires
bash now. In the exuberant case, the change fixes some false matches in
<linux/page-flags.h> and also some too greedy matches in the arguments
of the DECLARE_*/DEFINE_* macros. In the emacs case, several previously
not working rules are matching now. Tested with these versions of the
tools:

  Exuberant Ctags 5.8, Copyright (C) 1996-2009 Darren Hiebert
  etags (GNU Emacs 24.5)

Signed-off-by: Michal Marek <mmarek@suse.com>
---
 scripts/tags.sh | 200 ++++++++++++++++++++++++++++++--------------------------
 1 file changed, 108 insertions(+), 92 deletions(-)
 mode change 100755 => 100644 scripts/tags.sh

diff --git a/scripts/tags.sh b/scripts/tags.sh
old mode 100755
new mode 100644
index 06246b64c0a1..4979ab645e5e
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 # Generate tags or cscope files
 # Usage tags.sh <mode>
 #
@@ -145,8 +145,107 @@ dogtags()
 	all_target_sources | gtags -i -f -
 }
 
+# Basic regular expressions with an optional /kind-spec/ for ctags and
+# the following limitations:
+# - No regex modifiers
+# - Use \{0,1\} instead of \?, because etags expects an unescaped ?
+# - \s is not working with etags, use a space or [ \t]
+# - \w works, but does not match underscores in etags
+# - etags regular expressions have to match at the start of a line;
+#   a ^[^#] is prepended by setup_regex unless an anchor is already present
+regex_asm=(
+	'/^\(ENTRY\|_GLOBAL\)(\([[:alnum:]_\\]*\)).*/\2/'
+)
+regex_c=(
+	'/^SYSCALL_DEFINE[0-9](\([[:alnum:]_]*\).*/sys_\1/'
+	'/^COMPAT_SYSCALL_DEFINE[0-9](\([[:alnum:]_]*\).*/compat_sys_\1/'
+	'/^TRACE_EVENT(\([[:alnum:]_]*\).*/trace_\1/'
+	'/^TRACE_EVENT(\([[:alnum:]_]*\).*/trace_\1_rcuidle/'
+	'/^DEFINE_EVENT([^,)]*, *\([[:alnum:]_]*\).*/trace_\1/'
+	'/^DEFINE_EVENT([^,)]*, *\([[:alnum:]_]*\).*/trace_\1_rcuidle/'
+	'/^PAGEFLAG(\([[:alnum:]_]*\).*/Page\1/'
+	'/^PAGEFLAG(\([[:alnum:]_]*\).*/SetPage\1/'
+	'/^PAGEFLAG(\([[:alnum:]_]*\).*/ClearPage\1/'
+	'/^TESTSETFLAG(\([[:alnum:]_]*\).*/TestSetPage\1/'
+	'/^TESTPAGEFLAG(\([[:alnum:]_]*\).*/Page\1/'
+	'/^SETPAGEFLAG(\([[:alnum:]_]*\).*/SetPage\1/'
+	'/\<__SETPAGEFLAG(\([[:alnum:]_]*\).*/__SetPage\1/'
+	'/\<TESTCLEARFLAG(\([[:alnum:]_]*\).*/TestClearPage\1/'
+	'/\<__TESTCLEARFLAG(\([[:alnum:]_]*\).*/TestClearPage\1/'
+	'/\<CLEARPAGEFLAG(\([[:alnum:]_]*\).*/ClearPage\1/'
+	'/\<__CLEARPAGEFLAG(\([[:alnum:]_]*\).*/__ClearPage\1/'
+	'/^__PAGEFLAG(\([[:alnum:]_]*\).*/__SetPage\1/'
+	'/^__PAGEFLAG(\([[:alnum:]_]*\).*/__ClearPage\1/'
+	'/^PAGEFLAG_FALSE(\([[:alnum:]_]*\).*/Page\1/'
+	'/\<TESTSCFLAG(\([[:alnum:]_]*\).*/TestSetPage\1/'
+	'/\<TESTSCFLAG(\([[:alnum:]_]*\).*/TestClearPage\1/'
+	'/\<SETPAGEFLAG_NOOP(\([[:alnum:]_]*\).*/SetPage\1/'
+	'/\<CLEARPAGEFLAG_NOOP(\([[:alnum:]_]*\).*/ClearPage\1/'
+	'/\<__CLEARPAGEFLAG_NOOP(\([[:alnum:]_]*\).*/__ClearPage\1/'
+	'/\<TESTCLEARFLAG_FALSE(\([[:alnum:]_]*\).*/TestClearPage\1/'
+	'/\<__TESTCLEARFLAG_FALSE(\([[:alnum:]_]*\).*/__TestClearPage\1/'
+	'/^TASK_PFA_TEST([^,]*, *\([[:alnum:]_]*\))/task_\1/'
+	'/^TASK_PFA_SET([^,]*, *\([[:alnum:]_]*\))/task_set_\1/'
+	'/^TASK_PFA_CLEAR([^,]*, *\([[:alnum:]_]*\))/task_clear_\1/'
+	'/^DEF_MMIO_\(IN\|OUT\)_[XD](\([[:alnum:]_]*\),[^)]*)/\2/'
+	'/^DEBUGGER_BOILERPLATE(\([[:alnum:]_]*\))/\1/'
+	'/^PCI_OP_READ(\(\w*\).*[1-4])/pci_bus_read_config_\1/'
+	'/^PCI_OP_WRITE(\(\w*\).*[1-4])/pci_bus_write_config_\1/'
+	'/\<DEFINE_\(MUTEX\|SEMAPHORE\|SPINLOCK\)(\([[:alnum:]_]*\)/\2/v/'
+	'/\<DEFINE_\(RAW_SPINLOCK\|RWLOCK\|SEQLOCK\)(\([[:alnum:]_]*\)/\2/v/'
+	'/\<DECLARE_\(RWSEM\|COMPLETION\)(\([[:alnum:]_]\+\)/\2/v/'
+	'/\<DECLARE_BITMAP(\([[:alnum:]_]*\)/\1/v/'
+	'/\(^\|\s\)\(\|L\|H\)LIST_HEAD(\([[:alnum:]_]*\)/\3/v/'
+	'/\(^\|\s\)RADIX_TREE(\([[:alnum:]_]*\)/\2/v/'
+	'/\<DEFINE_PER_CPU([^,]*, *\([[:alnum:]_]*\)/\1/v/'
+	'/\<DEFINE_PER_CPU_SHARED_ALIGNED([^,]*, *\([[:alnum:]_]*\)/\1/v/'
+	'/\<DECLARE_WAIT_QUEUE_HEAD(\([[:alnum:]_]*\)/\1/v/'
+	'/\<DECLARE_\(TASKLET\|WORK\|DELAYED_WORK\)(\([[:alnum:]_]*\)/\2/v/'
+	'/\<DEFINE_PCI_DEVICE_TABLE(\([[:alnum:]_]*\)/\1/v/'
+	'/\(^\s\)OFFSET(\([[:alnum:]_]*\)/\2/v/'
+	'/\(^\s\)DEFINE(\([[:alnum:]_]*\)/\2/v/'
+	'/\<DEFINE_HASHTABLE(\([[:alnum:]_]*\)/\1/v/'
+)
+regex_kconfig=(
+	'/^[[:blank:]]*\(menu\|\)config[[:blank:]]\+\([[:alnum:]_]\+\)/\2/'
+	'/^[[:blank:]]*\(menu\|\)config[[:blank:]]\+\([[:alnum:]_]\+\)/CONFIG_\2/'
+)
+setup_regex()
+{
+	local mode=$1 lang tmp=() r
+	shift
+
+	regex=()
+	for lang; do
+		case "$lang" in
+		asm)       tmp=("${regex_asm[@]}") ;;
+		c)         tmp=("${regex_c[@]}") ;;
+		kconfig)   tmp=("${regex_kconfig[@]}") ;;
+		esac
+		for r in "${tmp[@]}"; do
+			if test "$mode" = "exuberant"; then
+				regex[${#regex[@]}]="--regex-$lang=${r}b"
+			else
+				# Remove ctags /kind-spec/
+				case "$r" in
+				/*/*/?/)
+					r=${r%?/}
+				esac
+				# Prepend ^[^#] unless already anchored
+				case "$r" in
+				/^*) ;;
+				*)
+					r="/^[^#]*${r#/}"
+				esac
+				regex[${#regex[@]}]="--regex=$r"
+			fi
+		done
+	done
+}
+
 exuberant()
 {
+	setup_regex exuberant asm c
 	all_target_sources | xargs $1 -a                        \
 	-I __initdata,__exitdata,__initconst,			\
 	-I __initdata_memblock					\
@@ -160,104 +259,21 @@ exuberant()
 	-I EXPORT_SYMBOL,EXPORT_SYMBOL_GPL,ACPI_EXPORT_SYMBOL   \
 	-I DEFINE_TRACE,EXPORT_TRACEPOINT_SYMBOL,EXPORT_TRACEPOINT_SYMBOL_GPL \
 	-I static,const						\
-	--extra=+f --c-kinds=+px --langmap=c:+.h                \
-	--regex-asm='/^(ENTRY|_GLOBAL)\(([^)]*)\).*/\2/'        \
-	--regex-c='/^SYSCALL_DEFINE[[:digit:]]?\(([^,)]*).*/sys_\1/' \
-	--regex-c='/^COMPAT_SYSCALL_DEFINE[[:digit:]]?\(([^,)]*).*/compat_sys_\1/' \
-	--regex-c='/^TRACE_EVENT\(([^,)]*).*/trace_\1/'			\
-	--regex-c='/^TRACE_EVENT\(([^,)]*).*/trace_\1_rcuidle/'		\
-	--regex-c='/^DEFINE_EVENT\([^,)]*, *([^,)]*).*/trace_\1/'	\
-	--regex-c='/^DEFINE_EVENT\([^,)]*, *([^,)]*).*/trace_\1_rcuidle/' \
-	--regex-c='/PAGEFLAG\(([^,)]*).*/Page\1/'			\
-	--regex-c='/PAGEFLAG\(([^,)]*).*/SetPage\1/'			\
-	--regex-c='/PAGEFLAG\(([^,)]*).*/ClearPage\1/'			\
-	--regex-c='/TESTSETFLAG\(([^,)]*).*/TestSetPage\1/'		\
-	--regex-c='/TESTPAGEFLAG\(([^,)]*).*/Page\1/'			\
-	--regex-c='/SETPAGEFLAG\(([^,)]*).*/SetPage\1/'			\
-	--regex-c='/__SETPAGEFLAG\(([^,)]*).*/__SetPage\1/'		\
-	--regex-c='/TESTCLEARFLAG\(([^,)]*).*/TestClearPage\1/'		\
-	--regex-c='/__TESTCLEARFLAG\(([^,)]*).*/TestClearPage\1/'	\
-	--regex-c='/CLEARPAGEFLAG\(([^,)]*).*/ClearPage\1/'		\
-	--regex-c='/__CLEARPAGEFLAG\(([^,)]*).*/__ClearPage\1/'		\
-	--regex-c='/__PAGEFLAG\(([^,)]*).*/__SetPage\1/'		\
-	--regex-c='/__PAGEFLAG\(([^,)]*).*/__ClearPage\1/'		\
-	--regex-c='/PAGEFLAG_FALSE\(([^,)]*).*/Page\1/'			\
-	--regex-c='/TESTSCFLAG\(([^,)]*).*/TestSetPage\1/'		\
-	--regex-c='/TESTSCFLAG\(([^,)]*).*/TestClearPage\1/'		\
-	--regex-c='/SETPAGEFLAG_NOOP\(([^,)]*).*/SetPage\1/'		\
-	--regex-c='/CLEARPAGEFLAG_NOOP\(([^,)]*).*/ClearPage\1/'	\
-	--regex-c='/__CLEARPAGEFLAG_NOOP\(([^,)]*).*/__ClearPage\1/'	\
-	--regex-c='/TESTCLEARFLAG_FALSE\(([^,)]*).*/TestClearPage\1/' \
-	--regex-c='/__TESTCLEARFLAG_FALSE\(([^,)]*).*/__TestClearPage\1/' \
-	--regex-c='/TASK_PFA_TEST\([^,]*,\s*([^)]*)\)/task_\1/'	\
-	--regex-c='/TASK_PFA_SET\([^,]*,\s*([^)]*)\)/task_set_\1/'	\
-	--regex-c='/TASK_PFA_CLEAR\([^,]*,\s*([^)]*)\)/task_clear_\1/'\
-	--regex-c='/DEF_MMIO_(IN|OUT)_(X|D)\(([^,]*),\s*[^)]*\)/\3/'	\
-	--regex-c='/DEBUGGER_BOILERPLATE\(([^,]*)\)/\1/'		\
-	--regex-c='/PCI_OP_READ\((\w*).*[1-4]\)/pci_bus_read_config_\1/' \
-	--regex-c='/PCI_OP_WRITE\((\w*).*[1-4]\)/pci_bus_write_config_\1/' \
-	--regex-c='/DEFINE_(MUTEX|SEMAPHORE|SPINLOCK)\((\w*)/\2/v/'	\
-	--regex-c='/DEFINE_(RAW_SPINLOCK|RWLOCK|SEQLOCK)\((\w*)/\2/v/'	\
-	--regex-c='/DECLARE_(RWSEM|COMPLETION)\((\w+)/\2/v/'		\
-	--regex-c='/DECLARE_BITMAP\((\w*)/\1/v/'			\
-	--regex-c='/(^|\s)(|L|H)LIST_HEAD\((\w*)/\3/v/'			\
-	--regex-c='/(^|\s)RADIX_TREE\((\w*)/\2/v/'			\
-	--regex-c='/DEFINE_PER_CPU\(([^,]*,\s*)(\w*).*\)/\2/v/'		\
-	--regex-c='/DEFINE_PER_CPU_SHARED_ALIGNED\(([^,]*,\s*)(\w*).*\)/\2/v/' \
-	--regex-c='/DECLARE_WAIT_QUEUE_HEAD\((\w*)/\1/v/'		\
-	--regex-c='/DECLARE_(TASKLET|WORK|DELAYED_WORK)\((\w*)/\2/v/'	\
-	--regex-c='/DEFINE_PCI_DEVICE_TABLE\((\w*)/\1/v/'		\
-	--regex-c='/(^\s)OFFSET\((\w*)/\2/v/'				\
-	--regex-c='/(^\s)DEFINE\((\w*)/\2/v/'				\
-	--regex-c='/DEFINE_HASHTABLE\((\w*)/\1/v/'
+	--extra=+f --c-kinds=+px --langmap=c:+.h "${regex[@]}"
 
+	setup_regex exuberant kconfig
 	all_kconfigs | xargs $1 -a                              \
-	--langdef=kconfig --language-force=kconfig              \
-	--regex-kconfig='/^[[:blank:]]*(menu|)config[[:blank:]]+([[:alnum:]_]+)/\2/' \
-	--regex-kconfig='/^[[:blank:]]*(menu|)config[[:blank:]]+([[:alnum:]_]+)/CONFIG_\2/'
+	--langdef=kconfig --language-force=kconfig "${regex[@]}"
+
 }
 
 emacs()
 {
-	all_target_sources | xargs $1 -a                        \
-	--regex='/^\(ENTRY\|_GLOBAL\)(\([^)]*\)).*/\2/'         \
-	--regex='/^SYSCALL_DEFINE[0-9]?(\([^,)]*\).*/sys_\1/'   \
-	--regex='/^COMPAT_SYSCALL_DEFINE[0-9]?(\([^,)]*\).*/compat_sys_\1/' \
-	--regex='/^TRACE_EVENT(\([^,)]*\).*/trace_\1/'		\
-	--regex='/^TRACE_EVENT(\([^,)]*\).*/trace_\1_rcuidle/'	\
-	--regex='/^DEFINE_EVENT([^,)]*, *\([^,)]*\).*/trace_\1/' \
-	--regex='/^DEFINE_EVENT([^,)]*, *\([^,)]*\).*/trace_\1_rcuidle/' \
-	--regex='/PAGEFLAG(\([^,)]*\).*/Page\1/'			\
-	--regex='/PAGEFLAG(\([^,)]*\).*/SetPage\1/'		\
-	--regex='/PAGEFLAG(\([^,)]*\).*/ClearPage\1/'		\
-	--regex='/TESTSETFLAG(\([^,)]*\).*/TestSetPage\1/'	\
-	--regex='/TESTPAGEFLAG(\([^,)]*\).*/Page\1/'		\
-	--regex='/SETPAGEFLAG(\([^,)]*\).*/SetPage\1/'		\
-	--regex='/__SETPAGEFLAG(\([^,)]*\).*/__SetPage\1/'	\
-	--regex='/TESTCLEARFLAG(\([^,)]*\).*/TestClearPage\1/'	\
-	--regex='/__TESTCLEARFLAG(\([^,)]*\).*/TestClearPage\1/'	\
-	--regex='/CLEARPAGEFLAG(\([^,)]*\).*/ClearPage\1/'	\
-	--regex='/__CLEARPAGEFLAG(\([^,)]*\).*/__ClearPage\1/'	\
-	--regex='/__PAGEFLAG(\([^,)]*\).*/__SetPage\1/'		\
-	--regex='/__PAGEFLAG(\([^,)]*\).*/__ClearPage\1/'	\
-	--regex='/PAGEFLAG_FALSE(\([^,)]*\).*/Page\1/'		\
-	--regex='/TESTSCFLAG(\([^,)]*\).*/TestSetPage\1/'	\
-	--regex='/TESTSCFLAG(\([^,)]*\).*/TestClearPage\1/'	\
-	--regex='/SETPAGEFLAG_NOOP(\([^,)]*\).*/SetPage\1/'	\
-	--regex='/CLEARPAGEFLAG_NOOP(\([^,)]*\).*/ClearPage\1/'	\
-	--regex='/__CLEARPAGEFLAG_NOOP(\([^,)]*\).*/__ClearPage\1/' \
-	--regex='/TESTCLEARFLAG_FALSE(\([^,)]*\).*/TestClearPage\1/' \
-	--regex='/__TESTCLEARFLAG_FALSE(\([^,)]*\).*/__TestClearPage\1/' \
-	--regex='/TASK_PFA_TEST\([^,]*,\s*([^)]*)\)/task_\1/'		\
-	--regex='/TASK_PFA_SET\([^,]*,\s*([^)]*)\)/task_set_\1/'	\
-	--regex='/TASK_PFA_CLEAR\([^,]*,\s*([^)]*)\)/task_clear_\1/'	\
-	--regex='/PCI_OP_READ(\([a-z]*[a-z]\).*[1-4])/pci_bus_read_config_\1/' \
-	--regex='/PCI_OP_WRITE(\([a-z]*[a-z]\).*[1-4])/pci_bus_write_config_\1/'\
-	--regex='/[^#]*DEFINE_HASHTABLE(\([^,)]*\)/\1/'
+	setup_regex emacs asm c
+	all_target_sources | xargs $1 -a "${regex[@]}"
 
-	all_kconfigs | xargs $1 -a                              \
-	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/\3/' \
-	--regex='/^[ \t]*\(\(menu\)*config\)[ \t]+\([a-zA-Z0-9_]+\)/CONFIG_\3/'
+	setup_regex emacs kconfig
+	all_kconfigs | xargs $1 -a "${regex[@]}"
 }
 
 xtags()
-- 
2.1.4

