Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:39574 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750740Ab0HPMgo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 08:36:44 -0400
Date: Mon, 16 Aug 2010 14:36:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC 0/2] Factor Kconfig's prefix and package name
Message-ID: <20100816123642.GA7233@merkur.ravnborg.org>
References: <1281934457-4225-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1281934457-4225-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On Mon, Aug 16, 2010 at 12:54:15AM -0400, Arnaud Lacombe wrote:
> Hi,
> 
> Many projects are using Kconfig's derivate as their configuration UI.  Some of
> these projects change the default "CONFIG_" prefix for something else. It
> obliges them to dig in the sources to find and replace all occurences and
> associated constant. Same goes for package name where when the project ship a C
> library, messages about a kernel may not be welcome. OOTH, a project may want to
> limit its changes to be able to re-sync with the kernel's Kconfig and benefits
> from latest features and bug fixes.
> 
> The two next patches factorizes Kconfig's prefix and package name to generic
> macros defined in `scripts/kconfig/lkc.h'. This allow projects to easily tune
> Kconfig for their need with trivial source modification.
> 
> There may have been similar patches in the past, in which case this message can
> be silently discarded :)
> 
> any comments appreciated !

Hi Arnaud.

I am very much in favour of getting kconfig less tied into the kernel.
We discussed this topic briefly af the buildrrot list the other day,
and I am started to look at it too.

What you have done below looks like similar attempts
I have seen in the past - and I did not like them then
and do not like it now.
I have outlined below there three steps needed as I see it.
And I would be very glad for help on two of these.

1) "Kernel" appear in diverse feedback texts
  - Re-phrase this to refer to the configuration.
    You know that you change the configuration
    of kernel/buildroot/ptxdist/whatever and
    there is no value of repeating this info in
    the feedback texts.
  - Re-phrasing have the benefit that once the
    translators pick up the new version the
    translated text is valied for all users.
    This would not be the case if you replace
    the project name.

2) References to kernel + version in title in frontends
  - Use the (today unused) mainmenu entry to pick up the
    title.
    Consider following example:

mainmenu "Linux kernel configuration v$KERNELVERSION"

config KERNELVERSION
	string
	option env=KERNELVERSION

   With the above exampe we no longer hardcode
   the title and we use already existing features
   to get the version from the environment.
   The expansion of "$KERNELVERSION" to the value
   of the symbol is something I only see supported
   by "mainmenu".
 - This should also address the cases where we
   referer to the project name/version in the
   .config file (see confdata.c).


3) Do not hardcode "CONFIG_"
  - I suggest to introduce a single define named "CONFIG_".
    All the places that hardcode the length should be
    replaced by strlen(CONFIG_).
  - The define should be conditional like this:
#if !defined(CONFIG_)
#define CONFIG_ "CONFIG_"  
#endif
    In this way other users can just use -DCONFIG_=BR2_ as they prefer.


Your patch #2 needs only small adjustments to implement 3).
Please adjust and resend.

Your patch #1 identifies all places where a re-phrase is needed.
It would be good if you could give that a try.

I am working on 2) as time permits. It seems doable.
I have something ready within a few days/weeks.

Please always cc: Michal Marek on patches touching kconfig.
He is the (unofficial) maintainer of kconfig.
We have not heard from Roman Zippel for > one year :-(

	Sam
