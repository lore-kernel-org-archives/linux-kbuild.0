Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from galactus.symlabs.net ([91.121.6.203]:58392 "EHLO symlabs.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1761953AbYEARNd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 1 May 2008 13:13:33 -0400
Message-ID: <33623.81.193.128.196.1209661842.squirrel@galactus.symlabs.net>
In-Reply-To: <20080501165333.GG29330@cs181133002.pp.htv.fi>
References: <16355.213.30.72.21.1209618475.squirrel@galactus.symlabs.net>
    <20080501120616.GY29330@cs181133002.pp.htv.fi>
    <38941.81.193.128.196.1209654347.squirrel@galactus.symlabs.net>
    <20080501163453.GF29330@cs181133002.pp.htv.fi>
    <34486.81.193.128.196.1209659903.squirrel@galactus.symlabs.net>
    <20080501165333.GG29330@cs181133002.pp.htv.fi>
Date: Thu, 1 May 2008 19:10:42 +0200 (CEST)
Subject: Re: gcc 3.4.6 fails to build 2.6.25 due to offsetof() not
     digestible by gas
From: sampo@symlabs.com
Reply-To: sampo@symlabs.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Adrian Bunk <bunk@kernel.org>
Cc: sampo@symlabs.com, linux-kbuild@vger.kernel.org

Adrian Bunk wrote:
> On Thu, May 01, 2008 at 06:38:23PM +0200, sampo@symlabs.com wrote:
>> Adrian Bunk wrote:
>> > On Thu, May 01, 2008 at 05:05:47PM +0200, sampo@symlabs.com wrote:
>> >> Adrian Bunk wrote:
>> >> > On Thu, May 01, 2008 at 07:07:55AM +0200, sampo@symlabs.com wrote:
>> >> >> Platform: x86
>> >> >> Compiler: gcc-3.4.6
>> >> >> Binutils: 2.17.50.0.8
>> >> >> Kernel under build: 2.6.25 (from kernel.org)
>> >> >>
>> >> >> Problem: Build fails due to incompatibility of asm-offsets.h with
>> >> >> assembler. See below:
>> >> >>
>> >> >> gcc -Wp,-MD,arch/x86/kernel/.entry_32.o.d  -nostdinc -isystem
>> >> >> /apps/gcc/3.4.6/lib/gcc/i686-pc-linux-gnu/3.4.6/include
>> -D__KERNEL__
>> >> >> -Iinclude  -include include/linux/autoconf.h -D__ASSEMBLY__ -m32
>> >> >> -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1
>> >> >> -Iinclude/asm-x86/mach-default     -c -o
>> arch/x86/kernel/entry_32.o
>> >> >> arch/x86/kernel/entry_32.S
>> >> >> include/asm/asm-offsets.h: Assembler messages:
>> >> >> include/asm/asm-offsets.h:10: Error: invalid character '_' in
>> >> mnemonic
>> >> >> include/asm/asm-offsets.h:11: Error: invalid character '_' in
>> >> mnemonic
>> >> >> include/asm/asm-offsets.h:12: Error: invalid character '_' in
>> >> mnemonic
>> >> >> include/asm/asm-offsets.h:13: Error: invalid character '_' in
>> >> mnemonic
>> >> >> include/asm/asm-offsets.h:14: Error: invalid character '_' in
>> >> mnemonic
>> >> >> include/asm/asm-offsets.h:15: Error: invalid character '_' in
>> >> mnemonic
>> >> >> (snip - much more of the same)
>> >> >>...
>> >> >
>> >> > Thanks for your report.
>> >> >
>> >> > Please send:
>> >> > - your .config
>> >> > - your include/asm/asm-offsets.h
>> >>
>> >> Please see attached. FYI
>> >>
>> >> ls-alFg include/asm
>> >> lrwxrwxrwx 1 sampo sampo 7 May  1 02:30 include/asm -> asm-x86/
>> >
>> > Thanks, the next things I need are:
>> > - arch/x86/kernel/asm-offsets.s
>>
>> See attached.
>
> Thanks.
>
>> > - the output of "sed --version"
>>
>> sed --version
>> GNU sed version 4.1.5-boot
>>...
>
> Where does this "4.1.5-boot" version come from?
> Is this some stripped down version of sed?

Interesting question. I do use busybox as my userland for most purposes,
but in case of sed I believe it really is the gnu sed.

which sed
/usr/bin/sed
/usr/bin/sed --version
GNU sed version 4.1.5-boot
Copyright (C) 2003 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE,
to the extent permitted by law.
sampo@jin:/aino/linux 0$ /bin/sed --version
This is not GNU sed version 4.0

The former, which is gnu sed, should be picked up by PATH. The latter
which appears to be picked by make, is the busybox sed. The gnu sed was
compiled by me for my own distro, hence -boot label, but has not been
stripped down in any way.

> If you run
>
>   sed -ne "/^->/{s:^->\([^ ]*\) [\$$#]*\([^ ]*\) \(.*\):#define \1 \2 /*
> \3 */:; s:->::; p;}" < asm-offsets.s
>

#define IA32_SIGCONTEXT_ax 44 /* offsetof(struct sigcontext, ax)        # */
#define IA32_SIGCONTEXT_bx 32 /* offsetof(struct sigcontext, bx)        # */
#define IA32_SIGCONTEXT_cx 40 /* offsetof(struct sigcontext, cx)        # */
#define IA32_SIGCONTEXT_dx 36 /* offsetof(struct sigcontext, dx)        # */
#define IA32_SIGCONTEXT_si 20 /* offsetof(struct sigcontext, si)        # */
#define IA32_SIGCONTEXT_di 16 /* offsetof(struct sigcontext, di)        # */
#define IA32_SIGCONTEXT_bp 24 /* offsetof(struct sigcontext, bp)        # */
#define IA32_SIGCONTEXT_sp 28 /* offsetof(struct sigcontext, sp)        # */
#define IA32_SIGCONTEXT_ip 56 /* offsetof(struct sigcontext, ip)        # */

#define CPUINFO_x86  /* offsetof(struct cpuinfo_x86, x86)       # */
#define CPUINFO_x86_vendor 1 /* offsetof(struct cpuinfo_x86, x86_vendor)  
     # */
#define CPUINFO_x86_model 2 /* offsetof(struct cpuinfo_x86, x86_model)  # */
#define CPUINFO_x86_mask 3 /* offsetof(struct cpuinfo_x86, x86_mask)    # */
#define CPUINFO_hard_math 6 /* offsetof(struct cpuinfo_x86, hard_math)  # */
#define CPUINFO_cpuid_level 12 /* offsetof(struct cpuinfo_x86,
cpuid_level)     # */
#define CPUINFO_x86_capability 16 /* offsetof(struct cpuinfo_x86,
x86_capability)       # */
#define CPUINFO_x86_vendor_id 48 /* offsetof(struct cpuinfo_x86,
x86_vendor_id) # */

#define TI_task  /* offsetof(struct thread_info, task)  # */
#define TI_exec_domain 4 /* offsetof(struct thread_info, exec_domain)   # */
#define TI_flags 8 /* offsetof(struct thread_info, flags)       # */
#define TI_status 12 /* offsetof(struct thread_info, status)    # */
#define TI_preempt_count 20 /* offsetof(struct thread_info, preempt_count)
     # */
#define TI_addr_limit 24 /* offsetof(struct thread_info, addr_limit)    # */
#define TI_restart_block 32 /* offsetof(struct thread_info, restart_block)
     # */
#define TI_sysenter_return 28 /* offsetof(struct thread_info,
sysenter_return)  # */
#define TI_cpu 16 /* offsetof(struct thread_info, cpu)  # */

#define GDS_size  /* offsetof(struct desc_ptr, size)    # */
#define GDS_address 2 /* offsetof(struct desc_ptr, address)     # */

#define PT_EBX  /* offsetof(struct pt_regs, bx) # */
#define PT_ECX 4 /* offsetof(struct pt_regs, cx)        # */
#define PT_EDX 8 /* offsetof(struct pt_regs, dx)        # */
#define PT_ESI 12 /* offsetof(struct pt_regs, si)       # */
#define PT_EDI 16 /* offsetof(struct pt_regs, di)       # */
#define PT_EBP 20 /* offsetof(struct pt_regs, bp)       # */
#define PT_EAX 24 /* offsetof(struct pt_regs, ax)       # */
#define PT_DS 28 /* offsetof(struct pt_regs, ds)        # */
#define PT_ES 32 /* offsetof(struct pt_regs, es)        # */
#define PT_FS 36 /* offsetof(struct pt_regs, fs)        # */
#define PT_ORIG_EAX 40 /* offsetof(struct pt_regs, orig_ax)     # */
#define PT_EIP 44 /* offsetof(struct pt_regs, ip)       # */
#define PT_CS 48 /* offsetof(struct pt_regs, cs)        # */
#define PT_EFLAGS 52 /* offsetof(struct pt_regs, flags) # */
#define PT_OLDESP 56 /* offsetof(struct pt_regs, sp)    # */
#define PT_OLDSS 60 /* offsetof(struct pt_regs, ss)     # */

#define EXEC_DOMAIN_handler 4 /* offsetof(struct exec_domain, handler)  # */
#define IA32_RT_SIGFRAME_sigcontext 164 /* offsetof(struct rt_sigframe,
uc.uc_mcontext) # */

#define pbe_address  /* offsetof(struct pbe, address)   # */
#define pbe_orig_address 4 /* offsetof(struct pbe, orig_address)        # */
#define pbe_next 8 /* offsetof(struct pbe, next)        # */
#define TSS_sysenter_sp0 -8700 /* offsetof(struct tss_struct, x86_tss.sp0)
- sizeof(struct tss_struct)      # */
#define PAGE_SIZE_asm 4096 /* PAGE_SIZE # */
#define PAGE_SHIFT_asm 12 /* PAGE_SHIFT # */
#define PTRS_PER_PTE 1024 /* PTRS_PER_PTE       # */
#define PTRS_PER_PMD 1 /* PTRS_PER_PMD  # */
#define PTRS_PER_PGD 1024 /* PTRS_PER_PGD       # */
#define crypto_tfm_ctx_offset 48 /* offsetof(struct crypto_tfm, __crt_ctx)
     # */

#define BP_scratch 484 /* offsetof(struct boot_params, scratch) # */
#define BP_loadflags 529 /* offsetof(struct boot_params, hdr.loadflags) # */
#define BP_hardware_subarch 572 /* offsetof(struct boot_params,
hdr.hardware_subarch)   # */
#define BP_version 518 /* offsetof(struct boot_params, hdr.version)     # */


> with your asm-offsets.s file and this sed, does the result contain
>
>   IA32_SIGCONTEXT_ax $44 offsetof(struct sigcontext, ax)  #
>
> or
>
>   #define IA32_SIGCONTEXT_ax 44 /* offsetof(struct sigcontext, ax)
> # */

The latter. Which one is correct? Is asm-offsets.h the output of
the above command? Please confirm.

Since on command line it seems to work fine,
but in make time it bombs, I suspect make somehow manages to find
the busybox sed, which verifiably produces output

IA32_SIGCONTEXT_ax $44 offsetof(struct sigcontext, ax)  #
IA32_SIGCONTEXT_bx $32 offsetof(struct sigcontext, bx)  #
IA32_SIGCONTEXT_cx $40 offsetof(struct sigcontext, cx)  #
IA32_SIGCONTEXT_dx $36 offsetof(struct sigcontext, dx)  #
IA32_SIGCONTEXT_si $20 offsetof(struct sigcontext, si)  #
IA32_SIGCONTEXT_di $16 offsetof(struct sigcontext, di)  #
IA32_SIGCONTEXT_bp $24 offsetof(struct sigcontext, bp)  #
IA32_SIGCONTEXT_sp $28 offsetof(struct sigcontext, sp)  #
IA32_SIGCONTEXT_ip $56 offsetof(struct sigcontext, ip)  #

CPUINFO_x86 $0 offsetof(struct cpuinfo_x86, x86)        #
CPUINFO_x86_vendor $1 offsetof(struct cpuinfo_x86, x86_vendor)  #
CPUINFO_x86_model $2 offsetof(struct cpuinfo_x86, x86_model)    #
CPUINFO_x86_mask $3 offsetof(struct cpuinfo_x86, x86_mask)      #
CPUINFO_hard_math $6 offsetof(struct cpuinfo_x86, hard_math)    #
CPUINFO_cpuid_level $12 offsetof(struct cpuinfo_x86, cpuid_level)       #
CPUINFO_x86_capability $16 offsetof(struct cpuinfo_x86, x86_capability) #
CPUINFO_x86_vendor_id $48 offsetof(struct cpuinfo_x86, x86_vendor_id)   #

TI_task $0 offsetof(struct thread_info, task)   #
TI_exec_domain $4 offsetof(struct thread_info, exec_domain)     #
TI_flags $8 offsetof(struct thread_info, flags) #
TI_status $12 offsetof(struct thread_info, status)      #
TI_preempt_count $20 offsetof(struct thread_info, preempt_count)        #
TI_addr_limit $24 offsetof(struct thread_info, addr_limit)      #
TI_restart_block $32 offsetof(struct thread_info, restart_block)        #
TI_sysenter_return $28 offsetof(struct thread_info, sysenter_return)    #
TI_cpu $16 offsetof(struct thread_info, cpu)    #

GDS_size $0 offsetof(struct desc_ptr, size)     #
GDS_address $2 offsetof(struct desc_ptr, address)       #

PT_EBX $0 offsetof(struct pt_regs, bx)  #
PT_ECX $4 offsetof(struct pt_regs, cx)  #
PT_EDX $8 offsetof(struct pt_regs, dx)  #
PT_ESI $12 offsetof(struct pt_regs, si) #
PT_EDI $16 offsetof(struct pt_regs, di) #
PT_EBP $20 offsetof(struct pt_regs, bp) #
PT_EAX $24 offsetof(struct pt_regs, ax) #
PT_DS $28 offsetof(struct pt_regs, ds)  #
PT_ES $32 offsetof(struct pt_regs, es)  #
PT_FS $36 offsetof(struct pt_regs, fs)  #
PT_ORIG_EAX $40 offsetof(struct pt_regs, orig_ax)       #
PT_EIP $44 offsetof(struct pt_regs, ip) #
PT_CS $48 offsetof(struct pt_regs, cs)  #
PT_EFLAGS $52 offsetof(struct pt_regs, flags)   #
PT_OLDESP $56 offsetof(struct pt_regs, sp)      #
PT_OLDSS $60 offsetof(struct pt_regs, ss)       #

EXEC_DOMAIN_handler $4 offsetof(struct exec_domain, handler)    #
IA32_RT_SIGFRAME_sigcontext $164 offsetof(struct rt_sigframe,
uc.uc_mcontext)   #

pbe_address $0 offsetof(struct pbe, address)    #
pbe_orig_address $4 offsetof(struct pbe, orig_address)  #
pbe_next $8 offsetof(struct pbe, next)  #
TSS_sysenter_sp0 $-8700 offsetof(struct tss_struct, x86_tss.sp0) -
sizeof(struct tss_struct)    #
PAGE_SIZE_asm $4096 PAGE_SIZE   #
PAGE_SHIFT_asm $12 PAGE_SHIFT   #
PTRS_PER_PTE $1024 PTRS_PER_PTE #
PTRS_PER_PMD $1 PTRS_PER_PMD    #
PTRS_PER_PGD $1024 PTRS_PER_PGD #
crypto_tfm_ctx_offset $48 offsetof(struct crypto_tfm, __crt_ctx)        #

BP_scratch $484 offsetof(struct boot_params, scratch)   #
BP_loadflags $529 offsetof(struct boot_params, hdr.loadflags)   #
BP_hardware_subarch $572 offsetof(struct boot_params,
hdr.hardware_subarch)     #
BP_version $518 offsetof(struct boot_params, hdr.version)       #

Thus this is probably a PATH issue of some sort. I will investigate,
but will not delay this response.

Of course as a mild feature request, please fix the sed parts to
be more tolerant of lesser seds.

Cheers,
--Sampo

>> To facilitate more rapid communication,
>>...
>
> You already answer faster than the speed of light.  :-)
>
>> Cheers,
>> --Sampo
>
> Thanks
> Adrian


