Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:53316 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753577Ab0EGO3P (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 7 May 2010 10:29:15 -0400
Message-ID: <4BE4237A.8090701@oracle.com>
Date: Fri, 07 May 2010 07:28:10 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
MIME-Version: 1.0
Subject: Re: [PATCH] kconfig: introduce nonint_oldconfig and loose_nonint_oldconfig
 (v3)
References: <20100413194747.GX31193@redhat.com> <20100413130031.d4dec19b.randy.dunlap@oracle.com> <20100413201759.GY31193@redhat.com> <4BC4D310.6060705@oracle.com> <20100413210352.GA31193@redhat.com> <4BC5C190.3020501@suse.cz> <20100506164834.GL20778@redhat.com> <20100507070257.GD5921@cr0.nay.redhat.com>
In-Reply-To: <20100507070257.GD5921@cr0.nay.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?ISO-8859-1?Q?Am=E9rico_Wang?= <xiyou.wangcong@gmail.com>
Cc: Aristeu Rozanski <aris@redhat.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, davej@redhat.com, kyle@redhat.com, vgoyal@redhat.com, arjan@linux.intel.com

On 05/07/10 00:02, Américo Wang wrote:
> On Thu, May 06, 2010 at 12:48:34PM -0400, Aristeu Rozanski wrote:
>> This patch has been around for a long time in Fedora and Red Hat Enterprise
>> Linux kernels and it may be useful for others. The nonint_oldconfig target
>> will fail and print the unset config options while loose_nonint_oldconfig will
>> simply let the config option unset. They're useful in distro kernel packages
>> where the config files are built using a combination of smaller config files.
>>
>> Arjan van de Ven wrote the initial nonint_config and Roland McGrath added the
>> loose_nonint_oldconfig.
>>
>> v2:
>> - when -B and -b are used, return "2" so the reason can be distinguished from
>>  other errors
>> v3:
>> - help updated
>> - nonint_oldconfig won't update the config file if options are missing
> 
> The patch looks fine, but, why the name 'nonint_oldconfig'?
> My English is not good enough to see what 'nonint' standards for...

non-interactive

-- 
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
