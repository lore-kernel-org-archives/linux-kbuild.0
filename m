Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-db8eur05on2053.outbound.protection.outlook.com ([40.107.20.53]:6068
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730677AbgCKSSt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Mar 2020 14:18:49 -0400
Subject: Re: [PATCH] scripts/kallsyms: fix wrong kallsyms_relative_base with
 CONFIG_KALLSYMS_BASE_RELATIVE
References: <da22e0ac-8da8-8a16-e8dd-b7065752cb4d@mir.dev>
 <CAK7LNASput9F2XhAi4NUT7jx1z+-mSJXUDnqCfKGtXq_SNbohQ@mail.gmail.com>
From: Mikhail Petrov <Mikhail.Petrov@mir.dev>
Message-ID: <bd6dc9fb-3171-c12d-6d80-31a52eb9eb0a@mir.dev>
Date: Wed, 11 Mar 2020 21:18:40 +0300
In-Reply-To: <CAK7LNASput9F2XhAi4NUT7jx1z+-mSJXUDnqCfKGtXq_SNbohQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Masahiro,

On 11.03.2020 9:06, Masahiro Yamada wrote:
> Hi Mikhail,
> 
> On Wed, Mar 11, 2020 at 5:34 AM Mikhail Petrov <Mikhail.Petrov@mir.dev> wrote:
>>
>> There is the code in the read_symbol function in 'scripts/kallsyms.c':
>>
>>         if (is_ignored_symbol(name, type))
>>                 return NULL;
>>
>>         /* Ignore most absolute/undefined (?) symbols. */
>>         if (strcmp(name, "_text") == 0)
>>                 _text = addr;
>>
>> But the is_ignored_symbol function returns true for name="_text" and type='a'. So the next condition is not executed and the _text variable is always zero.
>>
>> It makes the wrong kallsyms_relative_base symbol as a result of the code:
>>
>>         if (base_relative) {
>>                 output_label("kallsyms_relative_base");
>>                 output_address(relative_base);
>>                 printf("\n");
>>         }
>>
>> Because the output_address function uses the _text variable.
>>
>> So the kallsyms_lookup function and all related functions in the kernel do not work properly. For example, the stack trace in oops:
>>
>>         Call Trace:
>>         [aa095e58] [809feab8] kobj_ns_ops_tbl+0x7ff09ac8/0x7ff1c1c4 (unreliable)
>>         [aa095e98] [80002b64] kobj_ns_ops_tbl+0x7f50db74/0x80000010
>>         [aa095ef8] [809c3d24] kobj_ns_ops_tbl+0x7feced34/0x7ff1c1c4
>>         [aa095f28] [80002ed0] kobj_ns_ops_tbl+0x7f50dee0/0x80000010
>>         [aa095f38] [8000f238] kobj_ns_ops_tbl+0x7f51a248/0x80000010
>>
>> The right stack trace:
>>
>>         Call Trace:
>>         [aa095e58] [809feab8] module_vdu_video_init+0x2fc/0x3bc (unreliable)
>>         [aa095e98] [80002b64] do_one_initcall+0x40/0x1f0
>>         [aa095ef8] [809c3d24] kernel_init_freeable+0x164/0x1d8
>>         [aa095f28] [80002ed0] kernel_init+0x14/0x124
>>         [aa095f38] [8000f238] ret_from_kernel_thread+0x14/0x1c
>>
>> Signed-off-by: Mikhail Petrov <Mikhail.Petrov@mir.dev>
>>
>> ---
> 
> 
> Thanks for the patch.
> 
> Just for curiosity, on which architecrure
> did you see  name="_text" and type='a' case ?

Actually 'a' is 'A' (my mistake). The architecture is PowerPC - core PPC476FS.

nm -n .tmp_vmlinux1 looks like:

...
         w kallsyms_token_table
         w mach_powermac
00000007 a LG_CACHELINE_BYTES
00000007 a LG_CACHELINE_BYTES
00000007 a LG_CACHELINE_BYTES
00000020 a reg
0000007f a CACHELINE_MASK
0000007f a CACHELINE_MASK
0000007f a CACHELINE_MASK
00000080 a CACHELINE_BYTES
00000080 a CACHELINE_BYTES
00000080 a CACHELINE_BYTES
00000400 a dcr
80000000 T _start
80000000 A _stext
80000000 A _text
80000088 t interrupt_base
800000a0 t CriticalInput
80000180 t MachineCheck
80000260 t MachineCheckA
80000360 t DataStorage
80000420 t InstructionStorage
80000500 t ExternalInput
800005c0 t Alignment
80000680 t Program
80000740 t FloatingPointUnavailable
80000820 t SystemCall
80000900 t AuxillaryProcessorUnavailable
...

 
> Could you wrap the commit log to avoid
> this checkpatch warning?
> WARNING: Possible unwrapped commit description (prefer a maximum 75
> chars per line)
> 
> Also, could you shorten the patch subject
> to make it fit in this limit?

Sorry for that. Now I know about scripts/checkpatch.pl. I will improve and resubmit the patch soon.

Thanks.
