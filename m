Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:44719 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgELEdy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 00:33:54 -0400
MIME-Version: 1.0
References: <20200509073915.860588-1-masahiroy@kernel.org> <CAADnVQJvJWwziwDj0ZgPc02iHNNk8EJetDqNZ6SoWq045C-gXQ@mail.gmail.com>
In-Reply-To: <CAADnVQJvJWwziwDj0ZgPc02iHNNk8EJetDqNZ6SoWq045C-gXQ@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 12 May 2020 13:32:53 +0900
Message-ID: <CAK7LNARg96EfyZTHdDDToGqwhaokaG-PQCOyCHL1id14YxY3-A@mail.gmail.com>
Subject: Re: [PATCH] bpfilter: check if $(CC) can static link in Kconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Valdis Kletnieks <valdis.kletnieks@vt.edu>, LKML <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Network Development <netdev@vger.kernel.org>

On Sun, May 10, 2020 at 10:04 AM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Sat, May 9, 2020 at 12:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Fedora, linking static libraries requires the glibc-static RPM
> > package, which is not part of the glibc-devel package.
> >
> > CONFIG_CC_CAN_LINK does not check the capability of static linking,
> > so you can enable CONFIG_BPFILTER_UMH, then fail to build.
> >
> >   HOSTLD  net/bpfilter/bpfilter_umh
> > /usr/bin/ld: cannot find -lc
> > collect2: error: ld returned 1 exit status
> >
> > Add CONFIG_CC_CAN_LINK_STATIC, and make CONFIG_BPFILTER_UMH depend
> > on it.
> >
> > Reported-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Thanks!
> Acked-by: Alexei Starovoitov <ast@kernel.org>

Applied to linux-kbuild
with Alexei's Ack.


-- 
Best Regards
Masahiro Yamada
