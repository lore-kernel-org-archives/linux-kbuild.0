Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:34064 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752776AbdFVI66 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 04:58:58 -0400
Date: Thu, 22 Jun 2017 10:58:48 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v5 0/3] x86: stack alignment for boot code and clang
Message-ID: <20170622085848.kot52wfxsntruoaz@gmail.com>
References: <20170621232805.149448-1-mka@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170621232805.149448-1-mka@chromium.org>
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
> Collaterally the series adds the new kbuild macro __cc-option and
> refactors the macros cc-option and hostcc-option to make use of
> __cc-option.
> 
> Matthias Kaehlcke (3):
>   kbuild: Add __cc-option macro
>   x86/build: Use __cc-option for boot code compiler options
>   x86/build: Specify stack alignment for clang
> 
>  Makefile               |  2 +-
>  arch/x86/Makefile      | 33 +++++++++++++++++++++++++--------
>  scripts/Kbuild.include | 14 ++++++++++++--
>  scripts/Makefile.host  |  6 ------
>  4 files changed, 38 insertions(+), 17 deletions(-)

So given that there are non-trivial kbuild changes here, I'd suggest these patches 
might have a better home in the kbuild tree. For the x86 bits:

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
