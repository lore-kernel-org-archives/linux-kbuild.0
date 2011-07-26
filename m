Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy1-pub.bluehost.com ([66.147.249.253]:59096 "HELO
	oproxy1-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751877Ab1GZPEq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jul 2011 11:04:46 -0400
Date: Tue, 26 Jul 2011 08:04:43 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [RFC][PATCH 1/2] kconfig: Introduce KCONFIG(),
 KCONFIG_BUILTIN() and KCONFIG_MODULE()
Message-Id: <20110726080443.62196869.rdunlap@xenotime.net>
In-Reply-To: <4E2EBF63.8050208@suse.cz>
References: <4E1D9C25.8080300@suse.cz>
	<1311634718-32588-1-git-send-email-mmarek@suse.cz>
	<CAM_iQpUEfYrrtpcRLTekSHMHrTTka6ir=z_GUUbnxuQKfY+OXA@mail.gmail.com>
	<4E2EBF63.8050208@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: =?ISO-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong@gmail.com>, linux-kbuild@vger.kernel.org, lacombar@gmail.com, sam@ravnborg.org, linux-kernel@vger.kernel.org, plagnioj@jcrosoft.com

On Tue, 26 Jul 2011 15:21:39 +0200 Michal Marek wrote:

> On 26.7.2011 15:01, Américo Wang wrote:
> > On Tue, Jul 26, 2011 at 6:58 AM, Michal Marek<mmarek@suse.cz>  wrote:
> >> Replace the config_is_*() macros with a variant that allows for grepping
> >> for usage of CONFIG_* options in the code. Usage:
> >>
> >>   if (KCONFIG(CONFIG_NUMA))
> >>
> >> or
> >>
> >>   #if KCONFIG(CONFIG_NUMA)
> >>
> >> The KCONFIG() macro evaluates to 1 if the argument is set (to either 'y'
> >> or 'm'), KCONFIG_BUILTIN() and KCONFIG_MODULE() test if the respective
> >> option is 'y' and 'm', respectively.
> >
> > I think it's better to let KCONFIG_MODULE() returns true only for =m, so that
> > KCONFIG() will equal to KCONFIG_BUILTIN() || KCONFIG_MODULE().
> 
> This is how it's done.
> 
> 
> > BTW, the name KCONFIG(CONFIG_NUMA) seems ugly.
> 
> Suggest a better one :). The proposals so far:
> config_is_numa() (breaks grep)

explain, please.

> CONFIGURED(CONFIG_NUMA)
> ENABLED(CONFIG_NUMA)
> KCONFIG(CONFIG_NUMA)

CONFIG(NUMA) || CONFIG(NUMA_BUILTIN) || CONFIG(NUMA_MODULE)

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
