Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f44.google.com ([209.85.213.44]:35975 "EHLO
        mail-vk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752278AbeDJHAF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Apr 2018 03:00:05 -0400
Received: by mail-vk0-f44.google.com with SMTP id q198so6371688vke.3
        for <linux-kbuild@vger.kernel.org>; Tue, 10 Apr 2018 00:00:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNATJidxieoNoo=CTk_-BpKJv8dwq+q1MAmsRDivd6ZrotQ@mail.gmail.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
 <1522128575-5326-21-git-send-email-yamada.masahiro@socionext.com>
 <CAGXu5jJQfYXqsF7pcRsUtY9Mrw+Yi_Y6+CBAwDrQT_4kpUiHDA@mail.gmail.com> <CAK7LNATJidxieoNoo=CTk_-BpKJv8dwq+q1MAmsRDivd6ZrotQ@mail.gmail.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 10 Apr 2018 00:00:03 -0700
Message-ID: <CAGXu5jLTzqe3MVZnY+SOrreUBUZZOsEDsZNuS66ZxXjRzywv3A@mail.gmail.com>
Subject: Re: [PATCH v2 20/21] gcc-plugins: enable GCC_PLUGINS for COMPILE_TEST
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Ulf Magnusson <ulfalizer@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, LKML <linux-kernel@vger.kernel.org>

On Mon, Apr 9, 2018 at 11:15 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Can you explain a bit more about GCC_PLUGIN_RANDSTRUCT_PERFORMANCE?
>
> IIUC, this option reduces the randomization.

Correct: I don't want to do COMPILE_TEST buids with
GCC_PLUGIN_RANDSTRUCT_PERFORMANCE since it is effectively a subset of
the GCC_PLUGIN_RANDSTRUCT possibilities. So, ..._PERFORMANCE shouldn't
be enabled for COMPILE_TEST, as that would reduce the coverage for
buid tests.

-Kees

-- 
Kees Cook
Pixel Security
