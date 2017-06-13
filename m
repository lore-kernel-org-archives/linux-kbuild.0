Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:36626 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752285AbdFMGj2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 02:39:28 -0400
Date: Tue, 13 Jun 2017 08:39:24 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH 0/3] x86: stack alignment for boot code and clang
Message-ID: <20170613063924.j5kmyrkmpsaykfsg@gmail.com>
References: <20170613005531.77656-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170613005531.77656-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>


* Matthias Kaehlcke <mka@chromium.org> wrote:

> This series fixes an issue with the stack of the x86 boot code not
> being aligned as intended. Further it adapts the Makefile to account
> for the fact that clang uses a different option to configure the
> stack alignment than gcc (-mstack-alignment=N vs
> -mpreferred-stack-boundary=N)
> 
> Matthias Kaehlcke (3):
>   kbuild: Add cc-option-no-kbuild macro
>   x86/build: Use cc-option-no-kbuild for boot code compiler options
>   x86/build: Specify stack alignment for clang
> 
>  arch/x86/Makefile      | 25 +++++++++++++++++--------
>  scripts/Kbuild.include |  5 +++++
>  2 files changed, 22 insertions(+), 8 deletions(-)

Looks good to me, modulo the minor comments I just made to the #3 patch.

This needs acks from the kbuild people before I can apply the fixes.

Thanks,

	Ingo
