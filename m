Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:49024 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726972AbeHBA7O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Aug 2018 20:59:14 -0400
Received: from mail-vk0-f46.google.com (mail-vk0-f46.google.com [209.85.213.46]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id w71NB0PS003261
        for <linux-kbuild@vger.kernel.org>; Thu, 2 Aug 2018 08:11:01 +0900
Received: by mail-vk0-f46.google.com with SMTP id b14-v6so120714vke.13
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Aug 2018 16:11:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180726101934.GT14131@decadent.org.uk>
References: <20180726101934.GT14131@decadent.org.uk>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 2 Aug 2018 08:10:20 +0900
Message-ID: <CAK7LNAS0hZDKQmP0aLCM9j-SiWgrmGW=jP4g_x+TqGBOmnPU1w@mail.gmail.com>
Subject: Re: [PATCH 00/12] Update architecture detection
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>

2018-07-26 19:19 GMT+09:00 Ben Hutchings <ben@decadent.org.uk>:
> This series cleans up the set_debarch function in
> scripts/package/mkdebian and adds support for several additional
> Debian architectures.
>
> Ben.
>
> Ben Hutchings (12):
>   builddeb: Skip architecture detection when KBUILD_DEBARCH is set
>   builddeb: Change architecture detection fallback to use
>     dpkg-architecture
>   builddeb: Drop check for 32-bit s390
>   builddeb: Introduce functions to simplify kconfig tests in set_debarch
>   builddeb: Add automatic support for ppc64 and powerpcspe architectures
>   builddeb: Add automatic support for mips64el architecture
>   builddeb: Add automatic support for mips46{,64}{,el} architectures
>   builddeb: Add automatic support for sparc64 architecture
>   builddeb: Add automatic support for or1k architecture
>   builddeb: Add automatic support for m68k architecture
>   builddeb: Add automatic support for riscv* architectures
>   builddeb: Add automatic support for sh{3,4}{,eb} architectures
>
>  scripts/package/mkdebian | 68 +++++++++++++++++++++++++++++-----------
>  1 file changed, 50 insertions(+), 18 deletions(-)
>

Applied.  Thanks!


-- 
Best Regards
Masahiro Yamada
