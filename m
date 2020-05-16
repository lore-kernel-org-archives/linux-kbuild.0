Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:45465 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgEPCpN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 May 2020 22:45:13 -0400
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 04G2itsW014109
        for <linux-kbuild@vger.kernel.org>; Sat, 16 May 2020 11:44:56 +0900
Received: by mail-ua1-f49.google.com with SMTP id k3so1525528ual.8
        for <linux-kbuild@vger.kernel.org>; Fri, 15 May 2020 19:44:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200501224300.1012-1-marek.behun@nic.cz> <20200502202943.0c13a451@nic.cz>
In-Reply-To: <20200502202943.0c13a451@nic.cz>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 16 May 2020 11:44:19 +0900
Message-ID: <CAK7LNARsOovPQaST64sSrqL4ypXr5FsuhhivNiswjMzRH1mXFg@mail.gmail.com>
Subject: Re: [PATCH kbuild RFC] kbuild: fix modpost throwing away module
 symvers when linking vmlinux.o
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Marek Behun <marek.behun@nic.cz>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Sun, May 3, 2020 at 3:29 AM Marek Behun <marek.behun@nic.cz> wrote:
>
> Just to note how this breaks things:
>
> On OpenWRT this may happen
> 1. make modules is run
>    - Module.symvers contains symbols from modules
> 2. make Image/bzImage is run (as part of another OpenWRT make target)
>    - Module.symvers is rewritten to contain only vmlinux.o symbols
> 3. external kernel modules try to build (wireguard, mac80211)
>    - this now fails because external modules may depend on symbols from
>      other modules and this information isn't in Module.symvers anymore
>
> Marek


Is this a regression by a721588d9475 ?

I can reproduce it even before that commit.


$ git checkout a721588d^
HEAD is now at acf2a1397a68 kbuild: modpost: remove unnecessary
dependency for __modpost
$ make mrproper
  [ snip ]
$ make defconfig
  [ snip]
$ make -j24 modules
  [ snip ]
$ cat Module.symvers
0x00000000 nf_log_dump_packet_common net/netfilter/nf_log_common
EXPORT_SYMBOL_GPL
0x00000000 nf_log_l2packet net/netfilter/nf_log_common EXPORT_SYMBOL_GPL
0x00000000 nf_log_dump_sk_uid_gid net/netfilter/nf_log_common EXPORT_SYMBOL_GPL
0x00000000 nf_log_dump_tcp_header net/netfilter/nf_log_common EXPORT_SYMBOL_GPL
0x00000000 nf_log_dump_udp_header net/netfilter/nf_log_common EXPORT_SYMBOL_GPL

$ make -j24 bzImage
  [ snip ]
$ grep  -v  vmlinux   Module.symvers
  [ nothing is printed.  symbols from nf_log_common.ko are gone. ]


I can change it, but this is a long-standing behavior, I think.






--
Best Regards

Masahiro Yamada
