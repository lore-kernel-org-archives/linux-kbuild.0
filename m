Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:43343 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755428AbdLOR2M (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Dec 2017 12:28:12 -0500
Date: Fri, 15 Dec 2017 18:28:10 +0100
From: "Luis R. Rodriguez" <mcgrof@kernel.org>
Subject: Re: [PATCH] kconfig: display recursive dependency resolution hint
 just once
Message-ID: <20171215172810.GB729@wotan.suse.de>
References: <1513351722-14196-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1513351722-14196-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Ulf Magnusson <ulfalizer@gmail.com>, Heinrich Schuchardt <xypron.glpk@gmx.de>, linux-kernel@vger.kernel.org

On Sat, Dec 16, 2017 at 12:28:42AM +0900, Masahiro Yamada wrote:
> Commit 1c199f2878f6 ("kbuild: document recursive dependency limitation
> / resolution") probably intended to show a hint along with "recursive
> dependency detected!" error, but it missed to add {...} guard, and the
> hint is displayed in every loop of the dep_stack traverse, annoyingly.
> 
> This error was detected by GCC's -Wmisleading-indentation when switching
> to build-time generation of lexer/parser.
> 
> scripts/kconfig/symbol.c: In function ‘sym_check_print_recursive’:
> scripts/kconfig/symbol.c:1150:3: warning: this ‘if’ clause does not guard... [-Wmisleading-indentation]
>    if (stack->sym == last_sym)
>    ^~
> scripts/kconfig/symbol.c:1153:4: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the ‘if’
>     fprintf(stderr, "For a resolution refer to Documentation/kbuild/kconfig-language.txt\n");
>     ^~~~~~~
> 
> I could simply add {...} to surround the three fprintf(), but I rather
> chose to move the hint after the loop to make the whole message readable.
> 
> Fixes: 1c199f2878f6 ("kbuild: document recursive dependency limitation / resolution"
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Luis R. Rodriguez <mcgrof@kernel.org>

  Luis
