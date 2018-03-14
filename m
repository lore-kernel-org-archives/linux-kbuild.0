Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f170.google.com ([209.85.220.170]:42265 "EHLO
        mail-qk0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933180AbeCNBnQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Mar 2018 21:43:16 -0400
Received: by mail-qk0-f170.google.com with SMTP id b198so1843678qkg.9
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Mar 2018 18:43:15 -0700 (PDT)
Date: Tue, 13 Mar 2018 21:43:13 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: Intermittent build failure with TRIM_UNUSED_KSYMS and related
 problems
In-Reply-To: <4bbfeb74-c912-74e5-4f4d-287ec7ad065d@gmail.com>
Message-ID: <nycvar.YSQ.7.76.1803131922060.28583@knanqh.ubzr>
References: <ccedea72-0e61-500c-86e5-976ecb5cefb5@gmail.com> <CAK7LNAS9rOhyEdSUBbhPVW572437w5g7zLqMGSHn4gg3nbCU_g@mail.gmail.com> <nycvar.YSQ.7.76.1803121331280.28583@knanqh.ubzr> <4bbfeb74-c912-74e5-4f4d-287ec7ad065d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1587523510-1520987738=:28583"
Content-ID: <nycvar.YSQ.7.76.1803132115400.28583@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Lindroth <thomas.lindroth@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1587523510-1520987738=:28583
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-ID: <nycvar.YSQ.7.76.1803132115401.28583@knanqh.ubzr>

On Tue, 13 Mar 2018, Thomas Lindroth wrote:

> I'm guessing you meant these:
>     $(wildcard include/config/ksym/pci/user/read/config/byte.h) \
>     $(wildcard include/config/ksym/pci/user/read/config/word.h) \
>     $(wildcard include/config/ksym/pci/user/read/config/dword.h) \
>     $(wildcard include/config/ksym/pci/user/write/config/byte.h) \
>     $(wildcard include/config/ksym/pci/user/write/config/word.h) \
>     $(wildcard include/config/ksym/pci/user/write/config/dword.h) \
> 
> They exist but most of the corresponding files like
> include/config/ksym/pci/user/read/config/byte.h do not.
> I guess that's normal since vfio is built into the kernel and no other
> module use those exports. They should get trimmed and include/config/ksym
> entries don't exist for trimmed symbols?

They could exist if those symbols neededto be exported in a previous 
build. In fact, what those files do is only holding a timestamp. When 
scripts/adjust_autoksyms.sh determines that some symbol changes state 
(newly needed or no longer needed) then the corresponding file is 
touched to update its timestamp to trigger the rebuild of affected 
source files whose dependency list contains that timestamp files. What 
those .o.cmd files contain is the actual dependency list.

> I don't have the build directory for that failure any more but I ran some more builds
> until I got a build failure like this:
> ERROR: "clear_user" [drivers/media/v4l2-core/videodev.ko] undefined!
> ERROR: "__clear_user" [arch/x86/kvm/kvm.ko] undefined!
> 
> Those missing exports are part of arch/x86/lib/usercopy_64.c and the relevant ksym parts
> of arch/x86/lib/.usercopy_64.o.cmd look like this:
>     $(wildcard include/config/ksym///clear/user.h) \
>     $(wildcard include/config/ksym/clear/user.h) \
>     $(wildcard include/config/ksym/arch/wb/cache/pmem.h) \
>     $(wildcard include/config/ksym/memcpy/flushcache.h) \

So the dependency list is fine.

> That's identical to how it looks when the build succeeds.

Therefore the problem isn't there.

> $ ls --full-time linux-fail/include/config/ksym///clear/user.h
> -rw-r--r-- 1 cocobo cocobo 0 2018-03-13 17:16:53.000000000 +0100 linux-fail/include/config/ksym///clear/user.h
> 
> $ ls --full-time linux-fail/vmlinux.o 
> -rw-r--r-- 1 cocobo cocobo 545613144 2018-03-13 17:20:57.000000000 +0100 linux-fail/vmlinux.o
> 
> Looks fine.
>  
> > If so then verify that include/generated/autoksyms.h has the 
> > corresponding defines:
> > 
> > $ grep __put_user_ include/generated/autoksyms.h
> > #define __KSYM___put_user_1 1
> > #define __KSYM___put_user_2 1
> > #define __KSYM___put_user_4 1
> > #define __KSYM___put_user_8 1
> 
> linux-fail/include/generated/autoksyms.h:
> #define __KSYM___clear_user 1
> #define __KSYM_clear_user 1
> 
> That file's content is also identical to how it looks when the build succeeds.

Now, what's the date of include/generated/autoksyms.h compared to 
arch/x86/lib/usercopy_64.o?

If include/generated/autoksyms.h is older than 
arch/x86/lib/usercopy_64.o then the presence of __KSYM_clear_user in the 
former should have instanciated the corresponding EXPORT_SYMBOL() in the 
later.

If it is the other way around then you should compare the time for 
arch/x86/lib/usercopy_64.o against include/config/ksym///clear/user.h. 
If the later is newer than the former then something failed to notice 
that usercopy_64.o wasn't up to date, in which case the makefile or make 
itself might need some investigation.

If not then we'd have to look in the full build log to figure out if 
__KSYM_clear_user existed in the previous version of 
include/generated/autoksyms.h before it was refreshed by 
adjust_autoksyms.sh. If it was then we're back to if #1 above. If not 
then the timestamp for include/config/ksym///clear/user.h hasn't been 
updated as it should.

> > Also... is the build always failing because of symbols starting with one 
> > or more underscores?
> 
> The type of failures I've seen so far are:
> 
> ERROR: "clear_user" [drivers/media/v4l2-core/videodev.ko] undefined!
> ERROR: "__clear_user" [arch/x86/kvm/kvm.ko] undefined!
> 
> ERROR: "__fill_rsb" [arch/x86/kvm/kvm-intel.ko] undefined!
> 
> ERROR: "__put_user_2" [net/ipv4/netfilter/ip_tables.ko] undefined!
> ERROR: "__put_user_2" [net/ipv4/netfilter/arp_tables.ko] undefined!
> ERROR: "__put_user_8" [fs/udf/udf.ko] undefined!
> ERROR: "__put_user_4" [fs/udf/udf.ko] undefined!
> ERROR: "__put_user_8" [fs/fat/fat.ko] undefined!
> ERROR: "__put_user_1" [fs/fat/fat.ko] undefined!
> ERROR: "__put_user_4" [fs/fat/fat.ko] undefined!
> ERROR: "__put_user_2" [fs/fat/fat.ko] undefined!
> ERROR: "__put_user_4" [drivers/net/tap.ko] undefined!
> ERROR: "__put_user_2" [drivers/net/tap.ko] undefined!
> ERROR: "__put_user_8" [drivers/media/v4l2-core/videodev.ko] undefined!
> ERROR: "__put_user_1" [drivers/media/v4l2-core/videodev.ko] undefined!
> ERROR: "__put_user_4" [drivers/media/v4l2-core/videodev.ko] undefined!
> ERROR: "__put_user_8" [drivers/input/joydev.ko] undefined!
> ERROR: "__put_user_1" [drivers/input/joydev.ko] undefined!
> ERROR: "__put_user_4" [drivers/input/joydev.ko] undefined!
> ERROR: "__fill_rsb" [arch/x86/kvm/kvm-intel.ko] undefined!
> 
> There might have been others but I didn't save every error message.

Maybe it is just a coincidence, but there is a lot of underscore 
prefixed symbols in that list, except for one case. This translates to 
successive / in the path for the timestamp file. And that one case that 
doesn't fit the pattern does actually aliases a path that does. I wonder 
if the filesystem cache could get confused by successive / in paths 
here, given the non deterministic nature of the build failure you get. 

Could you please test with the following patch to validate this 
hypothesis:

diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
index 513da1a4a2..2205114add 100755
--- a/scripts/adjust_autoksyms.sh
+++ b/scripts/adjust_autoksyms.sh
@@ -79,6 +79,7 @@ changed=$(
 count=0
 sort "$cur_ksyms_file" "$new_ksyms_file" | uniq -u |
 sed -n 's/^#define __KSYM_\(.*\) 1/\1/p' | tr "A-Z_" "a-z/" |
+sed -e 's|//*|/|g' -e 's|^/||' |
 while read sympath; do
 	if [ -z "$sympath" ]; then continue; fi
 	depfile="include/config/ksym/${sympath}.h"
diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index 449b68c4c9..57ae789f91 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -115,7 +115,7 @@ static void usage(void)
  */
 static void print_config(const char *m, int slen)
 {
-	int c, i;
+	int c, prev_c = '/', i;
 
 	printf("    $(wildcard include/config/");
 	for (i = 0; i < slen; i++) {
@@ -124,7 +124,9 @@ static void print_config(const char *m, int slen)
 			c = '/';
 		else
 			c = tolower(c);
-		putchar(c);
+		if (c != '/' || prev_c != '/')
+			putchar(c);
+		prev_c = c;
 	}
 	printf(".h) \\\n");
 }

That would be very interesting if this patch fixed your build failures.

> I patched the kernel with "kbuild: show the list of exported symbols with V=1 for TRIM_UNUSED_KSYMS"
> and ran the build with V=1 until I got a failure. Here is the full output:
> 
> success: https://gist.githubusercontent.com/anonymous/86325ce634568f1e1d31c23b5b9df295/raw/a897c77f34499a990505057f0221b4a935db4a16/gistfile1.txt
> fail: https://gist.githubusercontent.com/anonymous/279a7925f1a8cd05dcad78dca0720688/raw/9e407b262fdac284b15ae07f2d7a7824051d56cc/gistfile1.txt
> 
> The error was:
> ERROR: "clear_user" [drivers/media/v4l2-core/videodev.ko] undefined!
> ERROR: "__clear_user" [arch/x86/kvm/kvm.ko] undefined!
> 
> and the relevant part of the diff of the build:
> 
> --- kernel_build_debug_patch_success    2018-03-13 14:47:24.000000000 +0100
> +++ kernel_build_debug_patch_fail       2018-03-13 15:12:33.000000000 +0100
> @@ -45298,13 +45298,6 @@
>  KSYM___x86_indirect_thunk_r15
>  KSYM___fill_rsb
>  KSYM___clear_rsb
> -  gcc -Wp,-MD,arch/x86/lib/.usercopy_64.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-pc-linux-gnu/6.4.0/include -I./arch/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -fshort-wchar -Werror-implicit-function-declaration -Wno-format-security -std=gnu89 -fno-PIE -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -m64 -falign-jumps=1 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387 -mpreferred-stack-boundary=3 -mskip-rax-setup -march=core2 -mno-red-zone -mcmodel=kernel -funit-at-a-time -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -DCONFIG_AS_AVX512=1 -DCONFIG_AS_SHA1_NI=1 -DCONFIG_AS_SHA256_NI=1 -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables -fno-delete-null-pointer-checks -Wno-frame-address -O2 --param=allow-store-data-races=0 -DCC_HAVE_ASM_GOTO -fplugin=./scripts/gcc-plugins/latent_entropy_plugin.so -fplugin=./scripts/gcc-plugins/structleak_plugin.so -DLATENT_ENTROPY_PLUGIN -fplugin-arg-structleak_plugin-byref-all -DSTRUCTLEAK_PLUGIN -Wframe-larger-than=1024 -fstack-protector-strong -Wno-unused-but-set-variable -Wno-unused-const-variable -fno-var-tracking-assignments -g -pg -mfentry -DCC_USING_FENTRY -fno-inline-functions-called-once -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fno-stack-check -fconserve-stack -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time -Werror=incompatible-pointer-types -Werror=designated-init    -DKBUILD_BASENAME='"usercopy_64"'  -DKBUILD_MODNAME='"usercopy_64"' -c -o arch/x86/lib/usercopy_64.o arch/x86/lib/usercopy_64.c
> -KSYM___clear_user
> -KSYM_clear_user
> -KSYM_arch_wb_cache_pmem
> -KSYM_memcpy_flushcache
> -   ./tools/objtool/objtool orc generate --no-fp  "arch/x86/lib/usercopy_64.o";
> -  if [ "-pg" = "-pg" ]; then if [ arch/x86/lib/usercopy_64.o != "scripts/mod/empty.o" ]; then ./scripts/recordmcount  "arch/x86/lib/usercopy_64.o"; fi; fi;
>    rm -f arch/x86/lib/lib.a; ar rcsTPD arch/x86/lib/lib.a arch/x86/lib/clear_page_64.o arch/x86/lib/cmdline.o arch/x86/lib/cmpxchg16b_emu.o arch/x86/lib/copy_page_64.o arch/x86/lib/copy_user_64.o arch/x86/lib/cpu.o arch/x86/lib/csum-copy_64.o arch/x86/lib/csum-partial_64.o arch/x86/lib/csum-wrappers_64.o arch/x86/lib/delay.o arch/x86/lib/getuser.o arch/x86/lib/inat.o arch/x86/lib/insn.o arch/x86/lib/kaslr.o arch/x86/lib/memcpy_64.o arch/x86/lib/memmove_64.o arch/x86/lib/memset_64.o arch/x86/lib/misc.o arch/x86/lib/putuser.o arch/x86/lib/retpoline.o arch/x86/lib/rwsem.o arch/x86/lib/usercopy.o arch/x86/lib/usercopy_64.o
>    objdump -h arch/x86/lib/lib.a | sed -ne '/___ksymtab/s/.*+\([^ ]*\).*/EXTERN(\1)/p' >arch/x86/lib/.lib-ksyms.o.lds; rm -f arch/x86/lib/.lib_exports.o; echo | gcc -Wp,-MD,arch/x86/lib/.lib-ksyms.o.d  -nostdinc -isystem /usr/lib/gcc/x86_64-pc-linux-gnu/6.4.0/include -I./arch/x86/include -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi -I./include/uapi -I./include/generated/uapi -include ./include/linux/kconfig.h -D__KERNEL__ -D__ASSEMBLY__ -fno-PIE -m64 -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1 -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1 -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1 -DCONFIG_AS_AVX512=1 -DCONFIG_AS_SHA1_NI=1 -DCONFIG_AS_SHA256_NI=1 -DCC_HAVE_ASM_GOTO -Wa,-gdwarf-2 -mfentry -DCC_USING_FENTRY   -c -o arch/x86/lib/.lib_exports.o -x assembler -; ld -m elf_x86_64   -r -o arch/x86/lib/lib-ksyms.o -T arch/x86/lib/.lib-ksyms.o.lds arch/x86/lib/.lib_exports.o; rm arch/x86/lib/.lib_exports.o arch/x86/lib/.lib-ksyms.o.lds
>     rm -f arch/x86/lib/built-in.o; ar rcSTPD arch/x86/lib/built-in.o arch/x86/lib/msr-smp.o arch/x86/lib/cache-smp.o arch/x86/lib/msr.o arch/x86/lib/msr-reg.o arch/x86/lib/msr-reg-export.o arch/x86/lib/hweight.o arch/x86/lib/iomap_copy_64.o arch/x86/lib/lib-ksyms.o ; scripts/mod/modpost arch/x86/lib/built-in.o

That's it: usercopy_64.o not being rebuilt as it should, despite this on 
line 25369 of your log:

++ touch include/config/ksym///clear/user.h

Or this on line 28057:

++ touch include/config/ksym/clear/user.h

But since all the other failure cases implied symbols with "__" 
prefixes, I bet that the "clear_user" shows up only because it aliases 
"__clear_user".


Nicolas
--8323328-1587523510-1520987738=:28583--
