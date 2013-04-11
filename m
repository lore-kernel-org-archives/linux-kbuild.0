Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39592 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752633Ab3DKJoD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Apr 2013 05:44:03 -0400
Message-ID: <516685E0.2000809@suse.cz>
Date: Thu, 11 Apr 2013 11:44:00 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: do randomise choice entries in presence of KCONFIG_ALLCONFIG
References: <20130227214102.6d63544d@skate> <1365628806-24304-1-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1365628806-24304-1-git-send-email-yann.morin.1998@free.fr>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Sam Ravnborg <sam@ravnborg.org>, Arnaud Lacombe <lacombar@gmail.com>

On 10.4.2013 23:20, Yann E. MORIN wrote:
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
>     ---8<--- Config.test.in
> 
>     ---8<--- config.defaults
>     CONFIG_OPTIONA=y
>     ---8<--- config.defaults
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
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Michal Marek <mmarek@suse.cz>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Arnaud Lacombe <lacombar@gmail.com>

Hi Yann,

will you add this to your yem-kconfig-for-next branch, or should I apply
it to kbuild.git#kconfig directly?

Thanks,
Michal
