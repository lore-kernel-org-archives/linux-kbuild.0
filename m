Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:42409 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750710AbeDAEid (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 1 Apr 2018 00:38:33 -0400
MIME-Version: 1.0
In-Reply-To: <1522128575-5326-9-git-send-email-yamada.masahiro@socionext.com>
References: <1522128575-5326-1-git-send-email-yamada.masahiro@socionext.com> <1522128575-5326-9-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Sun, 1 Apr 2018 06:38:32 +0200
Message-ID: <CAFkk2KSs-Xw7rYaYW8F78B+NNP+7uDr=Aom5k3EKGKZU_nhc1g@mail.gmail.com>
Subject: Re: [PATCH v2 08/21] kconfig: replace $UNAME_RELEASE with function call
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, "Luis R . Rodriguez" <mcgrof@kernel.org>, Nicolas Pitre <nico@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Mar 27, 2018 at 7:29 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Now that 'shell' function is supported, this can be self-contained in
> Kconfig.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
