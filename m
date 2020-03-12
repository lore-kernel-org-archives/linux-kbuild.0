Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr60056.outbound.protection.outlook.com ([40.107.6.56]:21920
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725268AbgCLTve (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Mar 2020 15:51:34 -0400
Subject: Re: [PATCH] scripts/kallsyms: fix wrong kallsyms_relative_base with
 CONFIG_KALLSYMS_BASE_RELATIVE
References: <da22e0ac-8da8-8a16-e8dd-b7065752cb4d@mir.dev>
 <CAK7LNASput9F2XhAi4NUT7jx1z+-mSJXUDnqCfKGtXq_SNbohQ@mail.gmail.com>
 <bd6dc9fb-3171-c12d-6d80-31a52eb9eb0a@mir.dev>
 <CAK7LNASOHOkBPFTKQH2jPc522E=bBJ2wtK8q1PVrqMVhMChghQ@mail.gmail.com>
 <87lfo6i2c0.fsf@mpe.ellerman.id.au>
From: Mikhail Petrov <Mikhail.Petrov@mir.dev>
Message-ID: <39bb9377-2609-5f3b-2627-2c6408a71e3a@mir.dev>
Date: Thu, 12 Mar 2020 22:51:21 +0300
In-Reply-To: <87lfo6i2c0.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Michael,

On 12.03.2020 8:12, Michael Ellerman wrote:
> Masahiro Yamada <masahiroy@kernel.org> writes:
>> On Thu, Mar 12, 2020 at 3:18 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
>>> On 11.03.2020 9:06, Masahiro Yamada wrote:
>>>> On Wed, Mar 11, 2020 at 5:34 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
>>>>>
>>>>> There is the code in the read_symbol function in 'scripts/kallsyms.c':
>>>>>
>>>>>         if (is_ignored_symbol(name, type))
>>>>>                 return NULL;
>>>>>
>>>>>         /* Ignore most absolute/undefined (?) symbols. */
>>>>>         if (strcmp(name, "_text") == 0)
>>>>>                 _text = addr;
>>>>>
>>>>> But the is_ignored_symbol function returns true for name="_text" and type='a'. So the next condition is not executed and the _text variable is always zero.
>>>>>
>>>>> It makes the wrong kallsyms_relative_base symbol as a result of the code:
>>>>>
>>>>>         if (base_relative) {
>>>>>                 output_label("kallsyms_relative_base");
>>>>>                 output_address(relative_base);
>>>>>                 printf("\n");
>>>>>         }
>>>>>
>>>>> Because the output_address function uses the _text variable.
>>>>>
>>>>> So the kallsyms_lookup function and all related functions in the kernel do not work properly. For example, the stack trace in oops:
>>>>>
>>>>>         Call Trace:
>>>>>         [aa095e58] [809feab8] kobj_ns_ops_tbl+0x7ff09ac8/0x7ff1c1c4 (unreliable)
>>>>>         [aa095e98] [80002b64] kobj_ns_ops_tbl+0x7f50db74/0x80000010
>>>>>         [aa095ef8] [809c3d24] kobj_ns_ops_tbl+0x7feced34/0x7ff1c1c4
>>>>>         [aa095f28] [80002ed0] kobj_ns_ops_tbl+0x7f50dee0/0x80000010
>>>>>         [aa095f38] [8000f238] kobj_ns_ops_tbl+0x7f51a248/0x80000010
>>>>>
>>>>> The right stack trace:
>>>>>
>>>>>         Call Trace:
>>>>>         [aa095e58] [809feab8] module_vdu_video_init+0x2fc/0x3bc (unreliable)
>>>>>         [aa095e98] [80002b64] do_one_initcall+0x40/0x1f0
>>>>>         [aa095ef8] [809c3d24] kernel_init_freeable+0x164/0x1d8
>>>>>         [aa095f28] [80002ed0] kernel_init+0x14/0x124
>>>>>         [aa095f38] [8000f238] ret_from_kernel_thread+0x14/0x1c
>>>>
>>>> Thanks for the patch.
>>>>
>>>> Just for curiosity, on which architecrure
>>>> did you see  name="_text" and type='a' case ?
>>>
>>> Actually 'a' is 'A' (my mistake). The architecture is PowerPC - core PPC476FS.
>>>
>>> nm -n .tmp_vmlinux1 looks like:
>>>
>>> ...
>>>          w kallsyms_token_table
>>>          w mach_powermac
>>> 00000007 a LG_CACHELINE_BYTES
>>> 00000007 a LG_CACHELINE_BYTES
>>> 00000007 a LG_CACHELINE_BYTES
>>> 00000020 a reg
>>> 0000007f a CACHELINE_MASK
>>> 0000007f a CACHELINE_MASK
>>> 0000007f a CACHELINE_MASK
>>> 00000080 a CACHELINE_BYTES
>>> 00000080 a CACHELINE_BYTES
>>> 00000080 a CACHELINE_BYTES
>>> 00000400 a dcr
>>> 80000000 T _start
>>> 80000000 A _stext
>>> 80000000 A _text
>>
>>
>> Hmm, I am still not able to reproduce this.
>>
>> I compiled ARCH=powerpc, but
>> 'powerpc-linux-nm -n .tmp_vmlinux1' got this.
>>
>>
>> 0000007f a CACHELINE_MASK
>> 0000007f a CACHELINE_MASK
>> 0000007f a CACHELINE_MASK
>> 00000080 a CACHELINE_BYTES
>> 00000080 a CACHELINE_BYTES
>> 00000080 a CACHELINE_BYTES
>> 00000400 a dcr
>> c0000000 T _start
>> c0000000 T _stext
>> c0000000 T _text
>> c00000b8 t interrupt_base
>> c00000c0 t CriticalInput
>> c00001a0 t MachineCheck
>> c0000280 t MachineCheckA
>>
>>
>> Which defconfig did you use?
>>
>>
>> (I also CCed the ppc maintainer,
>> I am just curious what makes _text absolute.)
> 
> I have no idea sorry.
> 
> arch/powerpc has about 20 sub-platforms that do weird and wonderful
> things. Presumably this happens on one of those.
> 
> I played around with some of the defconfigs but couldn't reproduce this.
> 
> The only config we have that puts the kernel at 0x80000000 is:
> 
>   $ git grep 80000000  arch/powerpc/configs/
>   arch/powerpc/configs/85xx/xes_mpc85xx_defconfig:CONFIG_PAGE_OFFSET=0x80000000
> 
> But that's not a PPC476 platform.

It is a custom config for a custom SoC. The config is not in the upstream repository. PAGE_OFFSET has been changed for increasing the address space for PCI windows and some devices.


> 
> And _text is not 'A':
> 
>   $ nm .tmp_vmlinux1 | grep -w _text
>   80000000 T _text

I used the old GCC version - 4.8.1. In modern versions of GCC, the record has type 'T'.

> 
> 
> cheers
> 

--
Best Regards
Mikhail Petrov
