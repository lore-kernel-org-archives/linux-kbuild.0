Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:1081 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751424AbaBHQBo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 8 Feb 2014 11:01:44 -0500
Date: Sat, 8 Feb 2014 08:01:43 -0800
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH 5/6] kbuild: Use single pass kallsyms
Message-ID: <20140208160143.GF12219@tassilo.jf.intel.com>
References: <1391845840-28514-1-git-send-email-ak@linux.intel.com>
 <1391845840-28514-5-git-send-email-ak@linux.intel.com>
 <20140208091920.GA400@x4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140208091920.GA400@x4>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Markus Trippelsdorf <markus@trippelsdorf.de>
Cc: mmarek@suse.cz, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 4c5435f420a6..06469556c580 100644
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -213,7 +213,7 @@ if [ -n "${CONFIG_KALLSYMS}" ] ; then
>  
>  	info PATCHFILE vmlinux
>  	OFF=$(${OBJDUMP} --section-headers vmlinux |
> -	     gawk -f ./source/scripts/elf_file_offset \
> +	     gawk -f ./scripts/elf_file_offset \

I think that would break with object dirs (which was what I used),
because the scripts there only has some executables.

Really need ${srcdir}, but it would need to be exported first.

This should work:


diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 4c5435f..5f0ae1a 100644
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -212,8 +212,10 @@ if [ -n "${CONFIG_KALLSYMS}" ] ; then
 	${OBJCOPY} -O binary .tmp_kallsyms2.o .tmp_kallsyms2.bin
 
 	info PATCHFILE vmlinux
+	EF=scripts/elf_file_offset
+	if [ ! -r $EF ] ; then EF=source/$EF ; fi
 	OFF=$(${OBJDUMP} --section-headers vmlinux |
-	     gawk -f ./source/scripts/elf_file_offset \
+	     gawk -f $EF \
 	-v section=.kallsyms -v filesize=$(stat -c%s .tmp_kallsyms2.bin) )
 	if [ -z "$OFF" ] ; then
 		echo "Cannot find .kallsyms section in vmlinux binary"




-Andi

-- 
ak@linux.intel.com -- Speaking for myself only
