Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:35214 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752831AbdFVI7s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 04:59:48 -0400
Date: Thu, 22 Jun 2017 10:59:38 +0200
From: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH] kbuild: deprecate cc-option-align
Message-ID: <20170622085938.upkoiqqmurzq6nav@gmail.com>
References: <1497857303-15936-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1497857303-15936-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Kees Cook <keescook@chromium.org>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@redhat.com>, Emese Revfy <re.emese@gmail.com>


* Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Documentation/kbuild/makefiles.txt says the change for align options
> occurred at GCC 3.0, and Documentation/process/changes.rst says the
> minimal supported GCC version is 3.2, so it should be safe to hard-code
> -falign* options.
> 
> Fix the only user arch/x86/Makefile_32.cpu and deprecate the
> cc-option-align.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> x86 maintainers,
> 
> If this patch looks OK, could you give me Acked-by?

LGTM in principle, although I haven't tested it:

   Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo
