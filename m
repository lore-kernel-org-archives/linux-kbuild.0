Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:51648 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730700AbeLTVsC (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Dec 2018 16:48:02 -0500
Subject: Re: [PATCH] kbuild: use -flive-patching when CONFIG_LIVEPATCH is
 enabled
References: <20181219141744.32392-1-mbenes@suse.cz>
 <20181219165428.5udrppedpdvf2u7k@treble>
 <nycvar.YFH.7.76.1812191756450.17216@cbobk.fhfr.pm>
 <20181219172127.o753af7pkrsttcgl@treble>
 <nycvar.YFH.7.76.1812191909490.17216@cbobk.fhfr.pm>
 <alpine.LSU.2.21.1812200919210.28185@pobox.suse.cz>
From: Joao Moreira <jmoreira@suse.de>
Message-ID: <3fec8358-f64c-57e4-fa7f-1ee91a45be9b@suse.de>
Date: Thu, 20 Dec 2018 13:47:53 -0800
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.1812200919210.28185@pobox.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miroslav Benes <mbenes@suse.cz>, Jiri Kosina <jikos@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, jeyu@kernel.org, pmladek@suse.com, linux-kbuild@vger.kernel.org, live-patching@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/20/18 12:33 AM, Miroslav Benes wrote:
> On Wed, 19 Dec 2018, Jiri Kosina wrote:
> 
>> On Wed, 19 Dec 2018, Josh Poimboeuf wrote:
>>
>>> Also the commit message needs an analysis of the performance impacts.
>>
>> Agreed. Especially as it's expected (*) to be completely in the noise
>> particularly for the kernel, it'd be good to have that documented in the
>> changelog.
>>
>> (*) actually measured already for some subset of the IPA optimizations
> 
> Ok, we can do that. I don't expect the results to be different from the
> last measurement as Jiri mentions. The sets of disabled optimizations are
> similar.
> 
> I'll add it to v2.
> 
> On Wed, 19 Dec 2018, Jiri Kosina wrote:
> 
>> On Wed, 19 Dec 2018, Josh Poimboeuf wrote:
>>
>>>>> This option only makes sense for source-based patch generation, so isn't
>>>>> it a bit premature to make this change without proper source-based patch
>>>>> tooling?
>>>>
>>>> The reality is though that before the full-fledged patch tooling exists,
>>>> people are actually already writing livepatches by hand, so this option is
>>>> useful for them.
>>>
>>> Fair enough.
> 
> Yes, that was the reason I sent it. It would not make sense to wait for
> the tooling in this case, because -flive-patching is useful even now,
> since there is a way to prepare livepatches without any tooling.
> 
>>> Though, upstream, almost everybody seems to use kpatch-build, for which
>>> this patch doesn't help.  And people will continue to do so until we
>>> have decent source-based tooling.  Will the klp-convert patches be
>>> revived soon?
>>
>> Let me add Joao, who's working on that.
>>
>> Joao, I think you had something basically ready for upstream exposure,
>> right?
> 
> I think that when Joao posted it a long time ago, the conclusion was that
> it would be better to wait for the source-based tooling and have the
> complete solution. I may misremember though.

Your memories match mine, Miroslav.

FTR, we recently integrated klp-convert to SLE. There were some fixes in 
comparison with the version which was submitted upstream, thus a v2 of 
the patches is necessary.

> 
> If Josh thinks that it would be acceptable to have klp-convert merged even
> without the tooling, I'm all for it.
> 
Of course I can work on that and I'll be glad to do so / submit this new 
version, if this is now something considered useful.

> We're about to start using it at SUSE and staying close to upstream would
> definitely be better.
> 
> Miroslav
> 
