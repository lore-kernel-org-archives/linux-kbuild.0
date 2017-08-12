Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:36263 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751908AbdHLD1I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Aug 2017 23:27:08 -0400
Received: from mail-yw0-f176.google.com (mail-yw0-f176.google.com [209.85.161.176]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id v7C3QvLx002424
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Aug 2017 12:26:58 +0900
Received: by mail-yw0-f176.google.com with SMTP id l82so31906474ywc.2
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Aug 2017 20:26:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170724142047.3679-1-bjorn.forsman@gmail.com>
References: <20170724142047.3679-1-bjorn.forsman@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 12 Aug 2017 12:26:16 +0900
Message-ID: <CAK7LNARVhn9QkjOSfSHr+G2P08v9za2m51cr6kruekA8FwVVhg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: /bin/pwd -> pwd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Jan Kiszka <jan.kiszka@siemens.com>, kieran@ksquared.org.uk

Hi.


2017-07-24 23:20 GMT+09:00 Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>:
> Several places already use pwd and rely on $PATH lookup. Moving the
> remaining /bin/pwd users over for consistency.
>
> Also, a reason for doing /bin/pwd -> pwd instead of the other way around
> is because I believe build systems should make little assumptions on host
> filesystem layout. Case in point, we do this kind of patching already in
> NixOS.
>
> Signed-off-by: Bj=C3=B8rn Forsman <bjorn.forsman@gmail.com>


Kbuild conventionally used  $(shell cd foo/bar && /bin/pwd)
to get the absolute path because the minimum supported
GNU Makefile version was 3.80 and $(abspath ...) is only supported
by 3.81 or later.


Commit 37d69ee3080 bumped the min version to 3.81,
so it is legitimate to use $(abspath ).

Could you use $(abspath ...) instead of $(shell cd ... && /bin/pwd) ?






> ---
>  Documentation/ia64/xen.txt |  2 +-
>  Makefile                   | 10 +++++-----
>  scripts/gdb/linux/Makefile |  2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/Documentation/ia64/xen.txt b/Documentation/ia64/xen.txt
> index c61a99f7c8bb..a12c74ce2773 100644
> --- a/Documentation/ia64/xen.txt
> +++ b/Documentation/ia64/xen.txt
> @@ -41,7 +41,7 @@ Getting and Building Xen and Dom0
>
>   5. make initrd for Dom0/DomU
>      # make -C linux-2.6.18-xen.hg ARCH=3Dia64 modules_install \
> -      O=3D$(/bin/pwd)/build-linux-2.6.18-xen_ia64
> +      O=3D$(pwd)/build-linux-2.6.18-xen_ia64
>      # mkinitrd -f /boot/efi/efi/redhat/initrd-2.6.18.8-xen.img \
>        2.6.18.8-xen --builtin mptspi --builtin mptbase \
>        --builtin mptscsih --builtin uhci-hcd --builtin ohci-hcd \
> diff --git a/Makefile b/Makefile
> index b4fb9a1d1594..64e72eba5701 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -131,7 +131,7 @@ ifneq ($(KBUILD_OUTPUT),)
>  # check that the output directory actually exists
>  saved-output :=3D $(KBUILD_OUTPUT)
>  KBUILD_OUTPUT :=3D $(shell mkdir -p $(KBUILD_OUTPUT) && cd $(KBUILD_OUTP=
UT) \
> -                                                               && /bin/p=
wd)
> +                                                               && pwd)
>  $(if $(KBUILD_OUTPUT),, \
>       $(error failed to create output directory "$(saved-output)"))

This one should use $(realpath ...) instead of $(abspath ...), I think.

The difference between them is that
$(realpath ...) returns an empty string if the given path does not exist.







> @@ -978,7 +978,7 @@ ifdef CONFIG_HEADERS_CHECK
>         $(Q)$(MAKE) -f $(srctree)/Makefile headers_check
>  endif
>  ifdef CONFIG_GDB_SCRIPTS
> -       $(Q)ln -fsn `cd $(srctree) && /bin/pwd`/scripts/gdb/vmlinux-gdb.p=
y
> +       $(Q)ln -fsn `cd $(srctree) && pwd`/scripts/gdb/vmlinux-gdb.py
>  endif
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
> @@ -1237,7 +1237,7 @@ _modinst_:
>         @rm -rf $(MODLIB)/kernel
>         @rm -f $(MODLIB)/source
>         @mkdir -p $(MODLIB)/kernel
> -       @ln -s `cd $(srctree) && /bin/pwd` $(MODLIB)/source
> +       @ln -s `cd $(srctree) && pwd` $(MODLIB)/source
>         @if [ ! $(objtree) -ef  $(MODLIB)/build ]; then \
>                 rm -f $(MODLIB)/build ; \
>                 ln -s $(CURDIR) $(MODLIB)/build ; \
> @@ -1629,11 +1629,11 @@ image_name:
>  # Clear a bunch of variables before executing the submake
>  tools/: FORCE
>         $(Q)mkdir -p $(objtree)/tools
> -       $(Q)$(MAKE) LDFLAGS=3D MAKEFLAGS=3D"$(tools_silent) $(filter --j%=
 -j,$(MAKEFLAGS))" O=3D$(shell cd $(objtree) && /bin/pwd) subdir=3Dtools -C=
 $(src)/tools/
> +       $(Q)$(MAKE) LDFLAGS=3D MAKEFLAGS=3D"$(tools_silent) $(filter --j%=
 -j,$(MAKEFLAGS))" O=3D$(shell cd $(objtree) && pwd) subdir=3Dtools -C $(sr=
c)/tools/
>
>  tools/%: FORCE
>         $(Q)mkdir -p $(objtree)/tools
> -       $(Q)$(MAKE) LDFLAGS=3D MAKEFLAGS=3D"$(tools_silent) $(filter --j%=
 -j,$(MAKEFLAGS))" O=3D$(shell cd $(objtree) && /bin/pwd) subdir=3Dtools -C=
 $(src)/tools/ $*
> +       $(Q)$(MAKE) LDFLAGS=3D MAKEFLAGS=3D"$(tools_silent) $(filter --j%=
 -j,$(MAKEFLAGS))" O=3D$(shell cd $(objtree) && pwd) subdir=3Dtools -C $(sr=
c)/tools/ $*
>
>  # Single targets
>  # ----------------------------------------------------------------------=
-----
> diff --git a/scripts/gdb/linux/Makefile b/scripts/gdb/linux/Makefile
> index 8b00031f5349..f1ac5db46932 100644
> --- a/scripts/gdb/linux/Makefile
> +++ b/scripts/gdb/linux/Makefile
> @@ -1,6 +1,6 @@
>  always :=3D gdb-scripts
>
> -SRCTREE :=3D $(shell cd $(srctree) && /bin/pwd)
> +SRCTREE :=3D $(shell cd $(srctree) && pwd)
>
>  $(obj)/gdb-scripts:
>  ifneq ($(KBUILD_SRC),)
> --
> 2.12.2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



--=20
Best Regards
Masahiro Yamada
