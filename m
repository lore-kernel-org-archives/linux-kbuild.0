Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:43649 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751587AbdJDH1U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 03:27:20 -0400
MIME-Version: 1.0
In-Reply-To: <1507074806-21577-1-git-send-email-ulfalizer@gmail.com>
References: <1507074806-21577-1-git-send-email-ulfalizer@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 4 Oct 2017 09:27:19 +0200
Message-ID: <CAK8P3a2tUFu1HoJ5nGF+tLxb7O1X3KrGe+rZDQYK8ZYmD3KN-A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix optimization level choice default
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>, Daniel Mack <daniel@zonque.org>

On Wed, Oct 4, 2017 at 1:53 AM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> The choice containing the CC_OPTIMIZE_FOR_PERFORMANCE symbol
> accidentally added a "CONFIG_" prefix when trying to make it the
> default, selecting an undefined symbol as the default.
>
> The mistake is harmless here: Since the default symbol is not visible,
> the choice falls back on using the visible symbol as the default
> instead, which is CC_OPTIMIZE_FOR_PERFORMANCE, as intended.
>
> A patch that makes Kconfig print a warning in this case has been
> submitted separately:
> http://www.spinics.net/lists/linux-kbuild/msg15566.html
>
> Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
