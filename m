Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:47697 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751293AbeFANWf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Jun 2018 09:22:35 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 0/4] powerpc patches for new Kconfig language
In-Reply-To: <CAK7LNASwEv8RGi=PtKyDjcwt9DFy93ug22xQAWOJ2b5j+yNkqg@mail.gmail.com>
References: <20180530121922.22122-1-npiggin@gmail.com> <87o9gxyzpo.fsf@concordia.ellerman.id.au> <CAK7LNARoj4g5Wf2Do1npiQUeTpiiFZLuNdmW4JfZw2D-Oe++jw@mail.gmail.com> <87k1rkzbry.fsf@concordia.ellerman.id.au> <CAK7LNARbz8YC7=vB_Pt-FFepLfLY-Yt=8ZiOAoPeZV3EA3VQOg@mail.gmail.com> <876034yrek.fsf@concordia.ellerman.id.au> <CAK7LNASxgQOsSveFuKrx7do-+643KUZwU_Gn+z7O7JK+TtMEww@mail.gmail.com> <871sdq4wxp.fsf@concordia.ellerman.id.au> <CAK7LNASwEv8RGi=PtKyDjcwt9DFy93ug22xQAWOJ2b5j+yNkqg@mail.gmail.com>
Date: Fri, 01 Jun 2018 23:22:27 +1000
Message-ID: <87po1a3alo.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> 2018-06-01 19:34 GMT+09:00 Michael Ellerman <mpe@ellerman.id.au>:
...
>
> Could you update your branch, please?

Done.

I've only pushed the first three patches this time, to avoid any
confusion. Hopefully :)

The top commit is:

  1421dc6d4829 ("powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS")


For the fourth one you're welcome to add my ack when you apply it:

  Acked-by: Michael Ellerman <mpe@ellerman.id.au>

> Then, I will re-pull the new one.

Thanks! Sorry this took a while to get right, next time we'll be much
better at it ;)

cheers
