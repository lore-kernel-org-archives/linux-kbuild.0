Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:44924 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753874AbcC3N3m (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 30 Mar 2016 09:29:42 -0400
Subject: Re: [GIT PULL] kconfig changes for v4.6-rc1
References: <20160324205119.GA11597@pobox.suse.cz>
 <CAMuHMdUrEbBi=Lmjq_R8YcaXueS5ErEV+qEbDjUS22iG7wcUpw@mail.gmail.com>
 <CAMuHMdX1W9dg4oeAH0Qw5MNFXBO-joHc_=BKLcBgruT0h9a9kg@mail.gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <56FBD4C3.5090701@suse.cz>
Date: Wed, 30 Mar 2016 15:29:39 +0200
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX1W9dg4oeAH0Qw5MNFXBO-joHc_=BKLcBgruT0h9a9kg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Al Viro <viro@zeniv.linux.org.uk>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jan Beulich <JBeulich@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 2016-03-25 10:03, Geert Uytterhoeven wrote:
> On Fri, Mar 25, 2016 at 9:54 AM, Geert Uytterhoeven
>>> Al Viro (1):
>>>       unbreak allmodconfig KCONFIG_ALLCONFIG=...
>>
>> I can now indeed drop the
>>
>>     CONFIG_MODULES=y
>>
>> line from my
>>
>>     allmod.config
>>
>> However, this fix has the side-effect of enabling CONFIG_MODULES silently for
>>
>>     make allyesconfig KCONFIG_ALLCONFIG=1
>>
>> Adding an explicit
>>
>>     CONFIG_MODULES=n
>>
>> to the allyes.config file fixes that.
>>
>> IMHO CONFIG_MODULES should default to y when using allmodconfig, and
>> default to n when using allyesconfig.
> 
> Hmm, it seems plain "make allyesconfig" also enables CONFIG_MODULES, and
> makes many options modular. Is that intentional, especially the latter?

allyesconfig builds everything into the kernel, so why exclude the
module loader. And there are a few modules with a 'depends on m'
statement, either because this is test code in samples/ which is not
even considered when linking the kernel, or there is some "issue" when
the code is built-in. The statement might also be completely bogus, but
that's not a job of allyesconfig to decide.

Michal
