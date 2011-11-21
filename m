Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e33.co.us.ibm.com ([32.97.110.151]:54757 "EHLO
	e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752805Ab1KUXle (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 21 Nov 2011 18:41:34 -0500
Received: from /spool/local
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <johnstul@us.ibm.com>;
	Mon, 21 Nov 2011 16:41:30 -0700
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay01.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id pALNfQL6073714
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Nov 2011 16:41:26 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id pALNfNEB031249
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Nov 2011 16:41:26 -0700
Message-ID: <1321918881.6445.45.camel@work-vm>
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
From: john stultz <johnstul@us.ibm.com>
Date: Mon, 21 Nov 2011 15:41:21 -0800
In-Reply-To: <CACqU3MWBDHJoAA5RfOdELDw-ZgsQh0f5aUPtJ4vMi-DnhjSvqQ@mail.gmail.com>
References: <1321567131.25715.32.camel@work-vm>
	 <CACqU3MXg8L7O0UT1ow3pVyM+NJTjjyABW2D6LLFWYSDWy6XEiw@mail.gmail.com>
	 <1321570492.25715.45.camel@work-vm>
	 <CACqU3MWBDHJoAA5RfOdELDw-ZgsQh0f5aUPtJ4vMi-DnhjSvqQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Darren Hart <dvhart@linux.intel.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Sat, 2011-11-19 at 01:24 -0500, Arnaud Lacombe wrote:
> Hi,
> 
> On Thu, Nov 17, 2011 at 5:54 PM, john stultz <johnstul@us.ibm.com> wrote:
> > On Thu, 2011-11-17 at 17:44 -0500, Arnaud Lacombe wrote:
> >> Hi,
> >>
> >> On Thu, Nov 17, 2011 at 4:58 PM, john stultz <johnstul@us.ibm.com> wrote:
> >> > Hey Andrew,
> >> >        I've tried sending this via Michal a few times, but haven't heard much
> >> > back. So I wanted to check if you would consider merging it via your
> >> > tree, or if you had any suggestions of who would be better to
> >> > review/merge this.
> >> >
> >> One of the worry I would have is that the script is merging config
> >> blindly, ie. there is no dependency checking done. I have some some
> >> work-in-progress to help resolving this, but still lots of thought to
> >> be implemented.
> >
> > So the script actually does warn you if a specified option is dropped
> > due to missing dependencies or if the option is removed.  So, I guess
> > could you clarify your concern a bit more?
> >
> well, assuming the following Kconfig's snippet:
> 
> choice
>         bool "choice"
> config A
>         bool "A"
> config B
>         bool "B"
> endchoice
> 
> and trying to merge:
> 
>  - `config1':
> 
> CONFIG_A=y
> 
>  - `config2':
> 
> Result in:
> 
>  % sh scripts/kconfig/merge_config.sh config1 config2
> Merging config1
> Merging config2
> scripts/kconfig/conf --alldefconfig Kconfig
> ./.tmp.config.uMY8Z97l9T:2:warning: override: B changes choice state
> #
> # configuration written to .config
> #
> 
> % cat .config
> #
> # Automatically generated file; DO NOT EDIT.
> # Linux Kernel Configuration
> #
> # CONFIG_A is not set
> CONFIG_B=y
> 
> so we still get the warning from the incantation of `alldefconfig',
> but the one in the script is defeated.

You can find the fix for this along with other recent changes from
Darren and Arnaud in my git tree here:
git://git.linaro.org/people/jstultz/linux.git dev/config-fragments

Browse-able here:
http://git.linaro.org/gitweb?p=people/jstultz/linux.git;a=shortlog;h=refs/heads/dev/config-fragments

Let me know if you have any other thoughts or feedback!

thanks
-john


