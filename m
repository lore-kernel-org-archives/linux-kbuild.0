Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f178.google.com ([209.85.217.178]:39261 "EHLO
        mail-ua0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750980AbeDMUlh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Apr 2018 16:41:37 -0400
Received: by mail-ua0-f178.google.com with SMTP id g10so6597879ual.6
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Apr 2018 13:41:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+55aFyM1uxzvU4SH3c1VYRXBRfGuqKZ4OR-O_pMoxPs7XTFug@mail.gmail.com>
References: <1523595999-27433-1-git-send-email-yamada.masahiro@socionext.com>
 <1523595999-27433-22-git-send-email-yamada.masahiro@socionext.com>
 <CAGXu5jLt4xoxXTw83-npD4WmumPzSC9WnbOkkDoR=VYa5R4rYw@mail.gmail.com> <CA+55aFyM1uxzvU4SH3c1VYRXBRfGuqKZ4OR-O_pMoxPs7XTFug@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Fri, 13 Apr 2018 13:41:35 -0700
Message-ID: <CAGXu5jJQ9nkkpcUBvgvBxFhcVv7cBsCgT4HT3KC7+YHfpa6K6A@mail.gmail.com>
Subject: Re: [PATCH 21/30] stack-protector: test compiler capability in
 Kconfig and drop AUTO mode
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Emese Revfy <re.emese@gmail.com>, X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Fri, Apr 13, 2018 at 11:11 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>     config STACKPROTECTOR_FLAGS
>         string
>         default "-fstack-protector-strong" if CC_STACKPROTECTOR_STRONG
>         default "-fstack-protector" if CC_STACKPROTECTOR
>         default "-fno-stack-protector" if CC_HAS_STACKPROTECTOR_NONE
>         default ""
>
> which is really simple and straightforward. In the presense of
> multiple defaults, the first is picked, so this _automatically_ does
> that whole priority ordering.

Ah, perfect! Yes, this is a much better solution.

-Kees

-- 
Kees Cook
Pixel Security
