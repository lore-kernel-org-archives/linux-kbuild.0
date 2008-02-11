Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from barikada.upol.cz ([158.194.242.200]:45482 "EHLO
	barikada.upol.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752772AbYBKOOa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Feb 2008 09:14:30 -0500
Received: from flower (flower.upol.cz [158.194.64.22])
	by barikada.upol.cz (Spam Firewall) with ESMTP id 5191B1DC194
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2008 15:14:29 +0100 (CET)
Received: from flower (flower.upol.cz [158.194.64.22]) by barikada.upol.cz with ESMTP id MZaLfxcDeEirbm7b for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2008 15:14:29 +0100 (CET)
Received: from olecom by flower with local (Exim 4.63)
	(envelope-from <olecom@flower.upol.cz>)
	id 1JOZiC-0007mO-09
	for linux-kbuild@vger.kernel.org; Mon, 11 Feb 2008 15:32:48 +0100
Date: Mon, 11 Feb 2008 15:32:47 +0100
Subject: Re: shell command is empty, when "silent" (Re: make V=1 broken)
Message-ID: <20080211143247.GH24008@flower.upol.cz>
References: <20080210225939.GB15317@uranus.ravnborg.org> <20080211024640.GF24008@flower.upol.cz> <20080211133453.GC20959@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080211133453.GC20959@uranus.ravnborg.org>
From: Oleg Verych <olecom@flower.upol.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <linux-kbuild@vger.kernel.org>

On Mon, Feb 11, 2008 at 02:34:53PM +0100, Sam Ravnborg wrote:
> On Mon, Feb 11, 2008 at 03:46:40AM +0100, Oleg Verych wrote:
[]
> > ,--`make V=1`--
> > |  GEN     /dev/shm/blinux/Makefile
> > |set -e; ; mkdir -p include/linux/; 
> > []
> > |/bin/sh: Syntax error: ";" unexpected
> > `--
> > 
> > That "silent" juggling with `echo` is overhead, thus remove it.
> 
> Hi Oleg.
> People has requested to make the build even more silent with
> make -s. So when Mike provided a patch is was applied (but unfortunately faulty).
> 
> So I fixed it by appended patch.
> The right fix would have been to resue echo-cmd but that
> required a bit more rework.
[]

Memory is cheap, efficiency is uselsess.

Funny, that *debug* output didn't give a clue for quite some people.

Aah, why do i care?

>  #   to specify a valid file as first prerequisite (often the kbuild file)
> +       chk_filechk = :
>   quiet_chk_filechk = echo '  CHK     $@'
>  silent_chk_filechk = :
> +       upd_filechk = :
>   quiet_upd_filechk = echo '  UPD     $@'
>  silent_upd_filechk = :
> +
>  define filechk
>  	$(Q)set -e;				\
>  	$($(quiet)chk_filechk);			\
> -- 
> 1.5.4.rc3.14.g44397
> 
