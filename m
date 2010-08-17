Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:44689 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057Ab0HQGPD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 02:15:03 -0400
Received: by wwi17 with SMTP id 17so625589wwi.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2010 23:15:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100816123642.GA7233@merkur.ravnborg.org>
References: <1281934457-4225-1-git-send-email-lacombar@gmail.com>
	<20100816123642.GA7233@merkur.ravnborg.org>
Date: Tue, 17 Aug 2010 02:15:01 -0400
Message-ID: <AANLkTikT_rcowbqz59gq2StqmArmO0bRWAYDJGVPxjQM@mail.gmail.com>
Subject: Re: [RFC 0/2] Factor Kconfig's prefix and package name
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

Hi,

On Mon, Aug 16, 2010 at 8:36 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
> 1) "Kernel" appear in diverse feedback texts
>  - Re-phrase this to refer to the configuration.
>    You know that you change the configuration
>    of kernel/buildroot/ptxdist/whatever and
>    there is no value of repeating this info in
>    the feedback texts.
>  - Re-phrasing have the benefit that once the
>    translators pick up the new version the
>    translated text is valied for all users.
>    This would not be the case if you replace
>    the project name.
>
will do tomorrow.

> 2) References to kernel + version in title in frontends
>  - Use the (today unused) mainmenu entry to pick up the
>    title.
>    Consider following example:
>
> mainmenu "Linux kernel configuration v$KERNELVERSION"
>
> config KERNELVERSION
>        string
>        option env=KERNELVERSION
>
>   With the above exampe we no longer hardcode
>   the title and we use already existing features
>   to get the version from the environment.
>   The expansion of "$KERNELVERSION" to the value
>   of the symbol is something I only see supported
>   by "mainmenu".
>  - This should also address the cases where we
>   referer to the project name/version in the
>   .config file (see confdata.c).
>
>
a first half has been posted here, the another one is written and has
been sent privately (for now, it still needs improvement).

> 3) Do not hardcode "CONFIG_"
>  - I suggest to introduce a single define named "CONFIG_".
>    All the places that hardcode the length should be
>    replaced by strlen(CONFIG_).
>  - The define should be conditional like this:
> #if !defined(CONFIG_)
> #define CONFIG_ "CONFIG_"
> #endif
>    In this way other users can just use -DCONFIG_=BR2_ as they prefer.
>
will do tomorrow.

Beside that, the hardcoded string will need to be removed from
{g,m,n,q}conf.c, that should be trivial.

 - Arnaud
