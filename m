Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:58927 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756539Ab3HIMgc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Aug 2013 08:36:32 -0400
Message-ID: <5204E24B.3090608@suse.cz>
Date: Fri, 09 Aug 2013 14:36:27 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: Allow scripts/* to be cross compiled
References: <1376046432-12588-1-git-send-email-broonie@kernel.org>
In-Reply-To: <1376046432-12588-1-git-send-email-broonie@kernel.org>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linaro-kernel@lists.linaro.org, linux-kbuild@vger.kernel.org, John Rigby <john.rigby@linaro.org>, Mark Brown <broonie@linaro.org>

On 9.8.2013 13:07, Mark Brown wrote:
> From: John Rigby <john.rigby@linaro.org>
> 
> Cross compiling the binaries in scripts/* is not possible
> because various makefiles assume that $(obj)/whatever is
> executable on the build host.

What is the use case for cross-compiling them? If you have a powerful
enough target machine to build the kernel on it, you can as well compile
the host scripts natively, can't you? But maybe I'm missing something, I
do not cross-compile the kernel on a daily basis. Are there other
projects that have such feature in their build system?


> This patch introduces a new variable called KBUILD_SCRIPTROOT
> that points to script/binaries to use while cross compiling.
> 
> Usage:
> 
> Build scripts for the build host:
> 	make O=path/to/buildhost/buildscripts \
> 		silentoldconfig prepare scripts
> Then cross build script for target:
> 	make O=path/to/target/buildscripts \
> 		HOSTCC=$CROSS_COMPILE \
> 		KBUILD_SCRIPTROOT=path/to/buildhost/buildscripts
> 		silentoldconfig prepare scripts

Note that a build that uses KBUILD_SCRIPTROOT cannot detect if the
scripts are up to date and cannot rebuild them. This must be documented.


> This patch does not use KBUILD_SCRIPTROOT for all script invocations
> it only redefines the following if KBUILD_SCRIPTROOT is defined.
> 
> scripts/Makefile.build
> 	scripts/basic/fixdep --> $(KBUILD_SCRIPTROOT)/scripts/basic/fixdep
> 
> scripts/kconfig/Makefile
> 	$(obj)/conf --> $(KBUILD_SCRIPTROOT)/scripts/kconfig/conf
> 
> scripts/mod/Makefile
> 	$(obj)mk_elfconfig --> $(KBUILD_SCRIPTROOT)/scripts/mod/mk_elfconfig

OK, but you might need to add a couple of more of them, like
lib/gen_crc32table.


> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 547e15d..09aa90c 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -222,11 +222,15 @@ if_changed = $(if $(strip $(any-prereq) $(arg-check)),                       \
>  	$(echo-cmd) $(cmd_$(1));                                             \
>  	echo 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd)
>  
> +ifeq ($(KBUILD_SCRIPTROOT),)
> +KBUILD_SCRIPTROOT=.
> +endif
> +

This should be set in the top level Makefile once.

Thanks,
Michal
