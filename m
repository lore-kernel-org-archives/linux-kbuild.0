Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:19034 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbgAKH0x (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 02:26:53 -0500
MIME-Version: 1.0
References: <20200104153651.2258-1-masahiroy@kernel.org> <20200106.133336.719905028750983361.davem@redhat.com>
In-Reply-To: <20200106.133336.719905028750983361.davem@redhat.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 11 Jan 2020 16:26:09 +0900
Message-ID: <CAK7LNASGJvim3Mfp3LqLd2kKR-HLM0vwwx81fSAQtWZHuqYsFw@mail.gmail.com>
Subject: Re: [PATCH] modpost: assume STT_SPARC_REGISTER is defined
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Miller <davem@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, bcollins@debian.org, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jan 7, 2020 at 6:33 AM David Miller <davem@redhat.com> wrote:
>
> From: Masahiro Yamada <masahiroy@kernel.org>
> Date: Sun,  5 Jan 2020 00:36:51 +0900
>
> > Commit 8d5290149ee1 ("[SPARC]: Deal with glibc changing macro names in
> > modpost.c") was more than 14 years ago. STT_SPARC_REGISTER is hopefully
> > defined in elf.h of recent C libraries.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>
> Acked-by: David S. Miller <davem@davemloft.net>
>

Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
