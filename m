Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yb0-f193.google.com ([209.85.213.193]:34826 "EHLO
        mail-yb0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751634AbeFZWCt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jun 2018 18:02:49 -0400
Received: by mail-yb0-f193.google.com with SMTP id x15-v6so3937213ybm.2
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Jun 2018 15:02:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <46d20fac2dc15d842ebf23c62372ecdb892d7efd.camel@perches.com>
References: <20180626174013.GA41617@beast> <46d20fac2dc15d842ebf23c62372ecdb892d7efd.camel@perches.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 26 Jun 2018 15:02:47 -0700
Message-ID: <CAGXu5j+8uqu7vQeupbPF26UTnAvTrwYObqrVAueM9ztFKaH-qw@mail.gmail.com>
Subject: Re: [RFC][PATCH] Makefile: globally enable VLA warning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, David Airlie <airlied@linux.ie>, linux-kbuild <linux-kbuild@vger.kernel.org>, intel-gfx@lists.freedesktop.org, Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Linus Torvalds <torvalds@linux-foundation.org>

On Tue, Jun 26, 2018 at 1:21 PM, Joe Perches <joe@perches.com> wrote:
> On Tue, 2018-06-26 at 10:40 -0700, Kees Cook wrote:
>> This is the patch I've got prepared now that fixes for all VLAs have been
>> sent to maintainers (some are still under review/adjustment, but there
>> aren't any unexplored cases left). My intention would be to have this land
>> at the end of the next merge window after all the pending VLA patches
>> have landed. I just wanted to get any feedback here, since it touches
>> a couple areas in the process and I didn't want anyone to be surprised. :)
> []
>> diff --git a/Makefile b/Makefile
> []
>> @@ -778,6 +778,9 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
>>  # warn about C99 declaration after statement
>>  KBUILD_CFLAGS += $(call cc-option,-Wdeclaration-after-statement,)
>>
>> +# VLAs should not be used anywhere in the kernel
>> +KBUILD_CFLAGS += $(call cc-option,-Wvla)
>
> I'd probably spell out what a VLA is here.
> # VLAs (Variable Length Arrays) should not be used anywhere in the kernel
>
> Beyond that, seems sensible, thanks.

Ah yes, good idea. I've made that change locally now. Thanks!

-Kees

-- 
Kees Cook
Pixel Security
