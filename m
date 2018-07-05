Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:36963 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753947AbeGETUb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Jul 2018 15:20:31 -0400
Received: by mail-qt0-f193.google.com with SMTP id a18-v6so8060684qtj.4
        for <linux-kbuild@vger.kernel.org>; Thu, 05 Jul 2018 12:20:31 -0700 (PDT)
Subject: Re: [PATCHv5 1/4] kbuild: Add build salt to the kernel and modules
References: <20180703233430.14416-1-labbott@redhat.com>
 <20180703233430.14416-2-labbott@redhat.com>
 <CAK7LNAS7XBwDidNaLKC1wD+G30AyAvTHG5GN=UAiP5zz1EO8JA@mail.gmail.com>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <5e3ce0f4-0c4b-e0aa-2b21-9bf4b5bce9e2@redhat.com>
Date: Thu, 5 Jul 2018 12:20:27 -0700
MIME-Version: 1.0
In-Reply-To: <CAK7LNAS7XBwDidNaLKC1wD+G30AyAvTHG5GN=UAiP5zz1EO8JA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Andy Lutomirski <luto@kernel.org>, Mark Wielaard <mjw@fedoraproject.org>, "H . J . Lu" <hjl.tools@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

On 07/03/2018 08:59 PM, Masahiro Yamada wrote:
> Hi.
> 
> Thanks for the update.
> 
> 
> 2018-07-04 8:34 GMT+09:00 Laura Abbott <labbott@redhat.com>:
>>
>> The build id generated from --build-id can be generated in several different
>> ways, with the default being the sha1 on the output of the linked file. For
>> distributions, it can be useful to make sure this ID is unique, even if the
>> actual file contents don't change. The easiest way to do this is to insert
>> a section with some data.
>>
>> Add an ELF note to both the kernel and module which contains some data based
>> off of a config option.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> Signed-off-by: Laura Abbott <labbott@redhat.com>
>> ---
>> v5: I used S-o-b here since the majority of the code was written
>> already.
> 
> 
> I think Suggested-by is good enough.
> S-o-b is appended as a patch is passed from people to people.
> 
> Anyway, this looks good except one bike-shed.
> 
>> Please feel free to change the tag if you think it's not
>> appropriate. I also tweaked this to take an ascii string instead of just
>> a hex value since this makes things much easier on the distribution
>> side.
>> ---
> 
> 
>> diff --git a/init/Kconfig b/init/Kconfig
>> index 041f3a022122..8de789f40db9 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -107,6 +107,15 @@ config LOCALVERSION_AUTO
>>
>>            which is done within the script "scripts/setlocalversion".)
>>
>> +config BUILD_SALT
>> +       string "Build ID Salt"
>> +       default "Linux"
> 
> 
> How about empty string ""
> for default?
> 

Sure, seems to work fine.

Thanks,
Laura

