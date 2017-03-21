Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:50003 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757341AbdCURtF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Mar 2017 13:49:05 -0400
MIME-Version: 1.0
In-Reply-To: <20170320171553.GB23333@glebfm.cloud.tilaa.com>
References: <20170310162411.GA18175@glebfm.cloud.tilaa.com>
 <20170310120422.14e19269@gandalf.local.home> <20170310173952.GW27556@glebfm.cloud.tilaa.com>
 <20170310124210.5f52305f@gandalf.local.home> <20170310175536.GX27556@glebfm.cloud.tilaa.com>
 <20170320171553.GB23333@glebfm.cloud.tilaa.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 22 Mar 2017 02:48:44 +0900
Message-ID: <CAK7LNATDkCkC=XqA8xkECNhKf_Jh+4aWLgaNZGopBdrVAxHPhg@mail.gmail.com>
Subject: Re: [PING PATCH v2] jump label: fix passing kbuild_cflags when
 checking for asm goto support
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, David Lin <dtwlin@google.com>, "Anton V. Boyarshinov" <boyarsh@altlinux.org>, "Dmitry V. Levin" <ldv@altlinux.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>

2017-03-21 2:15 GMT+09:00 Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>:
> The latest change of asm goto support check added passing of KBUILD_CFLAGS
> to compiler.  When these flags reference gcc plugins that are not built yet,
> the check fails.
>
> When one runs "make bzImage" followed by "make modules", the kernel is always
> built with HAVE_JUMP_LABEL disabled, while the modules are built depending on
> CONFIG_JUMP_LABEL.  If HAVE_JUMP_LABEL macro happens to be different, modules
> are built with undefined references, e.g.:
>
> ERROR: "static_key_slow_inc" [net/netfilter/xt_TEE.ko] undefined!
> ERROR: "static_key_slow_dec" [net/netfilter/xt_TEE.ko] undefined!
> ERROR: "static_key_slow_dec" [net/netfilter/nft_meta.ko] undefined!
> ERROR: "static_key_slow_inc" [net/netfilter/nft_meta.ko] undefined!
> ERROR: "nf_hooks_needed" [net/netfilter/ipvs/ip_vs.ko] undefined!
> ERROR: "nf_hooks_needed" [net/ipv6/ipv6.ko] undefined!
> ERROR: "static_key_count" [net/ipv6/ipv6.ko] undefined!
> ERROR: "static_key_slow_inc" [net/ipv6/ipv6.ko] undefined!
>
> This change moves the check before all these references are added
> to KBUILD_CFLAGS.  This is correct because subsequent KBUILD_CFLAGS
> modifications are not relevant to this check.
>
> Reported-by: Anton V. Boyarshinov <boyarsh@altlinux.org>
> Fixes: 35f860f9ba6a ("jump label: pass kbuild_cflags when checking for asm goto support")
> Cc: stable@vger.kernel.org      # v4.10
> Signed-off-by: Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Acked-by: David Lin <dtwlin@google.com>
> ---
> v2: update description of the problem fixed by this patch
>


I assume this PING is addressed to me.

First, Steven asked Andrew to pick up this,
but I have not seen it in linux-next yet. So,

Applied to linux-kbuild/fixes.  Thanks!




-- 
Best Regards
Masahiro Yamada
