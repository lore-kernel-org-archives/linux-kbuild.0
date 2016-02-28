Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from thorn.bewilderbeest.net ([71.19.156.171]:36224 "EHLO
	thorn.bewilderbeest.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757046AbcB1MTV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 28 Feb 2016 07:19:21 -0500
Date: Sun, 28 Feb 2016 06:11:47 -0600
From: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v3 6/7] create/adjust generated/autoksyms.h
Message-ID: <20160228121146.GK17422@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1455826023-2134-1-git-send-email-nicolas.pitre@linaro.org>
 <1455826023-2134-7-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

On Thu, Feb 18, 2016 at 15:07:02 -0500, Nicolas Pitre wrote:
>diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
>new file mode 100755
>index 0000000000..898a3ca1b2
>--- /dev/null
>+++ b/scripts/adjust_autoksyms.sh
>@@ -0,0 +1,97 @@
>+#!/bin/sh

Given the here-strings in this script, this should probably be /bin/bash 
or breakage will ensue on Debian and suchlike where /bin/sh != bash.  
However...

>+sed -ns -e '3s/ /\n/gp' "$MODVERDIR"/*.mod | sort -u |
>+while read sym; do
>+	if [ -n "$CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX" ]; then
>+		sym=$(sed 's/^_//' <<< "$sym")

...this one could (shell-portably and more efficiently) be a parameter 
expansion (sym="${sym#_}").

>+
>+# Extract changes between old and new list and touch corresponding
>+# dependency files.
>+# Note: sort -m doesn't work well with underscore prefixed symbols so we
>+# use 'cat ... | sort' instead.
>+changed=0
>+while read sympath; do
>+	[ -z "$sympath" ] && continue
>+	depfile="include/config/ksym/${sympath}.h"
>+	mkdir -p "$(dirname "$depfile")"
>+	touch "$depfile"
>+	changed=$((changed + 1))
>+done <<< "$(
>+	cat "$cur_ksyms_file" "$new_ksyms_file" | sort | uniq -u |
>+	sed -n 's/^#define __KSYM_\(.*\) 1/\1/p' | tr "A-Z_" "a-z/"  )"

Nothing super-obvious springs to mind as a pure-sh equivalent for this 
one though, so assuming the script remains bash-specific, a process 
substitution like

  done < <(cat ...)

might slightly cleaner than the here-string + command substitution 
(doesn't need quoting, and just streams through a pipe rather than bash 
snarfing it all up into a string).

