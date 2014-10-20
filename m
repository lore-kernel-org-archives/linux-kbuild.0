Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:51658 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752909AbaJTLDh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Oct 2014 07:03:37 -0400
Message-id: <5444EBFA.5030103@samsung.com>
Date: Mon, 20 Oct 2014 15:03:22 +0400
From: Andrey Ryabinin <a.ryabinin@samsung.com>
MIME-version: 1.0
Subject: drivers: random: Shift out-of-bounds in _mix_pool_bytes
References: <1413802499-17928-1-git-send-email-a.ryabinin@samsung.com>
In-reply-to: <1413802499-17928-1-git-send-email-a.ryabinin@samsung.com>
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Michal Marek <mmarek@suse.cz>, Sasha Levin <sasha.levin@oracle.com>, x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, Dmitry Vyukov <dvyukov@google.com>, Konstantin Khlebnikov <koct9i@gmail.com>

Hi, Theodore.

I've got this while booting kernel with ubsan:

    [    0.000000] ================================================================================
    [    0.000000] UBSan: Undefined behaviour in ../include/linux/bitops.h:107:33
    [    0.000000] shift exponent 32 is to large for 32-bit type 'unsigned int'
    [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 3.18.0-rc1+ #64
    [    0.000000]  0000000000000020 0000000000000000 0000000000000000 ffffffff83003c68
    [    0.000000]  ffffffff82add58a 000000000000009f 0000000000000020 ffffffff83003c78
    [    0.000000]  ffffffff819a4519 ffffffff83003d28 ffffffff819a4a05 ffffffff82df889d
    [    0.000000] Call Trace:
    [    0.000000] dump_stack (/home/andrew/linux/ubsan_x86//lib/dump_stackc:52)
    [    0.000000] ubsan_epilogue (/home/andrew/linux/ubsan_x86//lib/ubsanc:159)
    [    0.000000] __ubsan_handle_shift_out_of_bounds (/home/andrew/linux/ubsan_x86//lib/ubsanc:458)
    [    0.000000] ? dmi_string_nosave (/home/andrew/linux/ubsan_x86//drivers/firmware/dmi_scanc:51)
    [    0.000000] ? dmi_string (/home/andrew/linux/ubsan_x86//drivers/firmware/dmi_scanc:72)
    [    0.000000] ? dmi_save_ident (/home/andrew/linux/ubsan_x86//drivers/firmware/dmi_scanc:159)
    [    0.000000] _mix_pool_bytes (/home/andrew/linux/ubsan_x86//include/linux/bitopsh:107 /home/andrew/linux/ubsan_x86//drivers/char/randomc:509)
    [    0.000000] ? dmi_decode (/home/andrew/linux/ubsan_x86//drivers/firmware/dmi_scanc:376)
    [    0.000000] ? dmi_walk_early (/home/andrew/linux/ubsan_x86//drivers/firmware/dmi_scanc:127)
    [    0.000000] add_device_randomness (/home/andrew/linux/ubsan_x86//drivers/char/randomc:747)
    [    0.000000] ? dmi_save_one_device (/home/andrew/linux/ubsan_x86//drivers/firmware/dmi_scanc:375)
    [    0.000000] ? dmi_save_one_device (/home/andrew/linux/ubsan_x86//drivers/firmware/dmi_scanc:375)
    [    0.000000] dmi_walk_early (/home/andrew/linux/ubsan_x86//drivers/firmware/dmi_scanc:127)
    [    0.000000] dmi_present (/home/andrew/linux/ubsan_x86//drivers/firmware/dmi_scanc:497)
    [    0.000000] dmi_scan_machine (/home/andrew/linux/ubsan_x86//drivers/firmware/dmi_scanc:555)
    [    0.000000] setup_arch (/home/andrew/linux/ubsan_x86//arch/x86/kernel/setupc:1022)
    [    0.000000] ? printk (/home/andrew/linux/ubsan_x86//kernel/printk/printkc:1849)
    [    0.000000] ? early_idt_handlers (/home/andrew/linux/ubsan_x86//arch/x86/kernel/head_64S:344)
    [    0.000000] start_kernel (/home/andrew/linux/ubsan_x86//include/linux/bitmaph:162 /home/andrew/linux/ubsan_x86//include/linux/cpumaskh:333
/home/andrew/linux/ubsan_x86//include/linux/mm_typesh:464 /home/andrew/linux/ubsan_x86//init/mainc:532)
    [    0.000000] ? early_idt_handlers (/home/andrew/linux/ubsan_x86//arch/x86/kernel/head_64S:344)
    [    0.000000] x86_64_start_reservations (/home/andrew/linux/ubsan_x86//arch/x86/kernel/head64c:194)
    [    0.000000] x86_64_start_kernel (/home/andrew/linux/ubsan_x86//arch/x86/kernel/head64c:183)
    [    0.000000] ================================================================================
