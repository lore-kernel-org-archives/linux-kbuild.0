Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:52481 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752331Ab0HWQvr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Aug 2010 12:51:47 -0400
Date: Mon, 23 Aug 2010 18:51:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: fix segmentation fault in recursive dependency
	check
Message-ID: <20100823165145.GA29344@merkur.ravnborg.org>
References: <1282579375-12985-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1282579375-12985-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Mon, Aug 23, 2010 at 12:02:55PM -0400, Arnaud Lacombe wrote:
>  #0  sym_check_deps (sym=0xbb904c90) at scripts/kconfig/symbol.c:950
> 950                             fprintf(stderr, "%s:%d:error: recursive dependency detected!\n",
> (gdb) bt
>  #0  sym_check_deps (sym=0xbb904c90) at scripts/kconfig/symbol.c:950
>  #1  0x0804b4c2 in sym_check_expr_deps (e=0xbb5ec8e0) at scripts/kconfig/symbol.c:1007
>  #2  0x0804b549 in sym_check_sym_deps (sym=0xbb904c90) at scripts/kconfig/symbol.c:1032
>  #3  0x0804b950 in sym_check_deps (sym=0xbb904c90) at scripts/kconfig/symbol.c:1111
>  #4  0x0804b4c2 in sym_check_expr_deps (e=0xbb5e99a0) at scripts/kconfig/symbol.c:1007
>  #5  0x0804b50f in sym_check_sym_deps (sym=0xbb904d30) at scripts/kconfig/symbol.c:1024
>  #6  0x0804b950 in sym_check_deps (sym=0xbb904d30) at scripts/kconfig/symbol.c:1111
>  #7  0x0804b4c2 in sym_check_expr_deps (e=0xbb5f1840) at scripts/kconfig/symbol.c:1007
>  #8  0x0804b4a8 in sym_check_expr_deps (e=0xbb5f1830) at scripts/kconfig/symbol.c:994
>  #9  0x0804b549 in sym_check_sym_deps (sym=0xbb970240) at scripts/kconfig/symbol.c:1032
>  #10 0x0804b950 in sym_check_deps (sym=0xbb970240) at scripts/kconfig/symbol.c:1111
>  #11 0x08052e37 in conf_parse (name=0x804a09a "\203?\020?\004z\005\b\205?\017\205?") at scripts/kconfig/zconf.tab.c:2244
>  #12 0x0804a09a in main (ac=3, av=0xbfbfe004) at scripts/kconfig/conf.c:505
> 
> In this case, `stack->prop' is NULL, but it may also end-up being NULL at the
> end of the loop just before. Places the check before using `prop' to catch both
> cases.
> 
> This fix `scripts/kconfig/conf' segmentation fault on SH as of v2.6.36-rc2 and
> allow to fix the underlying issue.

Looks like the bug I fixed in another way:
See: http://git.kernel.org/?p=linux/kernel/git/mmarek/kbuild-2.6.git;a=commit;h=3643f849d7da5c12da589beb03c12303fe79b841

Or did you hit another bug so your patch is needed too?

	Sam
