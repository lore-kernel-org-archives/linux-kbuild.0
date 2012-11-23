Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:54669 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752291Ab2KWScN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 23 Nov 2012 13:32:13 -0500
Date: Fri, 23 Nov 2012 19:32:11 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 3/3] scripts/kconfig: allow setting the root-menu label
	from environment
Message-ID: <20121123183211.GB10586@merkur.ravnborg.org>
References: <1353542766-24422-1-git-send-email-yann.morin.1998@free.fr> <1353542766-24422-4-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1353542766-24422-4-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>

Hi Yann.

On Thu, Nov 22, 2012 at 01:06:06AM +0100, Yann E. MORIN wrote:
> Currently, the root-menu label is hard-coded in the kconfig frontends
> executables. This means that two projects that use kconfig and want
> to display different root-menu labels can not share the same kconfig
> frontends.
> 
> Instead of hard-coding the label in the frontends, handle it the same
> we handle the CONFIG_ prefix:
>   - get the root-menu label from the environment if present
>   - allow to set it at build time (eg. -DROOTMENU='"Root menu label"')
>   - fallback to a hard-coded default

I have note paid attention to these CONFIG_ patches - and only now
I took a short look at this set and I am not soo hapy
that we start to introduce a lot a environment variables for all this stuff.

(A lot in this context is two).

Could we instead introduce two reserved symbols like this:

config KCONFIG_ROOT_MENU
	string
	default "My own super duper root menu"

config KCONFIG_SYMBOL_PREFIX
	string
	default "SAM_"

the the configuration is included in the kconfig files,
and not something you need to set in the environment.

We already so something remotely like this for SYMBOLS
where one can define:

config MY_SYMBOLS
	option modules

Then MY_SYMBOLS in used as replacement for SYMBOLS

I did not implement this - but it looks sufficiently simple
to warrant getting rid on the dependency on the enviromnet variables.

	Sam
