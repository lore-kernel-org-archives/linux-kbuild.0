Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f182.google.com ([209.85.128.182]:33637 "EHLO
        mail-wr0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751210AbdLSPmP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Dec 2017 10:42:15 -0500
MIME-Version: 1.0
From: Vegard Nossum <vegard.nossum@gmail.com>
Date: Tue, 19 Dec 2017 16:42:12 +0100
Message-ID: <CAOMGZ=HkKjXi8UbaDp7qWnh1vCFYC_o3UdyUTgxyBULgb03rwQ@mail.gmail.com>
Subject: parallel make broken with ORC unwinder
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Hi,

When I run make -j64 on a v4.14 kernel or newer with ORC_UNWINDER=y
the kernel build breaks like this:

$ make -j64
  CHK     include/config/kernel.release
  CHK     include/generated/uapi/linux/version.h
  DESCEND  objtool
  CC      scripts/mod/empty.o
[...]
security/smack/smack_lsm.o: warning: objtool: elf_update: cannot write
data to file
[...]
drivers/atm/uPD98402.o: warning: objtool: elf_update: cannot write data to file
  AR      arch/x86/entry/vdso/built-in.o
  CC      security/keys/permission.o
  CC      arch/x86/entry/vsyscall/vsyscall_gtod.o
  CC      security/keys/process_keys.o
  CC [M]  arch/x86/kvm/../../../virt/kvm/irqchip.o
Segmentation fault
make[2]: *** [drivers/atm/uPD98402.o] Error 139
make[2]: *** Waiting for unfinished jobs....

With FRAME_POINTER_UNWINDER=y everything seems to work fine.

A bisect points to:

ee9f8fce99640811b2b8e79d0d1dbe8bab69ba67 is the first bad commit
commit ee9f8fce99640811b2b8e79d0d1dbe8bab69ba67
Author: Josh Poimboeuf <jpoimboe@redhat.com>
Date:   Mon Jul 24 18:36:57 2017 -0500

    x86/unwind: Add the ORC unwinder

grepping for smack_lsm.o in the build log gives the following output:

  gcc -Wp,-MD,security/smack/.smack_lsm.o.d  -nostdinc -isystem
/usr/lib/gcc/x86_64-linux-gnu/4.7/include -I./arch/x86/include
-I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi
-I./arch/x86/include/generated/uapi -I./include/uapi
-I./include/generated/uapi -include ./include/linux/kconfig.h
-D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
-fno-strict-aliasing -fno-common -fshort-wchar
-Werror-implicit-function-declaration -Wno-format-security -std=gnu89
-fno-PIE -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64
-falign-jumps=1 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387
-mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time
-DCONFIG_X86_X32_ABI -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1
-DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1
-DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1
-DCONFIG_AS_SHA1_NI=1 -DCONFIG_AS_SHA256_NI=1 -pipe -Wno-sign-compare
-fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -O2
-Wno-maybe-uninitialized --param=allow-store-data-races=0
-DCC_HAVE_ASM_GOTO -Wframe-larger-than=1024 -fno-stack-protector
-Wno-unused-but-set-variable -fno-var-tracking-assignments -g
-gdwarf-4 -pg -mfentry -DCC_USING_FENTRY -Wdeclaration-after-statement
-Wno-pointer-sign -fno-strict-overflow -fconserve-stack
-Werror=implicit-int -Werror=strict-prototypes
-DKBUILD_BASENAME='"smack_lsm"'  -DKBUILD_MODNAME='"smack"' -c -o
security/smack/.tmp_smack_lsm.o security/smack/smack_lsm.c
   ./tools/objtool/objtool orc generate --no-fp  "security/smack/smack_lsm.o";
security/smack/smack_lsm.o: warning: objtool: elf_update: cannot write
data to file
  if [ "-pg" = "-pg" ]; then if [ security/smack/smack_lsm.o !=
"scripts/mod/empty.o" ]; then ./scripts/recordmcount
"security/smack/smack_lsm.o"; fi; fi;
  rm -f security/smack/smack.o; ar rcSTPD security/smack/smack.o
security/smack/smack_lsm.o security/smack/smack_access.o
security/smack/smackfs.o security/smack/smack_netfilter.o

This line looks suspicious:

   ./tools/objtool/objtool orc generate --no-fp  "security/smack/smack_lsm.o";

Is it really rewriting the file in place? That seems quite buggy to me.


Vegard
