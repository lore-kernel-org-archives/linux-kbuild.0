Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vmicros1.altlinux.org ([194.107.17.57]:41746 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750897AbdCJRlk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Mar 2017 12:41:40 -0500
Date: Fri, 10 Mar 2017 20:39:52 +0300
From: Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>
Subject: Re: [PATCH] jump label: fix passing kbuild_cflags when checking for
 asm goto support
Message-ID: <20170310173952.GW27556@glebfm.cloud.tilaa.com>
References: <20170310162411.GA18175@glebfm.cloud.tilaa.com>
 <20170310120422.14e19269@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170310120422.14e19269@gandalf.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, David Lin <dtwlin@google.com>, "Anton V. Boyarshinov" <boyarsh@altlinux.org>, "Dmitry V. Levin" <ldv@altlinux.org>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Fri, Mar 10, 2017 at 12:04:22PM -0500, Steven Rostedt wrote:
> On Fri, 10 Mar 2017 19:24:18 +0300
> Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org> wrote:
> 
> > The latest change of asm goto support check added passing of
> > KBUILD_CFLAGS to compiler.  When these flags reference gcc plugins,
> > there is a race condition between the build of these plugins and their
> > use in this asm goto support check.
> > 
> > This change moves the check before all these references are added
> > to KBUILD_CFLAGS.  This is correct because subsequent KBUILD_CFLAGS
> > modifications are not relevant to this check.
> 
> What exactly breaks when the race happens?

Actually, this is not quite a race.  When you run "make bzImage" followed
by "make modules", the kernel is always built with HAVE_JUMP_LABEL
disabled, while the modules are built depending on CONFIG_JUMP_LABEL.
If HAVE_JUMP_LABEL macro happens to be different, modules are built
with undefined references:

ERROR: "static_key_slow_inc" [net/netfilter/xt_TEE.ko] undefined!
ERROR: "static_key_slow_dec" [net/netfilter/xt_TEE.ko] undefined!
ERROR: "static_key_slow_dec" [net/netfilter/nft_meta.ko] undefined!
ERROR: "static_key_slow_inc" [net/netfilter/nft_meta.ko] undefined!
ERROR: "nf_hooks_needed" [net/netfilter/ipvs/ip_vs.ko] undefined!
ERROR: "nf_hooks_needed" [net/ipv6/ipv6.ko] undefined!
ERROR: "static_key_count" [net/ipv6/ipv6.ko] undefined!
ERROR: "static_key_slow_inc" [net/ipv6/ipv6.ko] undefined!
ERROR: "nf_hooks_needed" [net/decnet/decnet.ko] undefined!

-- 
glebfm
