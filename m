Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:41049 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752457AbeCOU4W (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Mar 2018 16:56:22 -0400
Received: by mail-qk0-f193.google.com with SMTP id s78so8861149qkl.8
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Mar 2018 13:56:22 -0700 (PDT)
Date: Thu, 15 Mar 2018 16:56:20 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: Intermittent build failure with TRIM_UNUSED_KSYMS and related
 problems
In-Reply-To: <4aee7e23-ac36-9495-14a9-471379a7896b@gmail.com>
Message-ID: <nycvar.YSQ.7.76.1803151504080.28583@knanqh.ubzr>
References: <ccedea72-0e61-500c-86e5-976ecb5cefb5@gmail.com> <CAK7LNAS9rOhyEdSUBbhPVW572437w5g7zLqMGSHn4gg3nbCU_g@mail.gmail.com> <nycvar.YSQ.7.76.1803121331280.28583@knanqh.ubzr> <4bbfeb74-c912-74e5-4f4d-287ec7ad065d@gmail.com> <nycvar.YSQ.7.76.1803131922060.28583@knanqh.ubzr>
 <4aee7e23-ac36-9495-14a9-471379a7896b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Lindroth <thomas.lindroth@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, 15 Mar 2018, Thomas Lindroth wrote:

> Here are the timestamps for the fail case:
> -rw-r--r-- 1 cocobo cocobo 66424 2018-03-13 17:20:18.000000000 +0100 linux-fail/include/generated/autoksyms.h
> -rw-r--r-- 1 cocobo cocobo 121064 2018-03-13 17:16:53.000000000 +0100 linux-fail/arch/x86/lib/usercopy_64.o
> -rw-r--r-- 1 cocobo cocobo 0 2018-03-13 17:16:53.000000000 +0100 linux-fail/include/config/ksym///clear/user.h
> 
> It's suspicious that usercopy_64.o and ksym///clear/user.h got the same timestamp.
> My gut feeling says that ksym///clear/user.h was touched after usercopy_64.o was
> built but less than 1 sec had passed so they got the same timestamps due to the
> poor timestamp resolution on my old ext4 filesystem. Since the timestamps on 
> ksym///clear/user.h wasn't newer than usercopy_64.o the rebuild was skipped.
> 
>   AS      arch/x86/lib/putuser.o
>   AS      arch/x86/lib/retpoline.o    <---
>   AS      arch/x86/lib/rwsem.o
>   CC      arch/x86/lib/usercopy.o
>   CC      arch/x86/lib/usercopy_64.o  <---
>   AR      arch/x86/lib/lib.a
>   EXPORTS arch/x86/lib/lib-ksyms.o
>   AR      arch/x86/lib/built-in.o
>   CC      virt/lib/irqbypass.o
>   AR      virt/lib/built-in.o
>   AR      virt/built-in.o
>   CHK     include/generated/autoksyms.h
>   KSYMS   symbols: before=0, after=1871, changed=1871
> 
> The problematic usercopy_64.o and retpoline.o are built just before ksym. The build
> and ksym generation probably happens in less than 1 sec.
> 
> Here are the timestamps for the success case:
> -rw-r--r-- 1 cocobo cocobo 66424 2018-03-13 16:58:02.000000000 +0100 linux-success/include/generated/autoksyms.h
> -rw-r--r-- 1 cocobo cocobo 126912 2018-03-13 16:58:01.000000000 +0100 linux-success/arch/x86/lib/usercopy_64.o
> -rw-r--r-- 1 cocobo cocobo 0 2018-03-13 16:54:38.000000000 +0100 linux-success/include/config/ksym///clear/user.h
> 
> usercopy_64.o was rebuilt here so it has a more recent timestamp than ksym///clear/user.h.
> 
> To test this a bit more I copied the 4.14.23 source to tmpfs and ran the build there.
> Tmpfs supports nanosecond timestamps. The build succeeded 16 times in a row. Usually
> there is around 50/50 chance of success/failure on ext4.

OK.  That must be it.

Could you please test the following patch:

----- >8
Subject: [PATCH] kbuild: make scripts/adjust_autoksyms.sh robust against timestamp races

Some filesystems have timestamps with coarse precision that may allow
for a recently built object file to have the same timestamp as the
updated time on one of its dependency files. When that happens, the
object file doesn't get rebuilt as it should.

This is especially the case on filesystems that don't have sub-second
time precision, such as ext3 or Ext4 with 128B inodes.

Let's prevent that by making sure updated dependency files have a newer
timestamp than the first file we created (i.e. autoksyms.h.tmpnew).

Reported-by: Thomas Lindroth <thomas.lindroth@gmail.com>
Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 513da1a4a2..d67830e6e3 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -84,6 +84,13 @@ while read sympath; do
 	depfile="include/config/ksym/${sympath}.h"
 	mkdir -p "$(dirname "$depfile")"
 	touch "$depfile"
+	# Filesystems with coarse time precision may create timestamps
+	# equal to the one from a file that was very recently built and that
+	# needs to be rebuild. Let's guard against that by making sure our
+	# dep files are always newer than the first file we created here.
+	while [ ! "$depfile" -nt "$new_ksyms_file" ]; do
+		touch "$depfile"
+	done
 	echo $((count += 1))
 done | tail -1 )
 changed=${changed:-0}
----- >8

> > Maybe it is just a coincidence, but there is a lot of underscore 
> > prefixed symbols in that list, except for one case. This translates to 
> > successive / in the path for the timestamp file. And that one case that 
> > doesn't fit the pattern does actually aliases a path that does. I wonder 
> > if the filesystem cache could get confused by successive / in paths 
> > here, given the non deterministic nature of the build failure you get. 
> > 
> > Could you please test with the following patch to validate this 
> > hypothesis:
> The patch applied with some fuzz to 4.14.23. Using the patch the first two
> builds I did succeeded and the third failed like:
> Kernel: arch/x86/boot/bzImage is ready  (#2)
>   Building modules, stage 2.
>   MODPOST 146 modules
> ERROR: "__put_user_2" [net/ipv4/netfilter/ip_tables.ko] undefined!

OK. Glad this hypothesis didn't verify.


Nicolas
