Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725272AbgFMFef (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Jun 2020 01:34:35 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648D0C03E96F
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 22:34:35 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id u13so12468898iol.10
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 22:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
 <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
 <CA+icZUUaNujMwrZFbwT1FtksCXFgnM9AohzRoq7xM8jrMN=Q5A@mail.gmail.com> <CAK7LNAQ94yQW4AEvdKgg=Ew2xWYLfh3OjCtxfmr-hJmwWtpiLg@mail.gmail.com>
In-Reply-To: <CAK7LNAQ94yQW4AEvdKgg=Ew2xWYLfh3OjCtxfmr-hJmwWtpiLg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Sat, 13 Jun 2020 07:34:22 +0200
Message-ID: <CA+icZUVSHCi2fcwn0-CWkNJVadwKR9W=w1s8xKec2bZST4-3dw@mail.gmail.com>
Subject: Re: LLVM_IAS=1 and DWARF-4
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Jun 13, 2020 at 5:28 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Jun 13, 2020 at 4:17 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Hi Masahiro,
> >
> > when I build with LLVM_IAS=1 I want to force DWARF-4.
> >
> > CONFIG_DEBUG_INFO_DWARF4=y sets "DEBUG_CFLAGS += -gdwarf-4".
> >
> > I tried:
> >
> > [ Makefile ]
> >
> > ifdef CONFIG_DEBUG_INFO
> > ifdef CONFIG_DEBUG_INFO_SPLIT
> > DEBUG_CFLAGS    += -gsplit-dwarf
> > else
> > DEBUG_CFLAGS    += -g
> > endif
> > ifndef LLVM_IAS
> > KBUILD_AFLAGS    += -Wa,-gdwarf-2
> > endif
> > endif
> > ifdef CONFIG_DEBUG_INFO_DWARF4
> > DEBUG_CFLAGS    += -gdwarf-4
> > ifdef LLVM_IAS
> > KBUILD_AFLAGS    += -Wa,-gdwarf-4
> > endif
> > endif
> >
> > If I set LLVM_IAS=1 ---> CONFIG_DEBUG_INFO_DWARF4=y shall be set automatically.
> >
> > Dunno if "KBUILD_AFLAGS += -Wa,-gdwarf-4" is a good idea.
> >
> > "KBUILD_AFLAGS += -Wa,-gdwarf-2" is known to break with LLVM_IAS=1.
> >
> > I am lost in ifdef-eries...
> >
> > Any cool ideas?
>
>
> Sorry, I am not familiar enough with dwarf
> to understand these flags...
>

Hi Masahiro,

Thanks for your precious time and to be so honest.

Regards,
- Sedat -
