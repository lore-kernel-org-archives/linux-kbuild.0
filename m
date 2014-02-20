Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from b.ns.miles-group.at ([95.130.255.144]:1661 "EHLO radon.swed.at"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753242AbaBTN56 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Feb 2014 08:57:58 -0500
Message-ID: <530609E1.4090704@nod.at>
Date: Thu, 20 Feb 2014 14:57:53 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
Subject: Re: [PATCH] Makefile: Unset stack-protector gcc flag if it is not
 supported
References: <1391793327-9578-1-git-send-email-markos.chandras@imgtec.com>	<5305F928.5070600@imgtec.com> <CAFLxGvyA+2QTkUwOthLiaH5iVT-6HvzwWEBoUaPoqrBxbLzxLw@mail.gmail.com> <530608E0.90805@imgtec.com>
In-Reply-To: <530608E0.90805@imgtec.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Markos Chandras <Markos.Chandras@imgtec.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Am 20.02.2014 14:53, schrieb Markos Chandras:
> On 02/20/2014 12:53 PM, Richard Weinberger wrote:
>> On Thu, Feb 20, 2014 at 1:46 PM, Markos Chandras
>> <Markos.Chandras@imgtec.com> wrote:
>>> On 02/07/2014 05:15 PM, Markos Chandras wrote:
>>>>
>>>> In case the compiler does not support the stack-protector option,
>>>> unset the flag to avoid build failures. Printing a warning is enough
>>>> to let the user know that this flag will not be used.
>>>> Fixes the following build problem when using a toolchain which does
>>>> not support the -fstack-protector-strong flag:
>>>>
>>>> Makefile:614: Cannot use CONFIG_CC_STACKPROTECTOR_STRONG:
>>>> -fstack-protector-strong not supported by compiler
>>>> mips-linux-gnu-gcc: error: unrecognized command line option
>>>> '-fstack-protector-strong'
>>>> scripts/Makefile.build:308: recipe for target 'scripts/mod/empty.o' failed
>>>> make[2]: *** [scripts/mod/empty.o] Error 1
>>>> make[2]: *** Waiting for unfinished jobs....
>>>> scripts/Makefile.build:455: recipe for target 'scripts/mod' failed
>>>>
>>>> Cc: Michal Marek <mmarek@suse.cz>
>>>> Cc: linux-kbuild@vger.kernel.org
>>>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>>>> ---
>>>>    Makefile | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/Makefile b/Makefile
>>>> index 606ef7c..63a5333 100644
>>>> --- a/Makefile
>>>> +++ b/Makefile
>>>> @@ -607,12 +607,14 @@ ifdef CONFIG_CC_STACKPROTECTOR_REGULAR
>>>>      ifeq ($(call cc-option, $(stackp-flag)),)
>>>>        $(warning Cannot use CONFIG_CC_STACKPROTECTOR: \
>>>>                -fstack-protector not supported by compiler))
>>>> +    stackp-flag :=
>>>>      endif
>>>>    else ifdef CONFIG_CC_STACKPROTECTOR_STRONG
>>>>      stackp-flag := -fstack-protector-strong
>>>>      ifeq ($(call cc-option, $(stackp-flag)),)
>>>>        $(warning Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: \
>>>>                -fstack-protector-strong not supported by compiler)
>>>> +    stackp-flag :=
>>>>      endif
>>>>    else
>>>>      # Force off for distro compilers that enable stack protector by
>>>> default.
>>>>
>>>
>>> Ping again?
>>
>> This is by design. We want the build fail if
>> CONFIG_CC_STACKPROTECTOR_STRONG is set
>> but the toolchain does not support it.
>> Otherwise we could end up with a kernel without stackprotector even if
>> the config symbol is set.
>>
> 
> Hi Richard,
> 
> Then maybe the $(warning...) should be converted to $(error...)?
> Because it's not really a warning if the build failure is expected to happen.

No. This would break silentoldconfig.

Thanks,
//richard
