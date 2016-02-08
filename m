Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relais.videotron.ca ([24.201.245.36]:61322 "EHLO
	relais.videotron.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755920AbcBHUnr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 15:43:47 -0500
Content-transfer-encoding: 7BIT
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: [PATCH 5/6] create/adjust generated/expsyms.h
Date: Mon, 08 Feb 2016 15:28:34 -0500
Message-id: <1454963315-20468-6-git-send-email-nicolas.pitre@linaro.org>
In-reply-to: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

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
---
 Makefile                  | 13 +++++++
 scripts/adjust_expsyms.sh | 97 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100755 scripts/adjust_expsyms.sh

diff --git a/Makefile b/Makefile
index 3a264129f8..f904c1d3e8 100644
--- a/Makefile
+++ b/Makefile
@@ -921,6 +921,10 @@ quiet_cmd_link-vmlinux = LINK    $@
 # Include targets which we want to
 # execute if the rest of the kernel build went well.
 vmlinux: scripts/link-vmlinux.sh $(vmlinux-deps) FORCE
+ifdef CONFIG_TRIM_UNUSED_EXPSYMS
+	$(Q)$(CONFIG_SHELL) scripts/adjust_expsyms.sh \
+	    "$(MAKE) KBUILD_MODULES=1 -f $(srctree)/Makefile vmlinux_recursive"
+endif
 ifdef CONFIG_HEADERS_CHECK
 	$(Q)$(MAKE) -f $(srctree)/Makefile headers_check
 endif
@@ -935,6 +939,15 @@ ifdef CONFIG_GDB_SCRIPTS
 endif
 	+$(call if_changed,link-vmlinux)
 
+vmlinux_recursive: $(vmlinux-deps)
+	$(Q)$(CONFIG_SHELL) scripts/adjust_expsyms.sh \
+	    "$(MAKE) KBUILD_MODULES=1 -f $(srctree)/Makefile vmlinux_recursive"
+PHONY += vmlinux_recursive
+
+# standalone target for easier testing
+include/generated/expsyms.h: FORCE
+	$(Q)$(CONFIG_SHELL) scripts/adjust_expsyms.sh true
+
 # The actual objects are generated when descending,
 # make sure no implicit rule kicks in
 $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
diff --git a/scripts/adjust_expsyms.sh b/scripts/adjust_expsyms.sh
new file mode 100755
index 0000000000..f363f4b8ea
--- /dev/null
+++ b/scripts/adjust_expsyms.sh
@@ -0,0 +1,97 @@
+#!/bin/sh
+
+# Script to create/update include/generated/expsyms.h and dependency files
+#
+# Copyright:	(C) 2016  Linaro Limited
+# Created by:	Nicolas Pitre, January 2016
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+
+# Create/update the include/generated/expsyms.h file from the list
+# of all module's needed symbols as recorded on the third line of
+# .tmp_versions/*.mod files.
+#
+# For each symbol being added or removed, the corresponding dependency
+# file's timestamp is updated to force a rebuild of the affected source
+# file. All arguments passed to this script are assumed to be a command
+# to be exec'd that will trigger a rebuild of those files.
+
+set -e
+
+cur_expsym_file="include/generated/expsyms.h"
+new_expsym_file="include/generated/expsyms.h.tmpnew"
+
+info() { [ "$quiet" != "silent_" ] && printf "  %-7s %s\n" "$1" "$2"; }
+
+info "CHK" "$cur_expsym_file"
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
+[ -e "$cur_expsym_file" ] || touch "$cur_expsym_file"
+
+# Generate a new expsym list file with symbols needed by the current
+# set of modules.
+cat > "$new_expsym_file" << EOT
+/*
+ * Automatically generated file; DO NOT EDIT.
+ */
+
+EOT
+sed -ns -e '3s/ /\n/gp' "$MODVERDIR"/*.mod | sort -u |
+while read sym; do
+	if [ -n "$CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX" ]; then
+		sym=$(sed 's/_\(.*\)$/\1/' <<< "$sym")
+	fi
+	echo "#define __EXPSYM_${sym} 1"
+done >> "$new_expsym_file"
+
+# Special case for modversions (see modpost.c)
+if [ -n "$CONFIG_MODVERSIONS" ]; then
+	echo "#define __EXPSYM_module_layout 1" >> "$new_expsym_file"
+fi
+
+# Extract changes between old and new list and touch corresponding
+# dependency files.
+# Note: sort -m doesn't work well with underscore prefixed symbols so we
+# use 'cat ... | sort' instead.
+changed=0
+while read sympath; do
+	[ -z "$sympath" ] && continue
+	depfile="include/config/expsym/${sympath}.h"
+	mkdir -p "$(dirname "$depfile")"
+	touch "$depfile"
+	changed=$((changed + 1))
+done <<< "$(
+	cat "$cur_expsym_file" "$new_expsym_file" | sort | uniq -u |
+	sed -n 's/^#define __EXPSYM_\(.*\) 1/\1/p' | tr "A-Z_" "a-z/"  )"
+
+if [ $changed -gt 0 ]; then
+	# Replace the old list with tne new one
+	old=$(grep -c "^#define __EXPSYM_" "$cur_expsym_file" || true)
+	new=$(grep -c "^#define __EXPSYM_" "$new_expsym_file" || true)
+	info "EXPSYM" "symbols: $old old, $new new, $changed changed"
+	info "UPD" "$cur_expsym_file"
+	mv -f "$new_expsym_file" "$cur_expsym_file"
+	# Then trigger a rebuild of affected files
+	exec $@
+else
+	rm -f "$new_expsym_file"
+fi
-- 
2.5.0

