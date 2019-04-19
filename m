Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef-06.nifty.com ([202.248.20.71]:17840 "EHLO
        condef-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727636AbfDSST3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Apr 2019 14:19:29 -0400
Received: from conssluserg-05.nifty.com ([10.126.8.84])by condef-06.nifty.com with ESMTP id x3J4sKPa000462
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Apr 2019 13:54:20 +0900
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x3J4sBEo014798
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Apr 2019 13:54:11 +0900
Received: by mail-vs1-f42.google.com with SMTP id w13so2344484vsc.4
        for <linux-kbuild@vger.kernel.org>; Thu, 18 Apr 2019 21:54:11 -0700 (PDT)
MIME-Version: 1.0
References: <1554992415-292288-1-git-send-email-steven.sistare@oracle.com> <1554992415-292288-3-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1554992415-292288-3-git-send-email-steven.sistare@oracle.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 19 Apr 2019 13:53:34 +0900
Message-ID: <CAK7LNARo=BNXo1JLvrE=z4d=waRTo_RCeF=LE7t5A1csewtm0g@mail.gmail.com>
Subject: Re: [PATCH V1 2/3] kbuild: optimize modules_install target
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steve Sistare <steven.sistare@oracle.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Apr 11, 2019 at 11:33 PM Steve Sistare
<steven.sistare@oracle.com> wrote:
>
> Perform module install actions only if the object area module is newer than
> install area module, and only announce the updated modules.  This saves 10's
> of seconds for a single CPU make, saves a few seconds for a parallel make,
> and reduces output clutter for an incremental make.

This will miss to detect the change of
CONFIG_MODULE_SIG_ALL, CONFIG_MODULE_COMPRESS.



> Example:
>   % touch drivers/virtio/virtio_ring.c
>   % make modules modules_install
>   DESCEND  objtool
>   CALL    scripts/atomic/check-atomics.sh
>   CALL    scripts/checksyscalls.sh
>   CC [M]  drivers/virtio/virtio_ring.o
>   Building modules, stage 2.
>   MODPOST 2592 modules
>   LD [M]  drivers/virtio/virtio_ring.ko
>   INSTALL drivers/virtio/virtio_ring.ko
>   DEPMOD  5.1.0-rc3
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  Makefile                 |  1 -
>  scripts/Makefile.modinst | 30 +++++++++++++++++++++++-------
>  2 files changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 4988dcc..8f58e27 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1286,7 +1286,6 @@ modules_install: _modinst_ _modinst_post
>
>  PHONY += _modinst_
>  _modinst_:
> -       @rm -rf $(MODLIB)/kernel
>         @rm -f $(MODLIB)/source
>         @mkdir -p $(MODLIB)/kernel
>         @ln -s $(abspath $(srctree)) $(MODLIB)/source
> diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
> index 0dae402..062fdca6 100644
> --- a/scripts/Makefile.modinst
> +++ b/scripts/Makefile.modinst
> @@ -10,6 +10,12 @@ include scripts/Kbuild.include
>
>  #
>
> +ifeq ($(quiet),quiet_)
> +  mod_announce_cmd := echo
> +else
> +  mod_announce_cmd := true
> +endif

This opts out of the Kbuild policy.




>  __modules := $(sort $(shell grep -h '\.ko$$' /dev/null $(wildcard $(MODVERDIR)/*.mod)))
>  modules := $(patsubst %.o,%.ko,$(wildcard $(__modules:.ko=.o)))
>
> @@ -17,14 +23,24 @@ PHONY += $(modules)
>  __modinst: $(modules)
>         @:
>
> -# Don't stop modules_install if we can't sign external modules.
> -quiet_cmd_modules_install = INSTALL $@
> +# Perform install actions only if the tree module is newer than the installed
> +# module.  Create the latter with a final move command to avoid a broken
> +# installed module if one of the intermediate commands fails.  Suppress
> +# quiet_cmd so that only updated modules are announced.  Don't stop
> +# modules_install if we can't sign external modules.
> +
> +quiet_cmd_modules_install =
>        cmd_modules_install = \
> -    mkdir -p $(2) ; \
> -    cp $@ $(2) ; \
> -    $(mod_strip_cmd) $(2)/$(notdir $@) ; \
> -    $(mod_sign_cmd) $(2)/$(notdir $@) $(patsubst %,|| true,$(KBUILD_EXTMOD)) ; \
> -    $(mod_compress_cmd) $(2)/$(notdir $@)
> +    if [[ $@ -nt $(2)/$(notdir $@) ]]; then \
> +       $(mod_announce_cmd) '  INSTALL' $@ ; \
> +       mkdir -p $(2) ; \
> +       tmpfile=$(2)/.$(notdir $@).tmp ; \
> +       cp $@ $$tmpfile ; \
> +       $(mod_strip_cmd) $$tmpfile ; \
> +       $(mod_sign_cmd) $$tmpfile $(patsubst %,|| true,$(KBUILD_EXTMOD)) ; \
> +       $(mod_compress_cmd) $$tmpfile ; \
> +       mv $$tmpfile $(2)/$(notdir $@) ; \
> +    fi
>
>  # Modules built outside the kernel source tree go into extra by default
>  INSTALL_MOD_DIR ?= extra
> --
> 1.8.3.1
>


-- 
Best Regards
Masahiro Yamada
