Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43985 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757105Ab0HNWiZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 14 Aug 2010 18:38:25 -0400
Message-ID: <4C671ADF.6090006@suse.cz>
Date: Sun, 15 Aug 2010 00:38:23 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: fix segfault when detecting recursive dependency
References: <20100814124329.GA28377@merkur.ravnborg.org> <20100814124458.GA28387@merkur.ravnborg.org>
In-Reply-To: <20100814124458.GA28387@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

Dne 14.8.2010 14:44, Sam Ravnborg napsal(a):
> From 705dbd8a31520722bda78e1bc731e2880f8df0ff Mon Sep 17 00:00:00 2001
> From: Sam Ravnborg <sam@ravnborg.org>
> Date: Sat, 14 Aug 2010 14:40:00 +0200
> Subject: [PATCH] kconfig: fix segfault when detecting recursive dependency
> 
> Following sample Kconfig generated a segfault:
> 
> config FOO
>         bool
>         select PERF_EVENTS if HAVE_HW_BREAKPOINT
> 
> config PERF_EVENTS
>         bool
> 
> config HAVE_HW_BREAKPOINT
>         bool
>         depends on PERF_EVENTS
> 
> Fix by reverting back to a valid property if there was no
> property on the stack of symbols.

Applied, thanks.

Michal
