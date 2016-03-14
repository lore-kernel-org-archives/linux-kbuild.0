Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alt32.smtp-out.videotron.ca ([24.53.0.21]:9432 "EHLO
	alt32.smtp-out.videotron.ca" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754552AbcCNCnF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Mar 2016 22:43:05 -0400
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH v6 6/8] create/adjust generated/autoksyms.h
Date: Sun, 13 Mar 2016 22:42:14 -0400
Message-Id: <1457923336-2732-7-git-send-email-nicolas.pitre@linaro.org>
In-Reply-To: <1457923336-2732-1-git-send-email-nicolas.pitre@linaro.org>
References: <1457923336-2732-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Given the list of exported symbols needed by all modules, we can create
a header file containing preprocessor defines for each of those symbols.
Also, when some symbols are added and/or removed from the list, we can
update the time on the corresponding files used as build dependencies for
those symbols. And finally, if any symbol did change state, the
corresponding source files must be rebuilt.

The insertion or removal of an EXPORT_SYMBOL() entry within a module may
create or remove the need for another exported symbol.  This is why this
operation has to be repeated until the list of needed exported symbols
becomes stable. Only then the final kernel and modules link take place.

Signed-off-by: Nicolas Pitre <nico@linaro.org>
Acked-by: Rusty Russell <rusty@rustcorp.com.au>
---
 Makefile                    |  13 ++++++
 scripts/adjust_autoksyms.sh | 101 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 114 insertions(+)
 create mode 100755 scripts/adjust_autoksyms.sh

diff --git a/Makefile b/Makefile
index e916428cf7..bb865095ca 100644
--- a/Makefile
+++ b/Makefile
@@ -921,6 +921,10 @@ quiet_cmd_link-vmlinux = LINK    $@
 # Include targets which we want to
 # execute if the rest of the kernel build went well.
 vmlinux: scripts/link-vmlinux.sh $(vmlinux-deps) FORCE
+ifdef CONFIG_TRIM_UNUSED_KSYMS
+	$(Q)$(CONFIG_SHELL) scripts/adjust_autoksyms.sh \
+	  "$(MAKE) KBUILD_MODULES=1 -f $(srctree)/Makefile autoksyms_recursive"
+endif
 ifdef CONFIG_HEADERS_CHECK
 	$(Q)$(MAKE) -f $(srctree)/Makefile headers_check
 endif
@@ -935,6 +939,15 @@ ifdef CONFIG_GDB_SCRIPTS
 endif
 	+$(call if_changed,link-vmlinux)
 
+autoksyms_recursive: $(vmlinux-deps)
+	$(Q)$(CONFIG_SHELL) scripts/adjust_autoksyms.sh \
+	  "$(MAKE) KBUILD_MODULES=1 -f $(srctree)/Makefile autoksyms_recursive"
+PHONY += autoksyms_recursive
+
+# standalone target for easier testing
+include/generated/autoksyms.h: FORCE
+	$(Q)$(CONFIG_SHELL) scripts/adjust_autoksyms.sh true
+
 # The actual objects are generated when descending,
 # make sure no implicit rule kicks in
 $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
new file mode 100755
index 0000000000..5bf538f1ed
--- /dev/null
+++ b/scripts/adjust_autoksyms.sh
@@ -0,0 +1,101 @@
+#!/bin/sh
+
+# Script to create/update include/generated/autoksyms.h and dependency files
+#
+# Copyright:	(C) 2016  Linaro Limited
+# Created by:	Nicolas Pitre, January 2016
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+
+# Create/update the include/generated/autoksyms.h file from the list
+# of all module's needed symbols as recorded on the third line of
+# .tmp_versions/*.mod files.
+#
+# For each symbol being added or removed, the corresponding dependency
+# file's timestamp is updated to force a rebuild of the affected source
+# file. All arguments passed to this script are assumed to be a command
+# to be exec'd to trigger a rebuild of those files.
+
+set -e
+
+cur_ksyms_file="include/generated/autoksyms.h"
+new_ksyms_file="include/generated/autoksyms.h.tmpnew"
+
+info() {
+	if [ "$quiet" != "silent_" ]; then
+		printf "  %-7s %s\n" "$1" "$2"
+	fi
+}
+
+info "CHK" "$cur_ksyms_file"
+
+# Use "make V=1" to debug this script.
+case "$KBUILD_VERBOSE" in
+*1*)
+	set -x
+	;;
+esac
+
+# We need access to CONFIG_ symbols
+case "${KCONFIG_CONFIG}" in
+*/*)
+	. "${KCONFIG_CONFIG}"
+	;;
+*)
+	# Force using a file from the current directory
+	. "./${KCONFIG_CONFIG}"
+esac
+
+# In case it doesn't exist yet...
+if [ -e "$cur_ksyms_file" ]; then touch "$cur_ksyms_file"; fi
+
+# Generate a new ksym list file with symbols needed by the current
+# set of modules.
+cat > "$new_ksyms_file" << EOT
+/*
+ * Automatically generated file; DO NOT EDIT.
+ */
+
+EOT
+sed -ns -e '3s/ /\n/gp' "$MODVERDIR"/*.mod | sort -u |
+while read sym; do
+	if [ -n "$CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX" ]; then
+		sym="${sym#_}"
+	fi
+	echo "#define __KSYM_${sym} 1"
+done >> "$new_ksyms_file"
+
+# Special case for modversions (see modpost.c)
+if [ -n "$CONFIG_MODVERSIONS" ]; then
+	echo "#define __KSYM_module_layout 1" >> "$new_ksyms_file"
+fi
+
+# Extract changes between old and new list and touch corresponding
+# dependency files.
+changed=$(
+count=0
+sort "$cur_ksyms_file" "$new_ksyms_file" | uniq -u |
+sed -n 's/^#define __KSYM_\(.*\) 1/\1/p' | tr "A-Z_" "a-z/" |
+while read sympath; do
+	if [ -z "$sympath" ]; then continue; fi
+	depfile="include/config/ksym/${sympath}.h"
+	mkdir -p "$(dirname "$depfile")"
+	touch "$depfile"
+	echo $((count += 1))
+done | tail -1 )
+changed=${changed:-0}
+
+if [ $changed -gt 0 ]; then
+	# Replace the old list with tne new one
+	old=$(grep -c "^#define __KSYM_" "$cur_ksyms_file" || true)
+	new=$(grep -c "^#define __KSYM_" "$new_ksyms_file" || true)
+	info "KSYMS" "symbols: before=$old, after=$new, changed=$changed"
+	info "UPD" "$cur_ksyms_file"
+	mv -f "$new_ksyms_file" "$cur_ksyms_file"
+	# Then trigger a rebuild of affected source files
+	exec $@
+else
+	rm -f "$new_ksyms_file"
+fi
-- 
2.5.0

