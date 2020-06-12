Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLTRV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jun 2020 15:17:21 -0400
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82BC8C03E96F
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 12:17:21 -0700 (PDT)
Received: by mail-il1-x132.google.com with SMTP id b5so9791968iln.5
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jun 2020 12:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <CA+icZUX20_yarSs7fJWq6Sxy3xBaeUXSQjmMbjcQFXB4JnyijA@mail.gmail.com>
 <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
In-Reply-To: <CAK7LNAQuiuj5UifVBYEN7Xkp5GH0RNiWc5F3VyA1BAjGAUhqhw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Fri, 12 Jun 2020 21:17:09 +0200
Message-ID: <CA+icZUUaNujMwrZFbwT1FtksCXFgnM9AohzRoq7xM8jrMN=Q5A@mail.gmail.com>
Subject: LLVM_IAS=1 and DWARF-4
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Masahiro,

when I build with LLVM_IAS=1 I want to force DWARF-4.

CONFIG_DEBUG_INFO_DWARF4=y sets "DEBUG_CFLAGS += -gdwarf-4".

I tried:

[ Makefile ]

ifdef CONFIG_DEBUG_INFO
ifdef CONFIG_DEBUG_INFO_SPLIT
DEBUG_CFLAGS    += -gsplit-dwarf
else
DEBUG_CFLAGS    += -g
endif
ifndef LLVM_IAS
KBUILD_AFLAGS    += -Wa,-gdwarf-2
endif
endif
ifdef CONFIG_DEBUG_INFO_DWARF4
DEBUG_CFLAGS    += -gdwarf-4
ifdef LLVM_IAS
KBUILD_AFLAGS    += -Wa,-gdwarf-4
endif
endif

If I set LLVM_IAS=1 ---> CONFIG_DEBUG_INFO_DWARF4=y shall be set automatically.

Dunno if "KBUILD_AFLAGS += -Wa,-gdwarf-4" is a good idea.

"KBUILD_AFLAGS += -Wa,-gdwarf-2" is known to break with LLVM_IAS=1.

I am lost in ifdef-eries...

Any cool ideas?

Regards,
- Sedat -
