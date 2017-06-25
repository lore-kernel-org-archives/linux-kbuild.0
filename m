Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:62400 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750709AbdFYEA5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Jun 2017 00:00:57 -0400
MIME-Version: 1.0
In-Reply-To: <1497857303-15936-1-git-send-email-yamada.masahiro@socionext.com>
References: <1497857303-15936-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 25 Jun 2017 13:00:43 +0900
Message-ID: <CAK7LNAR4N8HUaanoxkYW=PpBwO1+3K_AQNyzkApgZFfXD1AtsQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: deprecate cc-option-align
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Kaehlcke <mka@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Kees Cook <keescook@chromium.org>, Michal Marek <mmarek@suse.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@redhat.com>, Emese Revfy <re.emese@gmail.com>

2017-06-19 16:28 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Documentation/kbuild/makefiles.txt says the change for align options
> occurred at GCC 3.0, and Documentation/process/changes.rst says the
> minimal supported GCC version is 3.2, so it should be safe to hard-code
> -falign* options.
>
> Fix the only user arch/x86/Makefile_32.cpu and deprecate the
> cc-option-align.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to linux-kbuild/kbuild.

-- 
Best Regards
Masahiro Yamada
