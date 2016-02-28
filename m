Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f46.google.com ([209.85.192.46]:36328 "EHLO
	mail-qg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754568AbcB1TbK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 28 Feb 2016 14:31:10 -0500
Received: by mail-qg0-f46.google.com with SMTP id y9so102851023qgd.3
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Feb 2016 11:31:10 -0800 (PST)
Date: Sun, 28 Feb 2016 14:31:07 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v3 6/7] create/adjust generated/autoksyms.h
In-Reply-To: <20160228121146.GK17422@hatter.bewilderbeest.net>
Message-ID: <alpine.LFD.2.20.1602281419130.13632@knanqh.ubzr>
References: <20160228121146.GK17422@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

On Sun, 28 Feb 2016, Zev Weiss wrote:

> On Thu, Feb 18, 2016 at 15:07:02 -0500, Nicolas Pitre wrote:
> >diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> >new file mode 100755
> >index 0000000000..898a3ca1b2
> >--- /dev/null
> >+++ b/scripts/adjust_autoksyms.sh
> > @@ -0,0 +1,97 @@
> >+#!/bin/sh
> 
> Given the here-strings in this script, this should probably be /bin/bash or
> breakage will ensue on Debian and suchlike where /bin/sh != bash.  However...
> 
> >+sed -ns -e '3s/ /\n/gp' "$MODVERDIR"/*.mod | sort -u |
> >+while read sym; do
> >+	if [ -n "$CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX" ]; then
> >+		sym=$(sed 's/^_//' <<< "$sym")
> 
> ...this one could (shell-portably and more efficiently) be a parameter
> expansion (sym="${sym#_}").

Indeed.

> >+
> >+# Extract changes between old and new list and touch corresponding
> >+# dependency files.
> >+# Note: sort -m doesn't work well with underscore prefixed symbols so we
> >+# use 'cat ... | sort' instead.
> >+changed=0
> >+while read sympath; do
> >+	[ -z "$sympath" ] && continue
> >+	depfile="include/config/ksym/${sympath}.h"
> >+	mkdir -p "$(dirname "$depfile")"
> >+	touch "$depfile"
> >+	changed=$((changed + 1))
> >+done <<< "$(
> >+	cat "$cur_ksyms_file" "$new_ksyms_file" | sort | uniq -u |
> >+	sed -n 's/^#define __KSYM_\(.*\) 1/\1/p' | tr "A-Z_" "a-z/"  )"
> 
> Nothing super-obvious springs to mind as a pure-sh equivalent for this one
> though, so assuming the script remains bash-specific, a process substitution
> like
> 
>  done < <(cat ...)
> 
> might slightly cleaner than the here-string + command substitution (doesn't
> need quoting, and just streams through a pipe rather than bash snarfing it all
> up into a string).

Right.  Still, I decided to make it compatible with a simpler shell. I 
applied the following changes and tested it with dash.

diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 898a3ca1b2..a145a24cd8 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -57,9 +57,7 @@ cat > "$new_ksyms_file" << EOT
 EOT
 sed -ns -e '3s/ /\n/gp' "$MODVERDIR"/*.mod | sort -u |
 while read sym; do
-	if [ -n "$CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX" ]; then
-		sym=$(sed 's/^_//' <<< "$sym")
-	fi
+	[ -n "$CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX" ] && sym="${sym#_}"
 	echo "#define __KSYM_${sym} 1"
 done >> "$new_ksyms_file"
 
@@ -72,16 +70,18 @@ fi
 # dependency files.
 # Note: sort -m doesn't work well with underscore prefixed symbols so we
 # use 'cat ... | sort' instead.
-changed=0
+changed=$(
+count=0
+cat "$cur_ksyms_file" "$new_ksyms_file" | sort | uniq -u |
+sed -n 's/^#define __KSYM_\(.*\) 1/\1/p' | tr "A-Z_" "a-z/" |
 while read sympath; do
 	[ -z "$sympath" ] && continue
 	depfile="include/config/ksym/${sympath}.h"
 	mkdir -p "$(dirname "$depfile")"
 	touch "$depfile"
-	changed=$((changed + 1))
-done <<< "$(
-	cat "$cur_ksyms_file" "$new_ksyms_file" | sort | uniq -u |
-	sed -n 's/^#define __KSYM_\(.*\) 1/\1/p' | tr "A-Z_" "a-z/"  )"
+	echo $((count += 1))
+done | tail -1 )
+changed=${changed:-0}
 
 if [ $changed -gt 0 ]; then
 	# Replace the old list with tne new one

Nicolas
