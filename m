Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:38285 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750748AbeFBEx3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Jun 2018 00:53:29 -0400
Received: by mail-pf0-f194.google.com with SMTP id b74-v6so9969185pfl.5
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Jun 2018 21:53:29 -0700 (PDT)
Date: Sat, 2 Jun 2018 14:53:17 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 0/4] powerpc patches for new Kconfig language
Message-ID: <20180602145317.0a6b2efd@roar.ozlabs.ibm.com>
In-Reply-To: <87po1a3alo.fsf@concordia.ellerman.id.au>
References: <20180530121922.22122-1-npiggin@gmail.com>
        <87o9gxyzpo.fsf@concordia.ellerman.id.au>
        <CAK7LNARoj4g5Wf2Do1npiQUeTpiiFZLuNdmW4JfZw2D-Oe++jw@mail.gmail.com>
        <87k1rkzbry.fsf@concordia.ellerman.id.au>
        <CAK7LNARbz8YC7=vB_Pt-FFepLfLY-Yt=8ZiOAoPeZV3EA3VQOg@mail.gmail.com>
        <876034yrek.fsf@concordia.ellerman.id.au>
        <CAK7LNASxgQOsSveFuKrx7do-+643KUZwU_Gn+z7O7JK+TtMEww@mail.gmail.com>
        <871sdq4wxp.fsf@concordia.ellerman.id.au>
        <CAK7LNASwEv8RGi=PtKyDjcwt9DFy93ug22xQAWOJ2b5j+yNkqg@mail.gmail.com>
        <87po1a3alo.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>

On Fri, 01 Jun 2018 23:22:27 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> > 2018-06-01 19:34 GMT+09:00 Michael Ellerman <mpe@ellerman.id.au>:  
> ...
> >
> > Could you update your branch, please?  
> 
> Done.
> 
> I've only pushed the first three patches this time, to avoid any
> confusion. Hopefully :)
> 
> The top commit is:
> 
>   1421dc6d4829 ("powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS")
> 
> 
> For the fourth one you're welcome to add my ack when you apply it:
> 
>   Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> 
> > Then, I will re-pull the new one.  
> 
> Thanks! Sorry this took a while to get right, next time we'll be much
> better at it ;)

Thank you both for sorting out my mess.

Thanks,
Nick
