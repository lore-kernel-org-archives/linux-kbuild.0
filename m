Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:60774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725765AbgCDPZT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Mar 2020 10:25:19 -0500
MIME-Version: 1.0
References: <20200304032038.14424-1-masahiroy@kernel.org> <20200304032038.14424-4-masahiroy@kernel.org>
In-Reply-To: <20200304032038.14424-4-masahiroy@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 4 Mar 2020 09:25:06 -0600
Message-ID: <CAL_JsqKt1K6nOED2TeUfyxkbWHi_KrbZFDW-ZxwgHZX-Og7-DA@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: allow to run dt_binding_check without kernel configuration
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: devicetree@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Michal Marek <michal.lkml@markovi.net>

On Tue, Mar 3, 2020 at 9:21 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The dt_binding_check target is located outside of the
> 'ifneq ($(dtstree),) ... endif' block.
>
> Hence, you can run 'make dt_binding_check' on any architecture.
> This makes a perfect sense because the dt-schema is arch-agnostic.
>
> The only one problem I see is that scripts/dtc/dtc is not always built.
> For example, ARCH=x86 defconfig does not define CONFIG_DTC. Kbuild
> descends into scripts/dtc/, but does nothing. Then, it fails to build
> *.example.dt.yaml files.

Yeah, I've just worked around this by doing 'make CONFIG_DTC=y
dt_binding_check'.

The only thing I'd come up with was just always building dtc, but I
didn't want to do that.

> Let's build scripts/dtc/dtc forcibly when running dt_binding_check.
>
> The dt-schema does not depend on any CONFIG option either, so you
> should be able to run dt_binding_check without the .config file.
>
> Going forward, you can directly run 'make dt_binding_check' in a
> pristine source tree.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile             | 2 +-
>  scripts/dtc/Makefile | 5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 7dec7b343842..190f595c7bfc 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -255,7 +255,7 @@ clean-targets := %clean mrproper cleandocs
>  no-dot-config-targets := $(clean-targets) \
>                          cscope gtags TAGS tags help% %docs check% coccicheck \
>                          $(version_h) headers headers_% archheaders archscripts \
> -                        %asm-generic kernelversion %src-pkg
> +                        %asm-generic kernelversion %src-pkg dt_binding_check
>  no-sync-config-targets := $(no-dot-config-targets) install %install \
>                            kernelrelease
>  single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
> diff --git a/scripts/dtc/Makefile b/scripts/dtc/Makefile
> index 3acbb410904c..2f3c3a7e1620 100644
> --- a/scripts/dtc/Makefile
> +++ b/scripts/dtc/Makefile
> @@ -1,8 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # scripts/dtc makefile
>
> -hostprogs              := dtc
> -always-$(CONFIG_DTC)   := $(hostprogs)
> +hostprogs                      := dtc
> +always-$(CONFIG_DTC)           += $(hostprogs)
> +always-$(CHECK_DT_BINDING)     += $(hostprogs)

This looks like a good solution.

Reviewed-by: Rob Herring <robh@kernel.org>
