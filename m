Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:32773 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751627AbbGNToM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jul 2015 15:44:12 -0400
Message-ID: <55A5661F.90909@gmail.com>
Date: Tue, 14 Jul 2015 12:42:23 -0700
From: Florian Fainelli <f.fainelli@gmail.com>
MIME-Version: 1.0
Subject: Re: [GIT PULL] kbuild misc fixes for v4.2-rc1
References: <20150702203736.GA23499@pobox.suse.cz> <CA+55aFx2NScXTnv_0gx=WBe1RGdzHp=QKkaoh1cpcTZ1HKaSxg@mail.gmail.com> <5596690A.9090004@suse.cz>
In-Reply-To: <5596690A.9090004@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andi Kleen <ak@linux.intel.com>, andrej.skvortzov@gmail.com, arnaud.patard@rtp-net.org, Borislav Petkov <bp@suse.de>, dmitry.kalinkin@gmail.com, fabio.estevam@freescale.com, Jim Davis <jim.epost@gmail.com>, riku.voipio@linaro.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>

On 03/07/15 03:50, Michal Marek wrote:
> On 2015-07-03 00:25, Linus Torvalds wrote:
>> So with all these changes to the build system fro 4.2, I'm *still*
>> getting that annoying
>>
>>    X.509 certificate list changed
>>
>> issue. Which apparently people don't normally see, because it does to
>> stdout rather than to stderr, so it's hidden by all the other random
>> build output.
> 
> There is a fix for that in in David Howels's tree, the topmost commit being
> 
> commit 9c71c950793b1b8c23c6d945b31f6545f82adced
> Author: David Woodhouse <David.Woodhouse@intel.com>
> Date:   Thu May 21 12:23:55 2015 +0100
> 
>     modsign: Add explicit CONFIG_SYSTEM_TRUSTED_KEYS option
> 
> I though it was meant for 4.2, but I do not even see it in linux-next.
> David, what's your plan with the patches by David W?
> 
> Anyway, none of the kbuild branches was *meant* to fix the issue.

I cannot seem to find any of these changes in 4.2-rc2, was there
anything else that needed to be fixed in Michal's pull request?

Thanks
-- 
Florian
