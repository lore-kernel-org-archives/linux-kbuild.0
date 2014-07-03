Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:42875 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751399AbaGCUzp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Jul 2014 16:55:45 -0400
Message-ID: <53B5C34C.3060505@suse.cz>
Date: Thu, 03 Jul 2014 22:55:40 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/Makefile.clean: clean also $(extra-m) and $(extra-)
References: <539963D4.3040409@suse.cz> <53A1EE1E.3090906@suse.cz> <20140620212212.9339.AA925319@jp.panasonic.com> <53A435B9.605@suse.cz>
In-Reply-To: <53A435B9.605@suse.cz>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org

Dne 20.6.2014 15:23, Michal Marek napsal(a):
> Dne 20.6.2014 14:22, Masahiro Yamada napsal(a):
>> Hi Michal,
>>
>>
>> On Wed, 18 Jun 2014 21:53:02 +0200
>> Michal Marek <mmarek@suse.cz> wrote:
>>
>>> Dne 12.6.2014 10:24, Michal Marek napsal(a):
>>>> Dne 6.6.2014 03:43, Masahiro Yamada napsal(a):
>>>>> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
>>>>> ---
>>>>>  scripts/Makefile.clean | 4 ++--
>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
>>>>> index 686cb0d..a651cee 100644
>>>>> --- a/scripts/Makefile.clean
>>>>> +++ b/scripts/Makefile.clean
>>>>> @@ -40,8 +40,8 @@ subdir-ymn	:= $(addprefix $(obj)/,$(subdir-ymn))
>>>>>  # build a list of files to remove, usually relative to the current
>>>>>  # directory
>>>>>  
>>>>> -__clean-files	:= $(extra-y) $(always)                  \
>>>>> -		   $(targets) $(clean-files)             \
>>>>> +__clean-files	:= $(extra-y) $(extra-m) $(extra-)       \
>>>>> +		   $(always) $(targets) $(clean-files)   \
>>>>
>>>> Do you have an example where generated files are left in the tree after
>>>> make clean? This should go into the changelog.
>>>
>>> Hi Masahiro,
>>>
>>> do you have a reproducer, i.e. an example where make clean leaves
>>> generated files in the tree?
>>
>> No, I don't.
>>
>> I thought
>> arch/powerpc/kernel/Makefile is using
>> extra-$(CONFIG_...) += ...
>> but  *.o  files are simply cleaned-up.  So this isn't the case.
> 
> OK, so there is no urgent need to add this to 'rc-fixes'. I'll queue it
> up in 'kbuild' for 3.17-rc1.

It's in kbuild.git#kbuild now.

Michal

