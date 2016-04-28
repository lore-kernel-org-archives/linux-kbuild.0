Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f42.google.com ([209.85.192.42]:36723 "EHLO
	mail-qg0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753265AbcD1U41 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Apr 2016 16:56:27 -0400
Received: by mail-qg0-f42.google.com with SMTP id d90so35095073qgd.3
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Apr 2016 13:56:26 -0700 (PDT)
Date: Thu, 28 Apr 2016 16:56:23 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: Failing randconfig builds with CONFIG_TRIM_UNUSED_KSYMS
In-Reply-To: <1856264.0h7Es0b6Qr@wuerfel>
Message-ID: <alpine.LFD.2.20.1604281248300.5091@knanqh.ubzr>
References: <1856264.0h7Es0b6Qr@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Thu, 28 Apr 2016, Arnd Bergmann wrote:

> Hi Nico,
> 
> My randconfig build testing has encountered a couple of additional
> failures with CONFIG_TRIM_UNUSED_KSYMS=y, both rather rare at
> happening once in a few thousand randconfig builds. I have attached
> two .config files that presumably refer to different problems I
> see on linux-next:
> 
> 0x1A1E54C2_defconfig fails every time with
> ERROR: "__aeabi_idivmod" [lib/cordic.ko] undefined!
> 
> Apparently, this is because lib/cordic.ko is the only module using
> this symbol (some built-in code uses it) here.

Well, the actual explanation is that this module uses only one symbol. 
And when only one symbol was listed, it got ignored.

The fix goes like this:

diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 5bf538f1ed..3de40db0a1 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -59,7 +59,7 @@ cat > "$new_ksyms_file" << EOT
  */
 
 EOT
-sed -ns -e '3s/ /\n/gp' "$MODVERDIR"/*.mod | sort -u |
+sed -ns -e '3{s/ /\n/g;/^$/!p;}' "$MODVERDIR"/*.mod | sort -u |
 while read sym; do
 	if [ -n "$CONFIG_HAVE_UNDERSCORE_SYMBOL_PREFIX" ]; then
 		sym="${sym#_}"

> 0xEA8A78CD_defconfig is stranger, as it only sometime breaks when I build
> in a newly created object directory or after "make clean", but
> not if I retry the build:
> 
> $ rm -rf build/0xEA8A78CD
> $ mkdir build/0xEA8A78CD
> $ make O=build/0xEA8A78CD 0xEA8A78CD_defconfig
> $ make O=build/0xEA8A78CD -skj12
> ERROR: "memory_cgrp_subsys_enabled_key" [fs/ncpfs/ncpfs.ko] undefined!
> $ make O=build/0xEA8A78CD -skj12
> $ # SUCCESS

I don't understand why you'd get a successful build the second time.  
I'm able to reproduce, however it fails everytime.

This one was less obvious to solve.  The construct is:

#define SUBSYS(_x)                                                         \
        DEFINE_STATIC_KEY_TRUE(_x ## _cgrp_subsys_enabled_key);            \
        DEFINE_STATIC_KEY_TRUE(_x ## _cgrp_subsys_on_dfl_key);             \
        EXPORT_SYMBOL_GPL(_x ## _cgrp_subsys_enabled_key);                 \
        EXPORT_SYMBOL_GPL(_x ## _cgrp_subsys_on_dfl_key);

Duing the build, EXPORT_SYMBOL*() is redefined to anchor the symbol name 
so a sed script can extract them and feed them to scripts/basic/fixdep.  
However in this case the preprocessor output had more than one such 
symbol on a line and the sed script only captured one of them.  
Therefore the pseudo dependency file for memory_cgrp_subsys_enabled_key 
didn't get added to kernel/.cgroup.o.cmd. Even when autoksyms.h was 
updated with that symbol and the dependency file touched, the build 
system didn't know that kernel/cgroup.c had to be rebuilt.

Now fixing this wasn't all that obvious either.  I had a really nice sed 
rule to parse multiple instances per line, but sed regexp can only do 
greedy matching. I found out how people work around that limitation but 
that doesn't work well for string delimiters.

In the end the best workaround is simple: substitute any ';' with '\n':

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 36e9475395..1f0d41cc73 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -281,7 +281,7 @@ ksym_dep_filter =                                                            \
 	    $(CPP) $(call flags_nodeps,a_flags) -D__KSYM_DEPS__ $< ;;        \
 	  boot*|build*|*cpp_lds_S|dtc|host*|vdso*) : ;;                      \
 	  *) echo "Don't know how to preprocess $(1)" >&2; false ;;          \
-	esac | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'
+	esac | tr ";" "\n" | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'
 
 cmd_and_fixdep =                                                             \
 	$(echo-cmd) $(cmd_$(1));                                             \


Nicolas
