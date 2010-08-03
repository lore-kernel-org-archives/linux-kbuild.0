Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46347 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756156Ab0HCMcK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Aug 2010 08:32:10 -0400
Message-ID: <4C580BF9.6090706@suse.cz>
Date: Tue, 03 Aug 2010 14:30:49 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/9] kconfig: introduce saveconfig and alldefconfig
 (+more)
References: <20100731212907.GA7554@merkur.ravnborg.org>
In-Reply-To: <20100731212907.GA7554@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Uwe Kleine-K?nig <u.kleine-koenig@pengutronix.de>, Randy Dunlap <rdunlap@xenotime.net>, Roman Zippel <zippel@linux-m68k.org>, Aristeu Rozanski <aris@redhat.com>

On 31.7.2010 23:29, Sam Ravnborg wrote:
> This is an update of patches previous posted.
> 
> Version 2 have addressed the following feedback:
> - Drop the idea of introducing allrandconfig (Michal, Randy)
> - Do more code refactoring (Michal)
> - Use long options in conf.c (Michal)
> - savedefconfig shall list symbols in same order as in .config (Uwe)
>  
> The major feature is the introduction of "make savedefconfig".
> 
> Make savedefconfig creates a minimal configuration
> as have been discussed recently and which is already
> done for arm and powerpc.
> savedefconfig utilise the knowledge kconfig has to do so
> much faster than the phyton script posted.
> [...]

Applied, thanks.

Michal
