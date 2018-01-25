Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:42759 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751391AbeAYNJY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jan 2018 08:09:24 -0500
MIME-Version: 1.0
In-Reply-To: <20180122134607.00d77101@cakuba.netronome.com>
References: <20180122134607.00d77101@cakuba.netronome.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 25 Jan 2018 22:08:34 +0900
Message-ID: <CAK7LNAT9_fB_NaZzT3fLsaoJhMmKeb3=m98w_=oLGN3Y9uSz=w@mail.gmail.com>
Subject: Re: Mutli-directory module Makefiles
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jakub Kicinski <kubakici@wp.pl>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2018-01-23 6:46 GMT+09:00 Jakub Kicinski <kubakici@wp.pl>:
> Hi!
>
> in drivers/net/ethernet/netronome/nfp there is a module which is built
> from C sources in 4 directories.  What is the best way to handle that?
>
> Currently we just add all the objects in one Makefile:
>
> nfp-objs := \
>             nfpcore/nfp6000_pcie.o \
>             nfpcore/nfp_cppcore.o \
> etc.


I recommend you to refactor the Makefile,
adding Makefiles into nfpcore, nic, flower, bpf sub-directories.


Also, ifeq is ugly,
can you rewrite like follows?


nfp-$(CONFIG_NFP_APP_FLOWER)    += flower/
nfp-$(CONFIG_BPF_SYSCALL)       += bpf/
nfp-$(CONFIG_NFP_DEBUG)         += nfp_net_debugfs.o





> However, this makes it impossible to build a single object in subdirs:
>
> $ make drivers/net/ethernet/netronome/nfp/nfpcore/nfp_cppcore.o
> scripts/Makefile.build:45: drivers/net/ethernet/netronome/nfp/nfpcore/Makefile: No such file or directory
> make[2]: *** No rule to make target 'drivers/net/ethernet/netronome/nfp/nfpcore/Makefile'. Stop.
>
> Documentation/kbuild/modules.txt also contains an unclear remark that
> this is not recommended (or is it about the use of $(src)?):
>
> --- 4.3 Several Subdirectories
>         ...
>         To build the module complex.ko, we then need the following
>         kbuild file:
>
>                 --> filename: Kbuild
>                 obj-m := complex.o
>                 complex-y := src/complex_main.o
>                 complex-y += src/hal/hardwareif.o
>
>                 ccflags-y := -I$(src)/include
>                 ccflags-y += -I$(src)/src/hal/include
>
>         As you can see, kbuild knows how to handle object files located
>         in other directories. The trick is to specify the directory
>         relative to the kbuild file's location. **That being said, this
>         is NOT recommended practice.**
>
> Making the include optional would work:
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> @@ -42,7 +42,7 @@ save-cflags := $(CFLAGS)
>  # The filename Kbuild has precedence over Makefile
>  kbuild-dir := $(if $(filter /%,$(src)),$(src),$(srctree)/$(src))
>  kbuild-file := $(if $(wildcard $(kbuild-dir)/Kbuild),$(kbuild-dir)/Kbuild,$(kbuild-dir)/Makefile)
> -include $(kbuild-file)
> +-include $(kbuild-file)
>
>  # If the save-* variables changed error out
>  ifeq ($(KBUILD_NOPEDANTIC),)
>
> Or we could create empty Makefiles in subdirectories...  Is there a
> better way of handling this?  Which is preferred?



-- 
Best Regards
Masahiro Yamada
