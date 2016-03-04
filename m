Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56477 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760378AbcCDWUh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Mar 2016 17:20:37 -0500
Date: Fri, 4 Mar 2016 23:20:34 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: suppress annoying "... is up to date." message
Message-ID: <20160304222034.GA19855@pobox.suse.cz>
References: <1456994190-15582-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456994190-15582-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, David Howells <dhowells@redhat.com>, Michal Marek <mmarek@suse.com>, David Woodhouse <David.Woodhouse@intel.com>, linux-kernel@vger.kernel.org

On Thu, Mar 03, 2016 at 05:36:30PM +0900, Masahiro Yamada wrote:
> Under certain conditions, Kbuild shows "... is up to date" where
> if_changed or friends are used.
> 
> For example, the incremental build of ARM64 Linux shows this message
> when the kernel image has not been updated.
> 
>   $ make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-
>     CHK     include/config/kernel.release
>     CHK     include/generated/uapi/linux/version.h
>     CHK     include/generated/utsrelease.h
>     CHK     include/generated/bounds.h
>     CHK     include/generated/timeconst.h
>     CHK     include/generated/asm-offsets.h
>     CALL    scripts/checksyscalls.sh
>     CHK     include/generated/compile.h
>     CHK     kernel/config_data.h
>   make[1]: `arch/arm64/boot/Image.gz' is up to date.
>     Building modules, stage 2.
>     MODPOST 0 modules
> 
> The following is the build rule in arch/arm64/boot/Makefile:
> 
>   $(obj)/Image.gz: $(obj)/Image FORCE
>           $(call if_changed,gzip)
> 
> If the Image.gz is newer than the Image and the command line has not
> changed (i.e., $(any-prereq) and $(arg-check) are both empty), the
> build rule $(call if_changed,gzip) is evaluated to be empty, then
> GNU Make reports the target is up to date.  In order to make GNU Make
> quiet, we need to give it something to do, for example, "@:".  This
> should be fixed in the Kbuild core part rather than in each Makefile.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks, applied to kbuild.git#kbuild.

Michal
