Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:62864 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933164AbdDWGsR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Apr 2017 02:48:17 -0400
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com [209.85.161.182]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id v3N6ljmN019608
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Apr 2017 15:47:46 +0900
Received: by mail-yw0-f182.google.com with SMTP id 203so63911431ywe.0
        for <linux-kbuild@vger.kernel.org>; Sat, 22 Apr 2017 23:47:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170418010011.GC4152@decadent.org.uk>
References: <20170418010011.GC4152@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 23 Apr 2017 15:47:44 +0900
Message-ID: <CAK7LNASG59wc7Ed24HFiGn0CFUxjDtMgKwy8dhz2PfvRDw1Y1w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Do not use hyphen in exported variable name
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>

Hi Ben,


2017-04-18 10:00 GMT+09:00 Ben Hutchings <ben@decadent.org.uk>:
> This definition in Makefile.dtbinst:
>
>     export dtbinst-root ?= $(obj)
>
> should define and export dtbinst-root when handling the root dts
> directory, and do nothing in the subdirectories.  However, the
> variable does not reliably get exported to the environment, perhaps
> because its name contains a hyphen.
>
> Rename the variable to dtbinst_root.
>
> References: https://bugs.debian.org/833561
> Fixes: 323a028d39cdi ("dts, kbuild: Implement support for dtb vendor subdirs")
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
> --- a/scripts/Makefile.dtbinst
> +++ b/scripts/Makefile.dtbinst
> @@ -14,7 +14,7 @@ src := $(obj)
>  PHONY := __dtbs_install
>  __dtbs_install:
>
> -export dtbinst-root ?= $(obj)
> +export dtbinst_root ?= $(obj)
>
>  include include/config/auto.conf
>  include scripts/Kbuild.include
> @@ -22,7 +22,7 @@ include $(src)/Makefile
>
>  PHONY += __dtbs_install_prep
>  __dtbs_install_prep:
> -ifeq ("$(dtbinst-root)", "$(obj)")
> +ifeq ("$(dtbinst_root)", "$(obj)")
>         $(Q)mkdir -p $(INSTALL_DTBS_PATH)
>  endif
>
> @@ -33,7 +33,7 @@ dtbinst-dirs  := $(dts-dirs)
>  quiet_cmd_dtb_install =        INSTALL $<
>        cmd_dtb_install =        mkdir -p $(2); cp $< $(2)
>
> -install-dir = $(patsubst $(dtbinst-root)%,$(INSTALL_DTBS_PATH)%,$(obj))
> +install-dir = $(patsubst $(dtbinst_root)%,$(INSTALL_DTBS_PATH)%,$(obj))
>
>  $(dtbinst-files) $(dtbinst-dirs): | __dtbs_install_prep
>



I tested dtbs_install once again by myself, but
dtbinst-root is exported to the sub make
and the vendor directories are created correctly.


I checked the debian's forum you gave
> References: https://bugs.debian.org/833561

In there, you mentioned:
"This looks like a bug in make, but we can at least work around it by
using a non-hyphenated variable name."


Does this issue happen on a specific Make version?

I tested GNU make 3.81, 3.82, 4.0, 4.1, 4.2,
but I was not hit by the problem.



In the last post in the thread, you concluded:
"We believe that the bug you reported is fixed in the latest version of
linux, which is due to be installed in the Debian FTP archive."


If so, why is this patch here?
How is the dtbs_install procedure different in the Debian package?


-- 
Best Regards
Masahiro Yamada
