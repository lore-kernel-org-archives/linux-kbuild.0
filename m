Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:44275 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753573Ab0HPVmS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 17:42:18 -0400
Received: by wwi17 with SMTP id 17so67933wwi.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2010 14:42:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100816123642.GA7233@merkur.ravnborg.org>
References: <1281934457-4225-1-git-send-email-lacombar@gmail.com>
	<20100816123642.GA7233@merkur.ravnborg.org>
Date: Mon, 16 Aug 2010 17:42:15 -0400
Message-ID: <AANLkTi=gODj4S0vWfa512sMM__MLhoZo9aU1y1pbN0gf@mail.gmail.com>
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
> Hi Arnaud.
>
> I am very much in favour of getting kconfig less tied into the kernel.
> We discussed this topic briefly af the buildrrot list the other day,
> and I am started to look at it too.
>
> What you have done below looks like similar attempts
> I have seen in the past - and I did not like them then
> and do not like it now.
> I have outlined below there three steps needed as I see it.
> And I would be very glad for help on two of these.
>
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
sounds good. This would also eliminate the line length problem for
hardcoded paragraph.

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
seems a good way to go.

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
agreed. the only thing I am not really fond of is that "strlen(...)"
is computed at runtime, whereas "sizeof(...)-1" is a build time
constant, but this might not be that worth.

> Your patch #2 needs only small adjustments to implement 3).
> Please adjust and resend.
>
will do.

> Your patch #1 identifies all places where a re-phrase is needed.
> It would be good if you could give that a try.
>
will do.

> I am working on 2) as time permits. It seems doable.
> I have something ready within a few days/weeks.
>
ok.

> Please always cc: Michal Marek on patches touching kconfig.
> He is the (unofficial) maintainer of kconfig.
> We have not heard from Roman Zippel for > one year :-(
>
shouldn't MAINTAINERS be updated to reflect this ?

Thanks,
 - Arnaud
