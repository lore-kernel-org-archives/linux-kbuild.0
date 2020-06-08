Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:62913 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729875AbgFHNdy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 09:33:54 -0400
MIME-Version: 1.0
References: <20200423073929.127521-1-masahiroy@kernel.org> <20200423073929.127521-5-masahiroy@kernel.org>
 <20200608115628.osizkpo76cgn2ci7@lion.mk-sys.cz>
In-Reply-To: <20200608115628.osizkpo76cgn2ci7@lion.mk-sys.cz>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 8 Jun 2020 22:32:54 +0900
Message-ID: <CAK7LNAQkVA05G9f68PTyyChno2OEOq_gsmjGwML7PerZvwOuSA@mail.gmail.com>
Subject: Re: [PATCH 04/16] net: bpfilter: use 'userprogs' syntax to build bpfilter_umh
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Kubecek <mkubecek@suse.cz>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Networking <netdev@vger.kernel.org>

On Mon, Jun 8, 2020 at 8:56 PM Michal Kubecek <mkubecek@suse.cz> wrote:
>
> On Thu, Apr 23, 2020 at 04:39:17PM +0900, Masahiro Yamada wrote:
> > The user mode helper should be compiled for the same architecture as
> > the kernel.
> >
> > This Makefile reuses the 'hostprogs' syntax by overriding HOSTCC with CC.
> >
> > Now that Kbuild provides the syntax 'userprogs', use it to fix the
> > Makefile mess.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > Reported-by: kbuild test robot <lkp@intel.com>
> > ---
> >
> >  net/bpfilter/Makefile | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/net/bpfilter/Makefile b/net/bpfilter/Makefile
> > index 36580301da70..6ee650c6badb 100644
> > --- a/net/bpfilter/Makefile
> > +++ b/net/bpfilter/Makefile
> > @@ -3,17 +3,14 @@
> >  # Makefile for the Linux BPFILTER layer.
> >  #
> >
> > -hostprogs := bpfilter_umh
> > +userprogs := bpfilter_umh
> >  bpfilter_umh-objs := main.o
> > -KBUILD_HOSTCFLAGS += -I $(srctree)/tools/include/ -I $(srctree)/tools/include/uapi
> > -HOSTCC := $(CC)
> > +user-ccflags += -I $(srctree)/tools/include/ -I $(srctree)/tools/include/uapi
> >
> > -ifeq ($(CONFIG_BPFILTER_UMH), y)
> > -# builtin bpfilter_umh should be compiled with -static
> > +# builtin bpfilter_umh should be linked with -static
> >  # since rootfs isn't mounted at the time of __init
> >  # function is called and do_execv won't find elf interpreter
> > -KBUILD_HOSTLDFLAGS += -static
> > -endif
> > +bpfilter_umh-ldflags += -static
> >
> >  $(obj)/bpfilter_umh_blob.o: $(obj)/bpfilter_umh
>
> Hello,
>
> I just noticed that this patch (now in mainline as commit 8a2cc0505cc4)
> drops the test if CONFIG_BPFILTER_UMH is "y" so that -static is now
> passed to the linker even if bpfilter_umh is built as a module which
> wasn't the case in v5.7.
>
> This is not mentioned in the commit message and the comment still says
> "*builtin* bpfilter_umh should be linked with -static" so this change
> doesn't seem to be intentional. Did I miss something?
>
> Michal Kubecek


Sorry. ifeq was accidentally dropped.
I will restore it.

-- 
Best Regards
Masahiro Yamada
