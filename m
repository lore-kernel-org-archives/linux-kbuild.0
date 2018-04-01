Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f44.google.com ([209.85.213.44]:46069 "EHLO
        mail-vk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752754AbeDACk0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 31 Mar 2018 22:40:26 -0400
MIME-Version: 1.0
In-Reply-To: <CAFkk2KTpTXPzNpe6L33_a4YJ=DD0pwz+iEjvm-c1gVeCJGn_6w@mail.gmail.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com>
 <1522128575-5326-5-git-send-email-yamada.masahiro@socionext.com> <CAFkk2KTpTXPzNpe6L33_a4YJ=DD0pwz+iEjvm-c1gVeCJGn_6w@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sun, 1 Apr 2018 04:40:25 +0200
Message-ID: <CAFkk2KSn9goBN5nngwXbePDEohgqzL19V_1m62sgCfej=W5iyw@mail.gmail.com>
Subject: Re: [PATCH v2 04/21] kconfig: reference environments directly and
 remove 'option env=' syntax
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>

On Sun, Apr 1, 2018 at 4:27 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
>
> AFAICS, we only need the following functionality:
>
>     1. Record referenced environment variables along with their value
>
>     2. Go through all the recorded environment variables and write
> dependency information
>
> For (1), I think it would be better to simply have env_list_add() (or
> some other suitable name) add the variable to the list if it isn't
> already there (like a kind of set). It is always safe to get the value
> of the environment variable from getenv(), and that seems less
> confusing.
>

env_list_lookup() could be removed then as well.

Cheers,
Ulf
