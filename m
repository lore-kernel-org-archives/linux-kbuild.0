Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33490 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751064AbdFVFmo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jun 2017 01:42:44 -0400
Received: by mail-pf0-f195.google.com with SMTP id w12so1374274pfk.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jun 2017 22:42:44 -0700 (PDT)
Date: Thu, 22 Jun 2017 15:42:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kbuild:thin-ar 5/8] ia64-linux-ld: warning: .note.gnu.build-id
 section discarded, --build-id ignored.
Message-ID: <20170622154224.0322b356@roar.ozlabs.ibm.com>
In-Reply-To: <20170622143327.32177b0a@roar.ozlabs.ibm.com>
References: <201706221136.76FjJsv8%fengguang.wu@intel.com>
        <20170622143327.32177b0a@roar.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kbuild test robot <fengguang.wu@intel.com>
Cc: kbuild-all@01.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Alan Modra <amodra@gmail.com>

On Thu, 22 Jun 2017 14:33:27 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:

> On Thu, 22 Jun 2017 11:48:38 +0800
> kbuild test robot <fengguang.wu@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git thin-ar
> > head:   f9aac183deb53716ea92f528595758e3c9ef3539
> > commit: c5784ad98b773d08562a34b700e9c5e84763c0d8 [5/8] ia64: thin archives fix linking
> > config: ia64-allnoconfig (attached as .config)
> > compiler: ia64-linux-gcc (GCC) 6.2.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/01org/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         git checkout c5784ad98b773d08562a34b700e9c5e84763c0d8
> >         # save the attached .config to linux build tree
> >         make.cross ARCH=ia64 
> > 
> > All warnings (new ones prefixed by >>):
> >   
> > >> ia64-linux-ld: warning: .note.gnu.build-id section discarded, --build-id ignored.    
> 
> 
> Sigh.
> 
> What's happening here is that when performing the final link with the
> -R option, the linker forgets to emit the --build-id section it was
> asked to.
> 
> This is the final link command line that causes the error:
> 
> $ ia64-linux-ld -static -R arch/ia64/kernel/gate-syms.o --build-id -o vmlinux -T ./arch/ia64/kernel/vmlinux.lds --whole-archive built-in.o --no-whole-archive --start-group lib/lib.a arch/ia64/lib/lib.a --end-group
> 
> However it links successfully if I do this:
> 
> $ ia64-linux/bin/ia64-linux-ld -r -R arch/ia64/kernel/gate-syms.o -o syms.o
> $ ia64-linux/bin/ia64-linux-ld -static syms.o --build-id -o vmlinux -T ./arch/ia64/kernel/vmlinux.lds --whole-archive built-in.o --no-whole-archive --start-group lib/lib.a arch/ia64/lib/lib.a --end-group
> 
> I.e., create an intermediate object file with the symbols first using
> symbols from gate-syms.o, and use that in the final link rather than -R
> 
> Alan do you have any idea what the problem might be here?
> 
> If it turns out to be a toolchain bug or limitation, I can do the same
> workaround in the kernel.

Here is the fix for the kernel for ia64 (tile and sh would have to
follow).

This creates a .o file with the gate symbols and then that is used for
the final link input (rather than -R symbol file).  I think this is
actually the right way to go about it.

I'll resend new patches for the 3 archs unless there is another suggestion.

Thanks,
Nick

---
 arch/ia64/kernel/Makefile.gate | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/ia64/kernel/Makefile.gate b/arch/ia64/kernel/Makefile.gate
index a32903ada016..f89219e20b25 100644
--- a/arch/ia64/kernel/Makefile.gate
+++ b/arch/ia64/kernel/Makefile.gate
@@ -2,7 +2,9 @@
 
 targets += gate.so gate-syms.o
 
-extra-y += gate.so gate-syms.o gate.lds gate.o
+obj-y += gate-syms.o
+
+extra-y += gate.so gate.lds gate.o
 
 CPPFLAGS_gate.lds := -P -C -U$(ARCH)
 
@@ -14,14 +16,15 @@ GATECFLAGS_gate.so = -shared -s -Wl,-soname=linux-gate.so.1 \
 $(obj)/gate.so: $(obj)/gate.lds $(obj)/gate.o FORCE
 	$(call if_changed,gate)
 
-$(obj)/built-in.o: $(obj)/gate-syms.o
-$(obj)/built-in.o: ld_flags += -R $(obj)/gate-syms.o
+# create an object file to resolve gate symbols
+quiet_cmd_gate_syms = GATE    $@
+      cmd_gate_syms = $(LD) -r -T $(obj)/gate.lds -R $(obj)/gate.o -o$(obj)/gate-syms.o
 
-GATECFLAGS_gate-syms.o = -r
 $(obj)/gate-syms.o: $(obj)/gate.lds $(obj)/gate.o FORCE
-	$(call if_changed,gate)
+	$(call if_changed,gate_syms)
 
 # gate-data.o contains the gate DSO image as data in section .data..gate.
 # We must build gate.so before we can assemble it.
 # Note: kbuild does not track this dependency due to usage of .incbin
 $(obj)/gate-data.o: $(obj)/gate.so
+
-- 
2.11.0


