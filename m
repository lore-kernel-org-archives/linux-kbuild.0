Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:29786 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726410AbgDENYf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Apr 2020 09:24:35 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 035DOOVw013353
        for <linux-kbuild@vger.kernel.org>; Sun, 5 Apr 2020 22:24:24 +0900
Received: by mail-vs1-f44.google.com with SMTP id a63so7983150vsa.8
        for <linux-kbuild@vger.kernel.org>; Sun, 05 Apr 2020 06:24:24 -0700 (PDT)
MIME-Version: 1.0
References: <202004051910.TKfSrz1Q%lkp@intel.com>
In-Reply-To: <202004051910.TKfSrz1Q%lkp@intel.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 5 Apr 2020 22:23:47 +0900
Message-ID: <CAK7LNARBwE5BPFDreKmxw58R6fL8UDg+aH+2aQ7w1pn==6+oxA@mail.gmail.com>
Subject: Re: [kbuild:kbuild 19/31] net/netfilter/nft_set_pipapo_avx2.h:4:10:
 fatal error: asm/fpu/xstate.h: No such file or directory
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <lkp@intel.com>, "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: kbuild-all@lists.01.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nick Desaulniers <ndesaulniers@google.com>

Jason,

On Sun, Apr 5, 2020 at 8:38 PM kbuild test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
> head:   6fb9ffb9bf05ec891f8a8de85aa1b606549c57ab
> commit: 4075db8ab43ac4d05cee3cdca8764c07dceb557c [19/31] x86: update AS_* macros to binutils >=2.23, supporting ADX and AVX2
> config: s390-randconfig-a001-20200405 (attached as .config)
> compiler: s390-linux-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 4075db8ab43ac4d05cee3cdca8764c07dceb557c
>         # save the attached .config to linux build tree
>         GCC_VERSION=9.3.0 make.cross ARCH=s390
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>


This is the same pattern as we saw before.

netfilter is compiled for a different arch,
so we need to guard it with CONFIG_X86_64.
I will squash the following.




diff --git a/net/netfilter/nft_set_pipapo_avx2.h
b/net/netfilter/nft_set_pipapo_avx2.h
index 8467337c5f4c..a1cde35fdad6 100644
--- a/net/netfilter/nft_set_pipapo_avx2.h
+++ b/net/netfilter/nft_set_pipapo_avx2.h
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef _NFT_SET_PIPAPO_AVX2_H

+#ifdef CONFIG_X86_64
 #include <asm/fpu/xstate.h>
 #define NFT_PIPAPO_ALIGN       (XSAVE_YMM_SIZE / BITS_PER_BYTE)

@@ -8,4 +9,6 @@ bool nft_pipapo_avx2_lookup(const struct net *net,
const struct nft_set *set,
                            const u32 *key, const struct nft_set_ext **ext);
 bool nft_pipapo_avx2_estimate(const struct nft_set_desc *desc, u32 features,
                              struct nft_set_estimate *est);
+#endif /* CONFIG_X86_64 */
+
 #endif /* _NFT_SET_PIPAPO_AVX2_H */










> All errors (new ones prefixed by >>):
>
>    In file included from net/netfilter/nft_set_pipapo.c:342:
> >> net/netfilter/nft_set_pipapo_avx2.h:4:10: fatal error: asm/fpu/xstate.h: No such file or directory
>        4 | #include <asm/fpu/xstate.h>
>          |          ^~~~~~~~~~~~~~~~~~
>    compilation terminated.
>
> vim +4 net/netfilter/nft_set_pipapo_avx2.h
>
> 7400b063969bdc Stefano Brivio 2020-03-07  3
> 7400b063969bdc Stefano Brivio 2020-03-07 @4  #include <asm/fpu/xstate.h>
> 7400b063969bdc Stefano Brivio 2020-03-07  5  #define NFT_PIPAPO_ALIGN   (XSAVE_YMM_SIZE / BITS_PER_BYTE)
> 7400b063969bdc Stefano Brivio 2020-03-07  6
>
> :::::: The code at line 4 was first introduced by commit
> :::::: 7400b063969bdca4a06cd97f1294d765c8eecbe1 nft_set_pipapo: Introduce AVX2-based lookup implementation
>
> :::::: TO: Stefano Brivio <sbrivio@redhat.com>
> :::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org



--
Best Regards
Masahiro Yamada
