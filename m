Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:46522 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932957AbeFLSSH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jun 2018 14:18:07 -0400
Received: by mail-ot0-f195.google.com with SMTP id q1-v6so29179119oth.13
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jun 2018 11:18:06 -0700 (PDT)
Subject: Re: [PATCHv4 1/3] scripts: Preprocess module-common.lds
References: <20180612003224.3658-2-labbott@redhat.com>
 <201806120915.NeKL1aUj%fengguang.wu@intel.com>
 <8736xsv8w3.fsf@concordia.ellerman.id.au>
From: Laura Abbott <labbott@redhat.com>
Message-ID: <1d6bf671-ec88-2d04-065c-96045759c680@redhat.com>
Date: Tue, 12 Jun 2018 11:18:02 -0700
MIME-Version: 1.0
In-Reply-To: <8736xsv8w3.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, Andy Lutomirski <luto@kernel.org>, mjw@fedoraproject.org, "H . J . Lu" <hjl.tools@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Torvalds <torvalds@linux-foundation.org>, X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org, Nick Clifton <nickc@redhat.com>, Cary Coutant <ccoutant@gmail.com>, linux-kbuild@vger.kernel.org

On 06/11/2018 11:03 PM, Michael Ellerman wrote:
> kbuild test robot <lkp@intel.com> writes:
> 
>> Hi Laura,
>>
>> I love your patch! Yet something to improve:
>>
>> [auto build test ERROR on linus/master]
>> [also build test ERROR on v4.17 next-20180608]
>> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>>
>> url:    https://github.com/0day-ci/linux/commits/Laura-Abbott/scripts-Preprocess-module-common-lds/20180612-083632
>> config: i386-randconfig-a1-201823 (attached as .config)
>> compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
>> reproduce:
>>          # save the attached .config to linux build tree
>>          make ARCH=i386
>>
>> All errors (new ones prefixed by >>):
>>
>>>> ld: cannot open linker script file scripts/module-common.lds: No such file or directory
> 
> This seems to need the following.
> 
> cheers
> 
> 
> diff --git a/Makefile b/Makefile
> index 73f0bb2c7a98..55a5725b6606 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -425,7 +425,7 @@ KBUILD_AFLAGS_KERNEL :=
>   KBUILD_CFLAGS_KERNEL :=
>   KBUILD_AFLAGS_MODULE  := -DMODULE
>   KBUILD_CFLAGS_MODULE  := -DMODULE
> -KBUILD_LDFLAGS_MODULE := -T $(srctree)/scripts/module-common.lds
> +KBUILD_LDFLAGS_MODULE := -T $(objtree)/scripts/module-common.lds
>   LDFLAGS :=
>   GCC_PLUGINS_CFLAGS :=
>   
> 

Thanks for pointing that out. I think I missed that when refactoring.
I'll fix that in the next version plus adding your powerpc patch.

Thanks,
Laura
