Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f169.google.com ([209.85.217.169]:40328 "EHLO
        mail-ua0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753182AbeDMQlt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Apr 2018 12:41:49 -0400
Received: by mail-ua0-f169.google.com with SMTP id n20so6167738ual.7
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Apr 2018 09:41:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1523595999-27433-22-git-send-email-yamada.masahiro@socionext.com>
References: <1523595999-27433-1-git-send-email-yamada.masahiro@socionext.com> <1523595999-27433-22-git-send-email-yamada.masahiro@socionext.com>
From: Kees Cook <keescook@chromium.org>
Date: Fri, 13 Apr 2018 09:41:48 -0700
Message-ID: <CAGXu5jLt4xoxXTw83-npD4WmumPzSC9WnbOkkDoR=VYa5R4rYw@mail.gmail.com>
Subject: Re: [PATCH 21/30] stack-protector: test compiler capability in
 Kconfig and drop AUTO mode
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Emese Revfy <re.emese@gmail.com>, X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, Apr 12, 2018 at 10:06 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> +stackp-flags-$(CONFIG_CC_HAS_STACKPROTECTOR_NONE) := -fno-stack-protector
> +stackp-flags-$(CONFIG_CC_STACKPROTECTOR)          := -fstack-protector
> +stackp-flags-$(CONFIG_CC_STACKPROTECTOR_STRONG)   := -fstack-protector-strong
> +
> +KBUILD_CFLAGS += $(stackp-flags-y)

So, technically, this works just fine. I wonder if it has an overly
confusing result, in that the compiler under normal situations will
see:

gcc ... -fno-stack-protector -fstack-protector -fstack-protector-strong ...

How about something like this instead:

ifdef CONFIG_CC_STACKPROTECTOR_STRONG
KBUILD_CFLAGS += -fstack-protector-strong
else
ifdef CONFIG_CC_STACKPROTECTOR
KBUILD_CFLAGS += -fstack-protector
else
KBUILD_CFLAGS += -fno-stack-protector
endif
endif

-Kees

-- 
Kees Cook
Pixel Security
