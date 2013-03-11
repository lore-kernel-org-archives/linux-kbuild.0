Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([94.23.35.102]:45914 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753313Ab3CKVko (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Mar 2013 17:40:44 -0400
Date: Mon, 11 Mar 2013 22:40:39 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH] kconfig: do randomise choice entries in presence of
 KCONFIG_ALLCONFIG
Message-ID: <20130311224039.51af7d53@skate>
In-Reply-To: <1362931313-31829-1-git-send-email-yann.morin.1998@free.fr>
References: <20130227214102.6d63544d@skate>
	<1362931313-31829-1-git-send-email-yann.morin.1998@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Sam Ravnborg <sam@ravnborg.org>, Arnaud Lacombe <lacombar@gmail.com>

Dear Yann E. MORIN,

On Sun, 10 Mar 2013 17:01:53 +0100, Yann E. MORIN wrote:
> Currently, randconfig does randomise choice entries, unless KCONFIG_ALLCONFIG
> is specified.
> 
> For example, given those two files (Thomas' test-case):
> 
>     ---8<--- Config.test.in
>     config OPTIONA
>         bool "Option A"
> 
>     choice
>         prompt "This is a choice"
> 
>     config CHOICE_OPTIONA
>         bool "Choice Option A"
> 
>     config CHOICE_OPTIONB
>         bool "Choice Option B"
> 
>     endchoice
> 
>     config OPTIONB
>         bool "Option B"
>     ---8<---
> 
>     ---8<--- config.defaults
>     CONFIG_OPTIONA=y
>     ---8<---
> 
> And running:
>     ./scripts/kconfig/conf --randconfig Config.test.in
> 
> does properly randomise the two choice symbols (and the two booleans).
> 
> However, running:
>     KCONFIG_ALLCONFIG=config.defaults \
>     ./scripts/kconfig/conf --randconfig Config.test.in
> 
> does *not* reandomise the two choice entries, and only CHOICE_OPTIONA
> will ever be selected. (OPTIONA will always be set (expected), and
> OPTIONB will be be properly randomised (expected).)
> 
> This patch defers setting that a choice has a value until a symbol for
> that choice is indeed set, so that choices are properly randomised when
> KCONFIG_ALLCONFIG is set, but not if a symbol for that choice is set.
> 
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Michal Marek <mmarek@suse.cz>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Arnaud Lacombe <lacombar@gmail.com>

I confirm that the patch fixes the issue for me, but I am not able to
judge the absence of side-effects. Thanks Yann for the investigation!

Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
