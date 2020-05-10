Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728597AbgEJBEq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 May 2020 21:04:46 -0400
MIME-Version: 1.0
References: <20200509073915.860588-1-masahiroy@kernel.org>
In-Reply-To: <20200509073915.860588-1-masahiroy@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 9 May 2020 18:04:32 -0700
Message-ID: <CAADnVQJvJWwziwDj0ZgPc02iHNNk8EJetDqNZ6SoWq045C-gXQ@mail.gmail.com>
Subject: Re: [PATCH] bpfilter: check if $(CC) can static link in Kconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Valdis Kletnieks <valdis.kletnieks@vt.edu>, LKML <linux-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andriin@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Network Development <netdev@vger.kernel.org>

On Sat, May 9, 2020 at 12:40 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fedora, linking static libraries requires the glibc-static RPM
> package, which is not part of the glibc-devel package.
>
> CONFIG_CC_CAN_LINK does not check the capability of static linking,
> so you can enable CONFIG_BPFILTER_UMH, then fail to build.
>
>   HOSTLD  net/bpfilter/bpfilter_umh
> /usr/bin/ld: cannot find -lc
> collect2: error: ld returned 1 exit status
>
> Add CONFIG_CC_CAN_LINK_STATIC, and make CONFIG_BPFILTER_UMH depend
> on it.
>
> Reported-by: Valdis Kletnieks <valdis.kletnieks@vt.edu>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks!
Acked-by: Alexei Starovoitov <ast@kernel.org>
