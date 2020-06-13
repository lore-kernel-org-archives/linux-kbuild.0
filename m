Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:35118 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgFMD2V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 23:28:21 -0400
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 05D3Rq2J028614
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Jun 2020 12:27:53 +0900
Received: by mail-ua1-f44.google.com with SMTP id g44so3878322uae.12
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 20:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
 <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com> <CA+icZUUaNujMwrZFbwT1FtksCXFgnM9AohzRoq7xM8jrMN=Q5A@mail.gmail.com>
In-Reply-To: <CA+icZUUaNujMwrZFbwT1FtksCXFgnM9AohzRoq7xM8jrMN=Q5A@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 13 Jun 2020 12:27:15 +0900
Message-ID: <CAK7LNAQ94yQW4AEvdKgg=Ew2xWYLfh3OjCtxfmr-hJmwWtpiLg@mail.gmail.com>
Subject: Re: LLVM_IAS=1 and DWARF-4
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Sat, Jun 13, 2020 at 4:17 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Hi Masahiro,
>
> when I build with LLVM_IAS=1 I want to force DWARF-4.
>
> CONFIG_DEBUG_INFO_DWARF4=y sets "DEBUG_CFLAGS += -gdwarf-4".
>
> I tried:
>
> [ Makefile ]
>
> ifdef CONFIG_DEBUG_INFO
> ifdef CONFIG_DEBUG_INFO_SPLIT
> DEBUG_CFLAGS    += -gsplit-dwarf
> else
> DEBUG_CFLAGS    += -g
> endif
> ifndef LLVM_IAS
> KBUILD_AFLAGS    += -Wa,-gdwarf-2
> endif
> endif
> ifdef CONFIG_DEBUG_INFO_DWARF4
> DEBUG_CFLAGS    += -gdwarf-4
> ifdef LLVM_IAS
> KBUILD_AFLAGS    += -Wa,-gdwarf-4
> endif
> endif
>
> If I set LLVM_IAS=1 ---> CONFIG_DEBUG_INFO_DWARF4=y shall be set automatically.
>
> Dunno if "KBUILD_AFLAGS += -Wa,-gdwarf-4" is a good idea.
>
> "KBUILD_AFLAGS += -Wa,-gdwarf-2" is known to break with LLVM_IAS=1.
>
> I am lost in ifdef-eries...
>
> Any cool ideas?


Sorry, I am not familiar enough with dwarf
to understand these flags...


>
> Regards,
> - Sedat -



-- 
Best Regards
Masahiro Yamada
