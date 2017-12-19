Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52764 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751118AbdLSQly (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Dec 2017 11:41:54 -0500
Date: Tue, 19 Dec 2017 10:41:54 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: parallel make broken with ORC unwinder
Message-ID: <20171219164153.foik72qfn2lojuw7@treble>
References: <CAOMGZ=HkKjXi8UbaDp7qWnh1vCFYC_o3UdyUTgxyBULgb03rwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAOMGZ=HkKjXi8UbaDp7qWnh1vCFYC_o3UdyUTgxyBULgb03rwQ@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, Dec 19, 2017 at 04:42:12PM +0100, Vegard Nossum wrote:
> Hi,
> 
> When I run make -j64 on a v4.14 kernel or newer with ORC_UNWINDER=y
> the kernel build breaks like this:
> 
> $ make -j64
>   CHK     include/config/kernel.release
>   CHK     include/generated/uapi/linux/version.h
>   DESCEND  objtool
>   CC      scripts/mod/empty.o
> [...]
> security/smack/smack_lsm.o: warning: objtool: elf_update: cannot write
> data to file
> [...]
> drivers/atm/uPD98402.o: warning: objtool: elf_update: cannot write data to file
>   AR      arch/x86/entry/vdso/built-in.o
>   CC      security/keys/permission.o
>   CC      arch/x86/entry/vsyscall/vsyscall_gtod.o
>   CC      security/keys/process_keys.o
>   CC [M]  arch/x86/kvm/../../../virt/kvm/irqchip.o
> Segmentation fault
> make[2]: *** [drivers/atm/uPD98402.o] Error 139
> make[2]: *** Waiting for unfinished jobs....

Hi Vegard,

Thanks for reporting this.  Can you clarify why rewriting the file in
place seems buggy?

-- 
Josh
