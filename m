Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:41302 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935440AbeEXCQF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 May 2018 22:16:05 -0400
Received: by mail-oi0-f67.google.com with SMTP id 11-v6so65160ois.8
        for <linux-kbuild@vger.kernel.org>; Wed, 23 May 2018 19:16:05 -0700 (PDT)
Subject: Re: [PATCHv3 2/2] x86/vdso: Add build salt to the vDSO
References: <20180523001939.9431-1-labbott@redhat.com>
 <20180523001939.9431-3-labbott@redhat.com>
 <CALCETrX9P2Lwrx7wGc22poVWX2AHAqXbUdhcijyoJ3tGhaxijg@mail.gmail.com>
 <15dcff14-ea1b-18c8-4cd1-06586cf6f05b@redhat.com>
 <CAK7LNARMJ0WNnxWXPxpyq_K_osBTRZB+0-Vo5XS_ME9GyZ0UxQ@mail.gmail.com>
 <CAK7LNARYXqx6U+fA2AuY00vMkMDbcNSf-VG_Avf+9j5AMLSsJw@mail.gmail.com>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <f930aa34-c8d1-6e78-2c0f-363c0be1c9a6@redhat.com>
Date: Wed, 23 May 2018 19:16:02 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNARYXqx6U+fA2AuY00vMkMDbcNSf-VG_Avf+9j5AMLSsJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andy Lutomirski <luto@kernel.org>, Mark Wielaard <mjw@fedoraproject.org>, "H. J. Lu" <hjl.tools@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 05/23/2018 06:43 PM, Masahiro Yamada wrote:
> 2018-05-24 9:11 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
>> 2018-05-24 7:53 GMT+09:00 Laura Abbott <labbott@redhat.com>:
>>> On 05/22/2018 05:33 PM, Andy Lutomirski wrote:
>>>>
>>>> On Tue, May 22, 2018 at 5:19 PM Laura Abbott <labbott@redhat.com> wrote:
>>>>
>>>>
>>>>> The vDSO is linked separately from the kernel and modules. Ensure it
>>>>> picks
>>>>> up the comment section, if available.
>>>>
>>>>
>>>> Did you end up preferring this to just sticking the kernel version in a
>>>> .comment in the vDSO for some reason?
>>>>
>>>
>>> Actually I remember now why this is necessary: there is not a simple way
>>> to encode a string into a linker file as it has to be spit out byte
>>> by byte. The autogeneration was the easiest way to make that happen.
>>> Maybe there's some horrific c preprocessing or other generation that
>>> could happen but I doubt that's any worse than the generated linker
>>> script.
>>>
>>
>>
>> I am personally prefer CONFIG option (as you did in v2) to KERNELVERSION.
>>
>>
>> If you use "hex" type instead of "string" type in Kconfig,
>> and LONG() instead of BYTE() in the script script,
>> this can be much simpler, right?
>>
>>
>>
>>
>>
>> config BUILD_ID_SALT
>>          hex "Build ID Salt"
>>          help
>>             ...
>>
>>
>>
>>
>> Then, in scripts/Makefile,
>>
>>
>> define filechk_build-salt.lds
>>          { \
>>                  echo "SECTIONS {"; \
>>                  echo ".comment (INFO) : { LONG($(CONFIG_BUILD_ID_SALT)); }"; \
>>                  echo "}"; \
>>          }
>> endef
>>
>> $(obj)/build-salt.lds: $(src)/Makefile FORCE
>>          $(call filechk,build-salt.lds)
>>
>>
>>
>>
>> This is now so simple that we can even remove the shell script.
> 
> 
> 
> I had not noticed the comments from Linus and Andy
> before I posted mine.
> 
> 
> Maybe, we should not add binary data into the .comment section.
> 
> 
> 

The comments from Linus and Andy apply to the vDSO but I don't
think they work for the kernel/modules. We need something that
can apply to every module and the kernel and the linker script
seems like easiest way to do that. The vDSO is a self-contained
binary so it makes sense to not use the linker script there and
instead throw something in one of the existing files.

I'm kind of iffy about making the build-id salt a hex string
since that requires bit more work to generate. I'll experiment
in a new version.

Thanks,
Laura
