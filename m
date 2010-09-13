Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from tuxonice.net ([74.207.252.127]:41370 "EHLO mail.tuxonice.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750874Ab0IMFBk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Sep 2010 01:01:40 -0400
Message-ID: <4C8DB031.6050008@tuxonice.net>
Date: Mon, 13 Sep 2010 15:01:37 +1000
From: Nigel Cunningham <nigel@tuxonice.net>
MIME-Version: 1.0
Subject: Re: 2.6.36-rc3 - Unable to build: "Error: input truncated"
References: <4C8CB5A1.9040500@tuxonice.net>	<201009121934.37033.rjw@sisk.pl>	<4C8D5D41.90104@tuxonice.net> <20100912201152.a4ada04a.randy.dunlap@oracle.com>
In-Reply-To: <20100912201152.a4ada04a.randy.dunlap@oracle.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: "Rafael J. Wysocki" <rjw@sisk.pl>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Hi.

On 13/09/10 13:11, Randy Dunlap wrote:
> On Mon, 13 Sep 2010 09:07:45 +1000 Nigel Cunningham wrote:
>
>> Hi.
>>
>> On 13/09/10 03:34, Rafael J. Wysocki wrote:
>>> On Sunday, September 12, 2010, Nigel Cunningham wrote:
>>>> Hi all.
>>>>
>>>> I'm unable to compile the latest kernel and git bisect isn't helping:
>>>
>>> Did you try to save .config, run "make distclean" and restore .config?
>>
>> I hadn't tried that, but had done git reset --hard and make clean
>> menuconfig bzImage. Trying distclean doesn't help, I'm afraid. Perhaps I
>> should attach my .config. I'm running a 32 bit kernel/distro on a 64 bit
>> machine if that makes any difference.
>
>
> Try to strace scripts/mod/mk_elfconfig to see why it is producing
> that error message:
>
>     scripts/mod/mk_elfconfig<  scripts/mod/empty.o>  scripts/mod/elfconfig.h
> Error: input truncated
>
> I guess that the empty.o file is not in the expected format.

Yeah. It's zero bytes long.

> Who owns that stuff, anyway?

I figured the kbuild guys did, which is why I cc'd them.

> You should probably post the empty.o file so that interested parties can
> try to debug the problem.
>
> I built the kernel just fine with the .config file that you posted.

Okay. So it's probably something specific to Ubuntu Lucid then. I'll see 
if I can find the time to do a bisection by hand.

Nigel
