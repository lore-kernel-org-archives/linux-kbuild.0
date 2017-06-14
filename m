Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:34816 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754344AbdFNH0r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jun 2017 03:26:47 -0400
MIME-Version: 1.0
In-Reply-To: <20170613230854.112282-3-mka@chromium.org>
References: <20170613230854.112282-1-mka@chromium.org> <20170613230854.112282-3-mka@chromium.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 14 Jun 2017 09:26:46 +0200
Message-ID: <CAK8P3a3wSbRiBp5xTz=L+NfkYOjDym0eq6c6VPq4w-qDEw0Kog@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] kbuild: Add hostcc-option macro
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, the arch/x86 maintainers <x86@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <Bernhard.Rosenkranzer@linaro.org>, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>

On Wed, Jun 14, 2017 at 1:08 AM, Matthias Kaehlcke <mka@chromium.org> wrote:
> hostcc-option is equivalent to cc-option, but uses the host compiler
> and HOSTCFLAGS. Change HOSTCFLAGS to a simple expanded variable to
> allow for HOSTCFLAGS += $(call hostcc-option, ...).
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>

Actually, we already have a hostcc-option macro. What I meant with my suggestion
was that we could redefine the existing one using cc-option-raw.

I checked again now and found that while this was added in 2016 by
Emese Revfy, we apparently don't have any users of the helper in the
kernel.

      Arnd
