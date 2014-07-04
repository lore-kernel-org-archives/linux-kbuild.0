Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f49.google.com ([209.85.215.49]:65048 "EHLO
	mail-la0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760215AbaGDXqQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 4 Jul 2014 19:46:16 -0400
Received: by mail-la0-f49.google.com with SMTP id gf5so1466137lab.22
        for <linux-kbuild@vger.kernel.org>; Fri, 04 Jul 2014 16:46:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53B72780.4000302@suse.cz>
References: <CALCETrWSX1nVqyfe0Ee2rUvpHosTRyW8GSJfr52UCpT566-eWA@mail.gmail.com>
 <1402652395-28779-1-git-send-email-mmarek@suse.cz> <539AC82B.4070505@suse.cz>
 <CALCETrVbq3kQtq0jOsE0fBAkrSB=UxbB2P9F9iVd1896wO+f-g@mail.gmail.com> <53B72780.4000302@suse.cz>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 4 Jul 2014 16:45:54 -0700
Message-ID: <CALCETrWRo9B=q04dqGZZS0ojXaRxdA4kQ6UQWSaeq-Z6yD=7oQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Do not run modules_install and install in paralel
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Jul 4, 2014 at 3:15 PM, Michal Marek <mmarek@suse.cz> wrote:
> Dne 13.6.2014 19:29, Andy Lutomirski napsal(a):
>> On Fri, Jun 13, 2014 at 2:45 AM, Michal Marek <mmarek@suse.cz> wrote:
>>> Dne 13.6.2014 11:39, Michal Marek napsal(a):
>>>> Based on a x86-only patch by Andy Lutomirski <luto@amacapital.net>
>>>>
>>>> With modular kernels, 'make install' is going to need the installed
>>>> modules at some point to generate the initramfs.
>>>>
>>>> Signed-off-by: Michal Marek <mmarek@suse.cz>
>>>> ---
>>>>  Makefile | 6 ++++++
>>>>  1 file changed, 6 insertions(+)
>>>>
>>>> diff --git a/Makefile b/Makefile
>>>> index 7680d7c..7e5e483 100644
>>>> --- a/Makefile
>>>> +++ b/Makefile
>>>> @@ -503,6 +503,12 @@ ifeq ($(KBUILD_EXTMOD),)
>>>>                  endif
>>>>          endif
>>>>  endif
>>>> +# install and module_install need also be processed one by one
>>>> +ifneq ($(filter install,$(MAKECMDGOALS)),)
>>>> +        ifneq ($(filter modules_install,$(MAKECMDGOALS)),)
>>>> +             mixed-targets := 1
>>>> +        endif
>>>> +endif
>>>
>>> Note that this version does not enforce the ordering, it just avoids the
>>> interleaved execution. It can be added if desired.
>>
>> Hmm.  This will fix 'make modules_install install' but will not fix
>> 'make install modules_install'.  I don't know how many people would
>> type the latter.
>
> Resuming a thread from last month -- As I said, it does not enforce the
> ordering. So it's not as bullet-proof as your patch, but it works on all
> architectures. I'm thinking about adding the patch to kbuild.git for
> 3.17. But if you want to fix the ordering as well, feel free to change
> the __build_one_by_one rule to do this.

Sounds good to me.

Where's __build_one_by_one?

--Andy

>
> Thanks,
> Michal



-- 
Andy Lutomirski
AMA Capital Management, LLC
