Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50728 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754265AbaFRThY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Jun 2014 15:37:24 -0400
Message-ID: <53A1EA72.6070507@suse.cz>
Date: Wed, 18 Jun 2014 21:37:22 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2] builddeb: fix missing headers in linux-headers package
References: <1397562708-7531-1-git-send-email-fathi.boudra@linaro.org>	 <539AE2F5.30301@suse.cz> <1402845573.7797.20.camel@deadeye.wl.decadent.org.uk>
In-Reply-To: <1402845573.7797.20.camel@deadeye.wl.decadent.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Fathi Boudra <fathi.boudra@linaro.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Maximilian Attems <maks@debian.org>

Dne 15.6.2014 17:19, Ben Hutchings napsal(a):
> On Fri, 2014-06-13 at 13:39 +0200, Michal Marek wrote:
>> Dne 15.4.2014 13:51, Fathi Boudra napsal(a):
>>> The kernel headers package (linux-headers) doesn't include several
>>> header files required to build out-of-tree modules.
>>>
>>> It makes the package unusable on e.g. ARM architecture:
>>>  /usr/src/linux-headers-3.14.0/arch/arm/include/asm/memory.h:24:25:
>>>  fatal error: mach/memory.h: No such file or directory
>>>  #include <mach/memory.h>
>>>  ^
>>>  compilation terminated.
>>>
>>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>>> ---
>>>  Changes from v1:
>>>  - add missing module.lds, mips/Kbuild.platforms and Platform files
>>>  - generically look for all include directories in arch/$SRCARCH
>>
>> Ben, is this version OK to merge? Does the package now match the
>> official Debian ones?
> 
> This is not exactly the same, but I think it's good.
> 
> Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

I applied the patch to kbuild.git#rc-fixes.

Thanks,
Michal

