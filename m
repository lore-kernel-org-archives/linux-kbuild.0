Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:53818 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751753Ab1GZS21 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jul 2011 14:28:27 -0400
Date: Tue, 26 Jul 2011 11:28:24 -0700
From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: [RFC][PATCH 1/2] kconfig: Introduce KCONFIG(),
 KCONFIG_BUILTIN() and KCONFIG_MODULE()
Message-Id: <20110726112824.b357c756.rdunlap@xenotime.net>
In-Reply-To: <4E2F0735.1070403@suse.cz>
References: <4E1D9C25.8080300@suse.cz>
	<1311634718-32588-1-git-send-email-mmarek@suse.cz>
	<CAM_iQpUEfYrrtpcRLTekSHMHrTTka6ir=z_GUUbnxuQKfY+OXA@mail.gmail.com>
	<4E2EBF63.8050208@suse.cz>
	<20110726080443.62196869.rdunlap@xenotime.net>
	<4E2F0735.1070403@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: =?ISO-8859-1?Q?Am=E9rico?= Wang <xiyou.wangcong@gmail.com>, linux-kbuild@vger.kernel.org, lacombar@gmail.com, sam@ravnborg.org, linux-kernel@vger.kernel.org, plagnioj@jcrosoft.com

On Tue, 26 Jul 2011 20:28:05 +0200 Michal Marek wrote:

> Dne 26.7.2011 17:04, Randy Dunlap napsal(a):
> > On Tue, 26 Jul 2011 15:21:39 +0200 Michal Marek wrote:
> >> On 26.7.2011 15:01, Américo Wang wrote:
> >>> BTW, the name KCONFIG(CONFIG_NUMA) seems ugly.
> >>
> >> Suggest a better one :). The proposals so far:
> >> config_is_numa() (breaks grep)
> > 
> > explain, please.
> 
> If you grep for CONFIG_FOO usage, you'll miss this alternate syntax.
> 

Ack.

> 
> >> CONFIGURED(CONFIG_NUMA)
> >> ENABLED(CONFIG_NUMA)
> >> KCONFIG(CONFIG_NUMA)
> > 
> > CONFIG(NUMA) || CONFIG(NUMA_BUILTIN) || CONFIG(NUMA_MODULE)
> 
> same problem.

Yes, I sorta got that after I sent the email.

I guess I prefer your ENABLED() syntax then.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
