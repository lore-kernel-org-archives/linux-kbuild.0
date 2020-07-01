Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:47812 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgGARvN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 13:51:13 -0400
MIME-Version: 1.0
References: <20200701092644.762234-1-masahiroy@kernel.org> <20200701174609.mw5ovqe7d5o6ptel@ast-mbp.dhcp.thefacebook.com>
In-Reply-To: <20200701174609.mw5ovqe7d5o6ptel@ast-mbp.dhcp.thefacebook.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 2 Jul 2020 02:50:01 +0900
Message-ID: <CAK7LNARTMt8kgRJqgRonaSHROT80yDNAG0wDiLGL=RSEz3CDig@mail.gmail.com>
Subject: Re: [PATCH] bpfilter: allow to build bpfilter_umh as a module without
 static library
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Kubecek <mkubecek@suse.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrii Nakryiko <andriin@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, Martin KaFai Lau <kafai@fb.com>, Sam Ravnborg <sam@ravnborg.org>, Song Liu <songliubraving@fb.com>, =?UTF-8?Q?Valdis_Kl_=C4=93_tnieks?= <valdis.kletnieks@vt.edu>, Yonghong Song <yhs@fb.com>

On Thu, Jul 2, 2020 at 2:46 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Jul 01, 2020 at 06:26:44PM +0900, Masahiro Yamada wrote:
> > Originally, bpfilter_umh was linked with -static only when
> > CONFIG_BPFILTER_UMH=y.
> >
> > Commit 8a2cc0505cc4 ("bpfilter: use 'userprogs' syntax to build
> > bpfilter_umh") silently, accidentally dropped the CONFIG_BPFILTER_UMH=y
> > test in the Makefile. Revive it in order to link it dynamically when
> > CONFIG_BPFILTER_UMH=m.
> >
> > Since commit b1183b6dca3e ("bpfilter: check if $(CC) can link static
> > libc in Kconfig"), the compiler must be capable of static linking to
> > enable CONFIG_BPFILTER_UMH, but it requires more than needed.
> >
> > To loosen the compiler requirement, I changed the dependency as follows:
> >
> >     depends on CC_CAN_LINK
> >     depends on m || CC_CAN_LINK_STATIC
> >
> > If CONFIG_CC_CAN_LINK_STATIC in unset, CONFIG_BPFILTER_UMH is restricted
> > to 'm' or 'n'.
> >
> > In theory, CONFIG_CC_CAN_LINK is not required for CONFIG_BPFILTER_UMH=y,
> > but I did not come up with a good way to describe it.
> >
> > Fixes: 8a2cc0505cc4 ("bpfilter: use 'userprogs' syntax to build bpfilter_umh")
> > Reported-by: Michal Kubecek <mkubecek@suse.cz>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> lgtm
> Do you mind I'll take it into bpf-next tree?
> Eric is working on a bunch of patches in this area. I'll take his set
> into bpf-next as well and then can apply this patch.
> Just to make sure there are no conflicts.

Please go ahead.

Thank you.


-- 
Best Regards
Masahiro Yamada
