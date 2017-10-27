Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:44837 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752692AbdJ0S2q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Oct 2017 14:28:46 -0400
Received: by mail-wm0-f67.google.com with SMTP id n74so2472681wmi.1
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Oct 2017 11:28:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNASyP3x8wnvv_Eo_CbHehY5+pPjcpJFAn3fw8NAAi00GQA@mail.gmail.com>
References: <20171026201744.89744-1-ndesaulniers@google.com> <CAK7LNASyP3x8wnvv_Eo_CbHehY5+pPjcpJFAn3fw8NAAi00GQA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 27 Oct 2017 11:28:43 -0700
Message-ID: <CAKwvOd=COgOc4MM7Ex1j8d_fXDuW0uUTueUEr-bL7NESB4hrWw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix linker feature test macros when cross
 compiling with Clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Ingo Molnar <mingo@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

+ linux-kbuild@vger.kernel.org

On Fri, Oct 27, 2017 at 4:20 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> I do not like to add $(CLANG_TARGET) to a place for common helpers.
> Instead of $(CLANG_TARGET), please add
> $(KBUILD_CPPFLAGS) $(CC_OPTION_CFLAGS)
> to cc-ldoption and ld-option.

Thanks for the review.  I agree that sounds like a better option.

> I have two requests next time:
>   - please include  linux-kbuild@vger.kernel.org in your To list

Sure thing. scripts/get_maintainer.pl does not recommend that list for
this file; is there a way to explicitly add that list to the
recommendation for that source file?

>   - please base your patch on linux-kbuild/kbuild branch

Will do. Do I need to note it's based off that branch? Otherwise wont
0-day bot complain that my patch doesn't apply/build on torvalds/linux
?
