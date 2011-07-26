Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53185 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751373Ab1GZSZ2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Jul 2011 14:25:28 -0400
Message-ID: <4E2F0735.1070403@suse.cz>
Date: Tue, 26 Jul 2011 20:28:05 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC][PATCH 1/2] kconfig: Introduce KCONFIG(), KCONFIG_BUILTIN()
 and KCONFIG_MODULE()
References: <4E1D9C25.8080300@suse.cz>	<1311634718-32588-1-git-send-email-mmarek@suse.cz>	<CAM_iQpUEfYrrtpcRLTekSHMHrTTka6ir=z_GUUbnxuQKfY+OXA@mail.gmail.com>	<4E2EBF63.8050208@suse.cz> <20110726080443.62196869.rdunlap@xenotime.net>
In-Reply-To: <20110726080443.62196869.rdunlap@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: =?ISO-8859-1?Q?Am=E9rico_Wang?= <xiyou.wangcong@gmail.com>, linux-kbuild@vger.kernel.org, lacombar@gmail.com, sam@ravnborg.org, linux-kernel@vger.kernel.org, plagnioj@jcrosoft.com

Dne 26.7.2011 17:04, Randy Dunlap napsal(a):
> On Tue, 26 Jul 2011 15:21:39 +0200 Michal Marek wrote:
>> On 26.7.2011 15:01, Américo Wang wrote:
>>> BTW, the name KCONFIG(CONFIG_NUMA) seems ugly.
>>
>> Suggest a better one :). The proposals so far:
>> config_is_numa() (breaks grep)
> 
> explain, please.

If you grep for CONFIG_FOO usage, you'll miss this alternate syntax.


>> CONFIGURED(CONFIG_NUMA)
>> ENABLED(CONFIG_NUMA)
>> KCONFIG(CONFIG_NUMA)
> 
> CONFIG(NUMA) || CONFIG(NUMA_BUILTIN) || CONFIG(NUMA_MODULE)

same problem.

Michal
