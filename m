Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbgGARqN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 13:46:13 -0400
Date: Wed, 1 Jul 2020 10:46:09 -0700
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: [PATCH] bpfilter: allow to build bpfilter_umh as a module
 without static library
Message-ID: <20200701174609.mw5ovqe7d5o6ptel@ast-mbp.dhcp.thefacebook.com>
References: <20200701092644.762234-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701092644.762234-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kbuild@vger.kernel.org, Michal Kubecek <mkubecek@suse.cz>, linux-kernel@vger.kernel.org, Andrii Nakryiko <andriin@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, Martin KaFai Lau <kafai@fb.com>, Sam Ravnborg <sam@ravnborg.org>, Song Liu <songliubraving@fb.com>, Valdis Kl =?utf-8?B?xJM=?= tnieks <valdis.kletnieks@vt.edu>, Yonghong Song <yhs@fb.com>

On Wed, Jul 01, 2020 at 06:26:44PM +0900, Masahiro Yamada wrote:
> Originally, bpfilter_umh was linked with -static only when
> CONFIG_BPFILTER_UMH=y.
> 
> Commit 8a2cc0505cc4 ("bpfilter: use 'userprogs' syntax to build
> bpfilter_umh") silently, accidentally dropped the CONFIG_BPFILTER_UMH=y
> test in the Makefile. Revive it in order to link it dynamically when
> CONFIG_BPFILTER_UMH=m.
> 
> Since commit b1183b6dca3e ("bpfilter: check if $(CC) can link static
> libc in Kconfig"), the compiler must be capable of static linking to
> enable CONFIG_BPFILTER_UMH, but it requires more than needed.
> 
> To loosen the compiler requirement, I changed the dependency as follows:
> 
>     depends on CC_CAN_LINK
>     depends on m || CC_CAN_LINK_STATIC
> 
> If CONFIG_CC_CAN_LINK_STATIC in unset, CONFIG_BPFILTER_UMH is restricted
> to 'm' or 'n'.
> 
> In theory, CONFIG_CC_CAN_LINK is not required for CONFIG_BPFILTER_UMH=y,
> but I did not come up with a good way to describe it.
> 
> Fixes: 8a2cc0505cc4 ("bpfilter: use 'userprogs' syntax to build bpfilter_umh")
> Reported-by: Michal Kubecek <mkubecek@suse.cz>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

lgtm
Do you mind I'll take it into bpf-next tree?
Eric is working on a bunch of patches in this area. I'll take his set
into bpf-next as well and then can apply this patch.
Just to make sure there are no conflicts.
