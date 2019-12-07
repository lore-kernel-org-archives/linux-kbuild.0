Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f67.google.com ([209.85.166.67]:40990 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726416AbfLGWT3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Dec 2019 17:19:29 -0500
Received: by mail-io1-f67.google.com with SMTP id z26so10951332iot.8
        for <linux-kbuild@vger.kernel.org>; Sat, 07 Dec 2019 14:19:29 -0800 (PST)
MIME-Version: 1.0
References: <20191123160444.11251-1-yamada.masahiro@socionext.com> <20191123160444.11251-4-yamada.masahiro@socionext.com>
In-Reply-To: <20191123160444.11251-4-yamada.masahiro@socionext.com>
From: Olof Johansson <olof@lixom.net>
Date: Sat, 7 Dec 2019 14:19:17 -0800
Message-ID: <CAOesGMiY65jqo985p_AjLJiXUCFq8AmHMA3xx0LvNwNfjUW-OQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] scripts/kallsyms: shrink table before sorting it
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi,

On Sat, Nov 23, 2019 at 8:05 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Currently, build_initial_tok_table() trims unused symbols, which is
> called after sort_symbol().
>
> It is not efficient to sort the huge table that contains unused entries.
> Shrink the table before sorting it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

This started showing warnings on some 32-bit ARM platforms, due to
kallsyms_relative_base changing:

 kallsyms_relative_base:
-       PTR     _text - 0
+       PTR     _text - 0xfffffffffffffe20

The assembler started complaining:

.tmp_kallsyms1.S: Assembler messages:
.tmp_kallsyms1.S:15315: Warning: right operand is a bignum; integer 0 assumed

Also, I clearly see different output with this patch reverted and
applied; I would expect no actual difference if it was correct.

Can we please revert this for 5.5 while this is being sorted out?

To reproduce, build for example am200epdkit_defconfig for ARCH=arm. I
see it with GCC 8.2.0, binutils 2.30.0.


Thanks,

-Olof
