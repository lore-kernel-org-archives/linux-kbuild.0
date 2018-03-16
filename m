Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:40164 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751714AbeCPCcY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Mar 2018 22:32:24 -0400
Received: by mail-qt0-f182.google.com with SMTP id y6so9463674qtm.7
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Mar 2018 19:32:24 -0700 (PDT)
Date: Thu, 15 Mar 2018 22:32:22 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v2 7/7] kbuild: link vmlinux only once for
 CONFIG_TRIM_UNUSED_KSYMS
In-Reply-To: <1521166725-24157-8-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <nycvar.YSQ.7.76.1803152229070.28583@knanqh.ubzr>
References: <1521166725-24157-1-git-send-email-yamada.masahiro@socionext.com> <1521166725-24157-8-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

On Fri, 16 Mar 2018, Masahiro Yamada wrote:

> +# Recurse until adjust_autoksyms.sh is satisfied
> +PHONY += autoksyms_recursive
> +autoksyms_recursive: $(vmlinux-deps)
> +	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh  \
>  	  "$(MAKE) -f $(srctree)/Makefile vmlinux"
> -endif
>  
>  # For the kernel to actually contain only the needed exported symbols,
>  # we have to build modules as well to determine what those symbols are.
> @@ -1034,7 +1024,13 @@ cmd_link-vmlinux =                                                 \
>  	$(CONFIG_SHELL) $< $(LD) $(LDFLAGS) $(LDFLAGS_vmlinux) ;    \
>  	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>  
> -vmlinux: scripts/link-vmlinux.sh vmlinux_prereq $(vmlinux-deps) FORCE
> +vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE

Don't you have to make the autoksyms_recursive dependency conditional on 
CONFIG_TRIM_UNUSED_KSYMS?


Nicolas
