Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60682 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750883Ab1J0Occ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 27 Oct 2011 10:32:32 -0400
Message-ID: <4EA96B7E.5020809@suse.cz>
Date: Thu, 27 Oct 2011 16:32:30 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] config: Add 'make kvmconfig'
References: <1319717234-20918-1-git-send-email-levinsasha928@gmail.com> <CAOJsxLH-O8+Fx=VLsoXhVLNtXWD_1eVrUMOgbk2DODbrwPAzhQ@mail.gmail.com> <20111027123713.GB22032@elte.hu> <4EA953E8.4020004@suse.cz> <CAOJsxLHT9V-K26=Qt10sDVibRjoVgZBVULsVwYD5oqrM0bN+5Q@mail.gmail.com>
In-Reply-To: <CAOJsxLHT9V-K26=Qt10sDVibRjoVgZBVULsVwYD5oqrM0bN+5Q@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pekka Enberg <penberg@kernel.org>
Cc: Ingo Molnar <mingo@elte.hu>, Sasha Levin <levinsasha928@gmail.com>, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild@vger.kernel.org

On 27.10.2011 16:11, Pekka Enberg wrote:
> On Thu, Oct 27, 2011 at 3:51 PM, Michal Marek <mmarek@suse.cz> wrote:
>>> I like the feature - i hope it's expressed in the right Kbuild-ish
>>> fashion.
>>>
>>> Acked-by: Ingo Molnar <mingo@elte.hu>
>>
>> I hope we won't now also be getting make nfsconfig, make paeconfig and
>> whatnot :). Also, the lists of select statements might need updates from
>> time to time, if new dependencies appear.
> 
> The use case is to be able to take a .config posted in a bug report
> and easily turn that into something that the KVM tool can boot.
> 
> "kvmconfig" really represents a virtualized x86 architecture
> configuration. Maybe the naming is off because it's not about
> individual features like paeconfig or nfsconfig would be but rather
> about turning on all the required options for virtualized x86 for the
> KVM tool.

OK, if it's just this single use case, then why not.


> If you have better ideas how to do this, we're happy to change the
> implementation.

The implementation is not as important as the new user interface that
people get used to. And I think the user interface is OK. Regarding
implementation, expect that you'll have to add more select statements
from time to time. But there is ATM no better solution to this.

Michal
