Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:44739 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752565AbdJ0UK0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Oct 2017 16:10:26 -0400
Received: by mail-wr0-f195.google.com with SMTP id z55so7214236wrz.1
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Oct 2017 13:10:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=COgOc4MM7Ex1j8d_fXDuW0uUTueUEr-bL7NESB4hrWw@mail.gmail.com>
References: <20171026201744.89744-1-ndesaulniers@google.com>
 <CAK7LNASyP3x8wnvv_Eo_CbHehY5+pPjcpJFAn3fw8NAAi00GQA@mail.gmail.com> <CAKwvOd=COgOc4MM7Ex1j8d_fXDuW0uUTueUEr-bL7NESB4hrWw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 27 Oct 2017 13:10:24 -0700
Message-ID: <CAKwvOdnjvVQDyQChkg0Td1w7XoMDJiHf07oKMf815dFoMYFEPQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix linker feature test macros when cross
 compiling with Clang
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Pirama Arumuga Nainar <pirama@google.com>, Ingo Molnar <mingo@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Badhri Jagan Sridharan <badhri@google.com>, Todd Kjos <tkjos@google.com>, arve@android.com

On Fri, Oct 27, 2017 at 11:28 AM, Nick Desaulniers
<ndesaulniers@google.com> wrote:
> On Fri, Oct 27, 2017 at 4:20 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>>   - please base your patch on linux-kbuild/kbuild branch
>
> Will do. Do I need to note it's based off that branch? Otherwise wont
> 0-day bot complain that my patch doesn't apply/build on torvalds/linux
> ?

Talked to some teammates about this, sounds like it's not a problem,
so I'll just send v2 with a note to the reviewer.
