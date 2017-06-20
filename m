Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f179.google.com ([209.85.128.179]:33771 "EHLO
        mail-wr0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752745AbdFTJU6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jun 2017 05:20:58 -0400
Date: Tue, 20 Jun 2017 11:20:54 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v4 3/3] x86/build: Specify stack alignment for clang
Message-ID: <20170620092054.7d2mgzx6cw3jvgji@gmail.com>
References: <20170619183757.124992-1-mka@chromium.org>
 <20170619183757.124992-4-mka@chromium.org>
 <EAA687B2-ECD0-42C7-907E-BE8BDF311EC1@zytor.com>
 <20170619204704.GP141096@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170619204704.GP141096@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: hpa@zytor.com, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>


* Matthias Kaehlcke <mka@chromium.org> wrote:

> Ingo didn't like the duplication and suggested the use of a variable, which 
> kinda implies a check for the compiler name.

I don't think it implies that: why cannot cc_stack_align_opt probe for the 
compiler option and use whichever is available, without hard-coding the compiler 
name?

> I also think this is a cleaner solution. [...]

I concur with hpa: hard-coding compiler is awfully fragile and ugly as well.

With the proper probing of compiler options it will be possible for compilers to 
consolidate their options, and it would be possible for a third compiler to use a 
mixture of GCC and Clang options. With hard-coding none of that flexibility is 
available.

> but I'm happy to respin the patch if you have another suggestion that is ok for 
> both of you.

Please do.

Thanks,

	Ingo
