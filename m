Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46374 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751717AbbH1IDu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 28 Aug 2015 04:03:50 -0400
Subject: Re: [GIT PULL] kbuild misc fixes for v4.2-rc1
References: <20150702203736.GA23499@pobox.suse.cz>
 <CA+55aFx2NScXTnv_0gx=WBe1RGdzHp=QKkaoh1cpcTZ1HKaSxg@mail.gmail.com>
 <5596690A.9090004@suse.cz> <55DF8C2F.9010407@gmail.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55E015E2.10700@suse.cz>
Date: Fri, 28 Aug 2015 10:03:46 +0200
MIME-Version: 1.0
In-Reply-To: <55DF8C2F.9010407@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>, andrej.skvortzov@gmail.com, arnaud.patard@rtp-net.org, Borislav Petkov <bp@suse.de>, dmitry.kalinkin@gmail.com, fabio.estevam@freescale.com, Jim Davis <jim.epost@gmail.com>, riku.voipio@linaro.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>

On 2015-08-28 00:16, Florian Fainelli wrote:
> On 03/07/15 03:50, Michal Marek wrote:
>> On 2015-07-03 00:25, Linus Torvalds wrote:
>>> So with all these changes to the build system fro 4.2, I'm *still*
>>> getting that annoying
>>>
>>>    X.509 certificate list changed
>>>
>>> issue. Which apparently people don't normally see, because it does to
>>> stdout rather than to stderr, so it's hidden by all the other random
>>> build output.
>>
>> There is a fix for that in in David Howels's tree, the topmost commit being
>>
>> commit 9c71c950793b1b8c23c6d945b31f6545f82adced
>> Author: David Woodhouse <David.Woodhouse@intel.com>
>> Date:   Thu May 21 12:23:55 2015 +0100
>>
>>     modsign: Add explicit CONFIG_SYSTEM_TRUSTED_KEYS option
>>
>> I though it was meant for 4.2, but I do not even see it in linux-next.
>> David, what's your plan with the patches by David W?
>>
>> Anyway, none of the kbuild branches was *meant* to fix the issue.
> 
> Michal, it does not look like this pull request has been merged into any
> 4.2-rc release, but I have not seen a resent either, what do we do with
> these changes now?

It will be part of the 4.3-rc1 pull request.

Michal

