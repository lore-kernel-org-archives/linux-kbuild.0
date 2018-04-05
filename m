Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57784 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751312AbeDEPDa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Apr 2018 11:03:30 -0400
Date: Thu, 5 Apr 2018 11:03:29 -0400
From: Don Zickus <dzickus@redhat.com>
Subject: Re: [PATCH] kconfig: add support for new option 'listnewdefconfig'
Message-ID: <20180405150329.6ax5pdmwiurx3kg7@redhat.com>
References: <20180404195625.24657-1-dzickus@redhat.com>
 <CAK7LNAQ78HHOz1fu2==_nZDzUTuxRZLHuFu6yu1C354xH8Y8fA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQ78HHOz1fu2==_nZDzUTuxRZLHuFu6yu1C354xH8Y8fA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Thu, Apr 05, 2018 at 11:29:11AM +0900, Masahiro Yamada wrote:
> 2018-04-05 4:56 GMT+09:00 Don Zickus <dzickus@redhat.com>:
> > We at Red Hat/Fedora have generally tried to have a per file breakdown of
> > every config option we set.  This makes it easy for us to add new options
> > when they are exposed and keep a changelog of why they were set.
> >
> > A Fedora example is here:
> >   https://src.fedoraproject.org/cgit/rpms/kernel.git/tree/configs/fedora/generic
> >
> > Using various merge scripts, we build up a config file and run it through
> > 'make listnewconfig' and 'make oldnoconfig'.   The idea is to print out new
> > config options that haven't been manually set and use the default until
> > a patch is posted to set it properly.
> >
> > To speed things up, it would be nice to make it easier to generate a
> > patch to post the default setting.  The output of 'make listnewconfig'
> > has two issues that limit us:
> >
> > - it doesn't provide the default value
> > - it doesn't provide the new 'choice' options that get flagged in
> >   'oldconfig'
> 
> 
> So, 'listnewconfig' is a subset of 'listnewdefconfig'.
> 
> I wonder if we could extend 'listnewconfig' to meet your demands
> instead of adding the new target.

Sure.  I am open to whatever you think is appropriate. :-)

> 
> I do not know why the current listnewconfig skips choice values.
> 
> (Anybody who relies on the current format of listnewconfig?)

I didn't either and didn't want to change it in case I was missing
something.  But it appears you are unsure too.

> 
> 
> Looks like the current listnewconfig
> (it was 'nonint_oldconfig' before renaming)
> was contributed from Fedora/RedHat side.

Originally, nonint_oldconfig was needed to perform what 'oldnoconfig' does
today.  This allowed us to quickly use the defaults and move along.

The downside to that is, a lot of new options pop up that we should take
advantage of and we don't because it is hidden away by process.  We are
working to change that internally so we can react quicker.

> 
> 
> commit f0778c8c41001783d4074e34efc7d3e632d87ee3
> Author: Aristeu Rozanski <aris@redhat.com>
> Date:   Thu May 6 12:48:34 2010 -0400
> 
>     kconfig: introduce nonint_oldconfig and loose_nonint_oldconfig
> 
>     This patch has been around for a long time in Fedora and Red Hat Enterprise
>     Linux kernels and it may be useful for others. The nonint_oldconfig target
>     will fail and print the unset config options while
> loose_nonint_oldconfig will
>     simply let the config option unset. They're useful in distro kernel packages
>     where the config files are built using a combination of smaller
> config files.
> 
>     Arjan van de Ven wrote the initial nonint_config and Roland
> McGrath added the
>     loose_nonint_oldconfig.
> 
>     Signed-off-by: Arjan van de Ven <arjan@redhat.com> [defunct email]
>     Whatevered-by: Kyle McMartin <kyle@redhat.com>
>     Acked-by: Arjan van de Ven <arjan@linux.intel.com>
>     Acked-by: Randy Dunlap <randy.dunlap@oracle.com>
>     Signed-off-by: Aristeu Rozanski <aris@redhat.com>
>     [mmarek: whitespace fixes]
>     Signed-off-by: Michal Marek <mmarek@suse.cz>
> 
> 
> 
> 
> > This patch adds a new command 'listnewdefconfig' that does exactly
> > what 'listnewconfig' does but addresses the above two issues too.
> >
> > This allows us to run a script
> >
> > make listnewdefconfig | rhconfig-tool -o patches; git send-email patches/
> >
> > The output of 'make listnewconfig':
> >
> > CONFIG_NET_EMATCH_IPT
> > CONFIG_IPVLAN
> > CONFIG_ICE
> > CONFIG_NET_VENDOR_NI
> > CONFIG_IEEE802154_MCR20A
> > CONFIG_IR_IMON_DECODER
> > CONFIG_IR_IMON_RAW
> >
> > The output of 'make listnewdefconfig':
> >
> > CONFIG_KERNEL_XZ=n #choice
> > CONFIG_KERNEL_LZO=n #choice
> 
> 
> What for '#choice' comment ?

This was something silly added by me to make it obvious that
CONFIG_KERNEL_XZ doesn't needed to be decided, it just needs us to re-review
our current default to see if we should keep it or switch to something new.

We can drop that piece of the patch.  I wasn't sure if that separating
'choices' from 'configs|menuconfigs' is interesting or not.

I used it as a comment to have it be auto dropped when we run our final
configs through 'oldconfig'.

Thanks for the quick response!

Cheers,
Don
