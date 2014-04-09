Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f172.google.com ([209.85.214.172]:57044 "EHLO
	mail-ob0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932866AbaDIOKU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Apr 2014 10:10:20 -0400
Received: by mail-ob0-f172.google.com with SMTP id wm4so2733275obc.17
        for <linux-kbuild@vger.kernel.org>; Wed, 09 Apr 2014 07:10:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1397027753-15444-1-git-send-email-yamada.m@jp.panasonic.com>
References: <1397027753-15444-1-git-send-email-yamada.m@jp.panasonic.com>
From: Peter Foley <pefoley2@pefoley.com>
Date: Wed, 9 Apr 2014 10:09:59 -0400
Message-ID: <CAOFdcFOSfx28OvPq_9k_GqAbrPNujdUFC7Tg4hpDY68twqUt1Q@mail.gmail.com>
Subject: Re: [PATCH] x86: suppress "Nothing to be done for ..." messages
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wed, Apr 9, 2014 at 3:15 AM, Masahiro Yamada
<yamada.m@jp.panasonic.com> wrote:
> When we compiled again, arch/x86/syscalls/Makefile and
> arch/x86/tools/Makefile emitted "Nothing to be done for ..." messages.
>
> Here is the command log:
>
>   $ make defconfig
>      [ snip ]
>   $ make
>      [ snip ]
>   $ make
>   make[1]: Nothing to be done for `all'.            <-----
>   make[1]: Nothing to be done for `relocs'.         <-----
>     CHK     include/config/kernel.release
>     CHK     include/generated/uapi/linux/version.h
>
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> ---
>  arch/x86/syscalls/Makefile | 1 +
>  arch/x86/tools/Makefile    | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/x86/syscalls/Makefile b/arch/x86/syscalls/Makefile
> index f325af2..b6c923a 100644
> --- a/arch/x86/syscalls/Makefile
> +++ b/arch/x86/syscalls/Makefile
> @@ -56,3 +56,4 @@ targets       += $(uapisyshdr-y) $(syshdr-y)
>
>  all: $(addprefix $(uapi)/,$(uapisyshdr-y))
>  all: $(addprefix $(out)/,$(syshdr-y))
> +       @:
> diff --git a/arch/x86/tools/Makefile b/arch/x86/tools/Makefile
> index e812034..95e3ed7 100644
> --- a/arch/x86/tools/Makefile
> +++ b/arch/x86/tools/Makefile
> @@ -41,3 +41,4 @@ HOST_EXTRACFLAGS += -I$(srctree)/tools/include
>  hostprogs-y    += relocs
>  relocs-objs     := relocs_32.o relocs_64.o relocs_common.o
>  relocs: $(obj)/relocs
> +       @:
> --
> 1.8.3.2
>
> --

Acked-by: Peter Foley <pefoley2@pefoley.com>

I've an identical patch lying around that I haven't gotten around to
submitting yet.
