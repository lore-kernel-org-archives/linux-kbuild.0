Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:45028 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbfEMC1P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:27:15 -0400
MIME-Version: 1.0
References: <1557363619-1211-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1557363619-1211-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 13 May 2019 11:26:27 +0900
Message-ID: <CAK7LNATe-oevpvO5gWtWL1KWP87kv7FxRDfTsd1nqZu7V5uxyw@mail.gmail.com>
Subject: Re: [PATCH v2] samples: guard sub-directories with CONFIG options
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Yonghong Song <yhs@fb.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin KaFai Lau <kafai@fb.com>, bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>

On Thu, May 9, 2019 at 10:01 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Do not descend to sub-directories when unneeded.
>
> I used subdir-$(CONFIG_...) for hidraw, seccomp, and vfs because
> they only contain host programs.
>
> While we are here, let's add SPDX License tag, and sort the directories
> alphabetically.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - Rebased on mainline

Applied to linux-kbuild.



>  samples/Makefile         | 24 ++++++++++++++++++++----
>  samples/seccomp/Makefile |  2 +-
>  samples/vfs/Makefile     |  2 +-
>  3 files changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/samples/Makefile b/samples/Makefile
> index 8e096e0..debf892 100644
> --- a/samples/Makefile
> +++ b/samples/Makefile
> @@ -1,6 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0
>  # Makefile for Linux samples code
>
> -obj-y                  += kobject/ kprobes/ trace_events/ livepatch/ \
> -                          hw_breakpoint/ kfifo/ kdb/ hidraw/ rpmsg/ seccomp/ \
> -                          configfs/ connector/ v4l/ trace_printk/ \
> -                          vfio-mdev/ vfs/ qmi/ binderfs/ pidfd/
> +obj-$(CONFIG_SAMPLE_ANDROID_BINDERFS)  += binderfs/
> +obj-$(CONFIG_SAMPLE_CONFIGFS)          += configfs/
> +obj-$(CONFIG_SAMPLE_CONNECTOR)         += connector/
> +subdir-y                               += hidraw
> +obj-$(CONFIG_SAMPLE_HW_BREAKPOINT)     += hw_breakpoint/
> +obj-$(CONFIG_SAMPLE_KDB)               += kdb/
> +obj-$(CONFIG_SAMPLE_KFIFO)             += kfifo/
> +obj-$(CONFIG_SAMPLE_KOBJECT)           += kobject/
> +obj-$(CONFIG_SAMPLE_KPROBES)           += kprobes/
> +obj-$(CONFIG_SAMPLE_LIVEPATCH)         += livepatch/
> +subdir-y                               += pidfd
> +obj-$(CONFIG_SAMPLE_QMI_CLIENT)                += qmi/
> +obj-$(CONFIG_SAMPLE_RPMSG_CLIENT)      += rpmsg/
> +subdir-$(CONFIG_SAMPLE_SECCOMP)                += seccomp
> +obj-$(CONFIG_SAMPLE_TRACE_EVENTS)      += trace_events/
> +obj-$(CONFIG_SAMPLE_TRACE_PRINTK)      += trace_printk/
> +obj-$(CONFIG_VIDEO_PCI_SKELETON)       += v4l/
> +obj-y                                  += vfio-mdev/
> +subdir-$(CONFIG_SAMPLE_VFS)            += vfs
> diff --git a/samples/seccomp/Makefile b/samples/seccomp/Makefile
> index 00e0b5e..009775b 100644
> --- a/samples/seccomp/Makefile
> +++ b/samples/seccomp/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  ifndef CROSS_COMPILE
> -hostprogs-$(CONFIG_SAMPLE_SECCOMP) := bpf-fancy dropper bpf-direct user-trap
> +hostprogs-y := bpf-fancy dropper bpf-direct user-trap
>
>  HOSTCFLAGS_bpf-fancy.o += -I$(objtree)/usr/include
>  HOSTCFLAGS_bpf-fancy.o += -idirafter $(objtree)/include
> diff --git a/samples/vfs/Makefile b/samples/vfs/Makefile
> index 4ac9690..a3e4ffd 100644
> --- a/samples/vfs/Makefile
> +++ b/samples/vfs/Makefile
> @@ -1,5 +1,5 @@
>  # List of programs to build
> -hostprogs-$(CONFIG_SAMPLE_VFS) := \
> +hostprogs-y := \
>         test-fsmount \
>         test-statx
>
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
