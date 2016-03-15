Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50890 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932474AbcCOVfH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 15 Mar 2016 17:35:07 -0400
Subject: Re: [PATCH] kbuild: Add option to turn incompatible pointer check
 into error
References: <1457425749-24110-1-git-send-email-wagi@monom.org>
 <alpine.DEB.2.11.1603081010000.6083@nanos> <20160308091941.GD12413@gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56E88003.3050708@suse.com>
Date: Tue, 15 Mar 2016 22:34:59 +0100
MIME-Version: 1.0
In-Reply-To: <20160308091941.GD12413@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Daniel Wagner <wagi@monom.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Daniel Wagner <daniel.wagner@bmw-carit.de>

Dne 8.3.2016 v 10:19 Ingo Molnar napsal(a):
> 
> * Thomas Gleixner <tglx@linutronix.de> wrote:
> 
>> On Tue, 8 Mar 2016, Daniel Wagner wrote:
>>
>>> From: Daniel Wagner <daniel.wagner@bmw-carit.de>
>>>
>>> With the introduction of the simple wait API we have two very
>>> similar APIs in the kernel. For example wake_up() and swake_up()
>>> is only one character away. Although the compiler will warn
>>> happily the wrong usage it keeps on going an even links the kernel.
>>> Thomas and Peter would rather like to see early missuses reported
>>> as error early on.
>>>
>>> In a first attempt we tried to wrap all swait and wait calls
>>> into a macro which has an compile time type assertion. The result
>>> was pretty ugly and wasn't able to catch all wrong usages.
>>> woken_wake_function(), autoremove_wake_function() and wake_bit_function()
>>> are assigned as function pointers. Wrapping them with a macro around is
>>> not possible. Prefixing them with '_' was also not a real option
>>> because there some users in the kernel which do use them as well.
>>> All in all this attempt looked to intrusive and too ugly.
>>>
>>> An alternative is to turn the pointer type check into an error which
>>> catches wrong type uses. Obviously not only the swait/wait ones. That
>>> isn't a bad thing either.
>>>
>>> Signed-off-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
>>> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>>> Cc: Thomas Gleixner <tglx@linutronix.de>
>>
>> Acked-by: Thomas Gleixner <tglx@linutronix.de>

Applied to kbuild.git#kbuild.

> 
> Note that there will be a few build failures triggered by this, for example this 
> fix from linux-next is needed:
> 
>> commit db9b60400f9253c25ae639797df2d0ff7a35d9d8
>> Author: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
>> Date:   Tue Feb 2 11:35:55 2016 +0530
>>
>>     drm/gma500: remove helper function

OK. I will send a pull request to Linus only after at least
x86_64/allyescofnig is fixed.

Michal
