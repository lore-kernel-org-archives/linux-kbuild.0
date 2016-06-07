Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:41757 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751500AbcFGKsY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Jun 2016 06:48:24 -0400
Subject: Re: Regression in "kbuild: fix if_change and friends to consider
 argument order"
References: <1465263518.3885.9.camel@intel.com> <5756960E.5020706@suse.com>
 <57569ACC.8050503@suse.cz>
 <CAK7LNARPUqD9BY5p-=M49KkQM7+j0bVFBX2On_rqdJjRs=zeTQ@mail.gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <5756A675.3080003@suse.cz>
Date: Tue, 7 Jun 2016 12:48:21 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNARPUqD9BY5p-=M49KkQM7+j0bVFBX2On_rqdJjRs=zeTQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>

On 2016-06-07 12:03, Masahiro Yamada wrote:
> 2016-06-07 18:58 GMT+09:00 Michal Marek <mmarek@suse.cz>:
>> On 2016-06-07 11:38, Michal Marek wrote:
>>> On 2016-06-07 03:38, Zanoni, Paulo R wrote:
>>>> Hi
>>>>
>>>> I recently noticed that alternating between "make" and "make targz-pkg"
>>>> rebuilds the whole Kernel. This was not happening before. As a Kernel
>>>> developer, my build/install/test environment heavily relies on the fact
>>>> that "make targz-pkg" only quickly generates the tarball if everything
>>>> is already built, so this change is heavily impacting my development
>>>> environment.
>>>>
>>>> I did some bisection and concluded that the first bad commit is:
>>>>
>>>> commit 9c8fa9bc08f60ac657751daba9fccf828a36cfed
>>>> Author: Masahiro Yamada
>>>> Date:   Sat May 7 15:48:26 2016 +0900
>>>>     kbuild: fix if_change and friends to consider argument order
>>>>
>>>> I also verified that if I just revert this commit on top of the
>>>> most recent tree it goes back to the usual behavior.
>>>>
>>>> I read the commit message and it seems that some unneeded rebuilds are
>>>> somewhat expected, but I can't understand why such a change in the
>>>> command line like the one I did triggers everything to be rebuilt.
>>>> IMHO, it really shouldn't. I also wonder that maybe the regression I'm
>>>> experiencing was not expected in the original change, so maybe there's
>>>> a way to keep the original improvement caused by the mentioned patch
>>>> without the regression I'm experiencing.
>>>>
>>>> How to reproduce (exact commands I used at every bisect step):
>>>>
>>>> $ make tinyconfig
>>>> $ time make -j4 V=2 # this should build things
>>>> $ time make -j4 V=2 # just to make sure nothing will be rebuilt
>>>> $ time make -j4 V=2 targz-pkg
>>>
>>> I can reproduce it.
>>
>> Try the attached patch.
>>
>> Michal
>>
> 
> 
> Right.
> 
> I had already sent a similar patch.
> https://patchwork.kernel.org/patch/9159863/

I see. I hadn't read all my mail before replying.


> My concern is it is effectively
> reverting e8f5bdb02ce0.
> I hope Rik can comment on that.

My patch just resets NOSTDINC_FLAGS before including the arch Makefile.

Michal

