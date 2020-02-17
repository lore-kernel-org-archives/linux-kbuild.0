Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm1-f65.google.com ([209.85.128.65]:39362 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbgBQPhg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Feb 2020 10:37:36 -0500
Received: by mail-wm1-f65.google.com with SMTP id c84so18965522wme.4
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2020 07:37:34 -0800 (PST)
Date: Mon, 17 Feb 2020 15:37:32 +0000
From: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH v4 2/3] kbuild: split adjust_autoksyms.sh in two parts
Message-ID: <20200217153732.GB48466@google.com>
References: <20200212202140.138092-1-qperret@google.com>
 <20200212202140.138092-3-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200212202140.138092-3-qperret@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: masahiroy@kernel.org, nico@fluxnic.net, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kernel-team@android.com, jeyu@kernel.org, hch@infradead.org

On Wed, Feb 12, 2020 at 08:21:39PM +0000, Quentin Perret wrote:
>In order to prepare the ground for a build-time optimization, split
>adjust_autoksyms.sh into two scripts: one that generates autoksyms.h
>based on all currently available information (whitelist, and .mod
>files), and the other to inspect the diff between two versions of
>autoksyms.h and trigger appropriate rebuilds.
>
>Signed-off-by: Quentin Perret <qperret@google.com>

Reviewed-by: Matthias Maennich <maennich@google.com>
Tested-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

>---
> scripts/adjust_autoksyms.sh | 29 ++++--------------------
> scripts/gen_autoksyms.sh    | 44 +++++++++++++++++++++++++++++++++++++
> 2 files changed, 48 insertions(+), 25 deletions(-)
> create mode 100755 scripts/gen_autoksyms.sh
>
>diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
>index 93f4d10e66e6..2b366d945ccb 100755
>--- a/scripts/adjust_autoksyms.sh
>+++ b/scripts/adjust_autoksyms.sh
>@@ -1,14 +1,13 @@
> #!/bin/sh
> # SPDX-License-Identifier: GPL-2.0-only
>
>-# Script to create/update include/generated/autoksyms.h and dependency files
>+# Script to update include/generated/autoksyms.h and dependency files
> #
> # Copyright:	(C) 2016  Linaro Limited
> # Created by:	Nicolas Pitre, January 2016
> #
>
>-# Create/update the include/generated/autoksyms.h file from the list
>-# of all module's needed symbols as recorded on the second line of *.mod files.
>+# Update the include/generated/autoksyms.h file.
> #
> # For each symbol being added or removed, the corresponding dependency
> # file's timestamp is updated to force a rebuild of the affected source
>@@ -38,28 +37,8 @@ esac
> # We need access to CONFIG_ symbols
> . include/config/auto.conf
>
>-# Use 'eval' to expand the whitelist path and check if it is relative
>-eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
>-[ "${ksym_wl:0:1}" = "/" ] || ksym_wl="$abs_srctree/$ksym_wl"
>-
>-# Generate a new ksym list file with symbols needed by the current
>-# set of modules.
>-cat > "$new_ksyms_file" << EOT
>-/*
>- * Automatically generated file; DO NOT EDIT.
>- */
>-
>-EOT
>-sed 's/ko$/mod/' modules.order |
>-xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>-cat - "$ksym_wl" |
>-sort -u |
>-sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>-
>-# Special case for modversions (see modpost.c)
>-if [ -n "$CONFIG_MODVERSIONS" ]; then
>-	echo "#define __KSYM_module_layout 1" >> "$new_ksyms_file"
>-fi
>+# Generate a new symbol list file
>+$CONFIG_SHELL $srctree/scripts/gen_autoksyms.sh "$new_ksyms_file"
>
> # Extract changes between old and new list and touch corresponding
> # dependency files.
>diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
>new file mode 100755
>index 000000000000..2cea433616a8
>--- /dev/null
>+++ b/scripts/gen_autoksyms.sh
>@@ -0,0 +1,44 @@
>+#!/bin/sh
>+# SPDX-License-Identifier: GPL-2.0-only
>+
>+# Create an autoksyms.h header file from the list of all module's needed symbols
>+# as recorded on the second line of *.mod files and the user-provided symbol
>+# whitelist.
>+
>+set -e
>+
>+output_file="$1"
>+
>+# Use "make V=1" to debug this script.
>+case "$KBUILD_VERBOSE" in
>+*1*)
>+	set -x
>+	;;
>+esac
>+
>+# We need access to CONFIG_ symbols
>+. include/config/auto.conf
>+
>+# Use 'eval' to expand the whitelist path and check if it is relative
>+eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"
>+[ "${ksym_wl:0:1}" = "/" ] || ksym_wl="$abs_srctree/$ksym_wl"
>+
>+# Generate a new ksym list file with symbols needed by the current
>+# set of modules.
>+cat > "$output_file" << EOT
>+/*
>+ * Automatically generated file; DO NOT EDIT.
>+ */
>+
>+EOT
>+
>+sed 's/ko$/mod/' modules.order |
>+xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>+cat - "$ksym_wl" |
>+sort -u |
>+sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$output_file"
>+
>+# Special case for modversions (see modpost.c)
>+if [ -n "$CONFIG_MODVERSIONS" ]; then
>+	echo "#define __KSYM_module_layout 1" >> "$output_file"
>+fi
>-- 
>2.25.0.225.g125e21ebc7-goog
>
