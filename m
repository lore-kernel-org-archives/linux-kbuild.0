Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgEEArm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 May 2020 20:47:42 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 681E6C061A0F
        for <linux-kbuild@vger.kernel.org>; Mon,  4 May 2020 17:47:42 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o18so235238pgg.8
        for <linux-kbuild@vger.kernel.org>; Mon, 04 May 2020 17:47:42 -0700 (PDT)
Date: Mon, 4 May 2020 17:47:38 -0700
From: Fangrui Song <maskray@google.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
Message-ID: <20200505004738.ew2lcp27c2n4jqia@google.com>
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
 <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>, Nick Desaulniers <nick.desaulniers@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>, Changbin Du <changbin.du@intel.com>, Randy Dunlap <rdunlap@infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>


On 2020-05-04, Sedat Dilek wrote:
>On Mon, May 4, 2020 at 5:13 AM Nick Desaulniers
><nick.desaulniers@gmail.com> wrote:
>>
>> As debug information gets larger and larger, it helps significantly save
>> the size of vmlinux images to compress the information in the debug
>> information sections. Note: this debug info is typically split off from
>> the final compressed kernel image, which is why vmlinux is what's used
>> in conjunction with GDB. Minimizing the debug info size should have no
>> impact on boot times, or final compressed kernel image size.
>>
>> All of the debug sections will have a `C` flag set.
>> $ readelf -S <object file>
>>
>> $ bloaty vmlinux.gcc75.compressed.dwarf4 -- \
>>     vmlinux.gcc75.uncompressed.dwarf4
>>
>>     FILE SIZE        VM SIZE
>>  --------------  --------------
>>   +0.0%     +18  [ = ]       0    [Unmapped]
>>  -73.3%  -114Ki  [ = ]       0    .debug_aranges
>>  -76.2% -2.01Mi  [ = ]       0    .debug_frame
>>  -73.6% -2.89Mi  [ = ]       0    .debug_str
>>  -80.7% -4.66Mi  [ = ]       0    .debug_abbrev
>>  -82.9% -4.88Mi  [ = ]       0    .debug_ranges
>>  -70.5% -9.04Mi  [ = ]       0    .debug_line
>>  -79.3% -10.9Mi  [ = ]       0    .debug_loc
>>  -39.5% -88.6Mi  [ = ]       0    .debug_info
>>  -18.2%  -123Mi  [ = ]       0    TOTAL
>>
>> $ bloaty vmlinux.clang11.compressed.dwarf4 -- \
>>     vmlinux.clang11.uncompressed.dwarf4
>>
>>     FILE SIZE        VM SIZE
>>  --------------  --------------
>>   +0.0%     +23  [ = ]       0    [Unmapped]
>>  -65.6%    -871  [ = ]       0    .debug_aranges
>>  -77.4% -1.84Mi  [ = ]       0    .debug_frame
>>  -82.9% -2.33Mi  [ = ]       0    .debug_abbrev
>>  -73.1% -2.43Mi  [ = ]       0    .debug_str
>>  -84.8% -3.07Mi  [ = ]       0    .debug_ranges
>>  -65.9% -8.62Mi  [ = ]       0    .debug_line
>>  -86.2% -40.0Mi  [ = ]       0    .debug_loc
>>  -42.0% -64.1Mi  [ = ]       0    .debug_info
>>  -22.1%  -122Mi  [ = ]       0    TOTAL
>>
>
>Hi Nick,
>
>thanks for the patch.
>
>I have slightly modified it to adapt to Linux v5.7-rc4 (what was your base?).
>
>Which linker did you use and has it an impact if you switch from
>ld.bfd to ld.lld?

lld has supported the linker option --compress-debug-sections=zlib since
about 5.0.0 (https://reviews.llvm.org/D31941)

>I tried a first normal run and in a 2nd one with
>CONFIG_DEBUG_INFO_COMPRESSED=y both with clang-10 and ld.lld-10.
>
>My numbers (sizes in MiB):
>
>[ diffconfig ]
>
>$ scripts/diffconfig /boot/config-5.7.0-rc4-1-amd64-clang
>/boot/config-5.7.0-rc4-2-amd64-clang
> BUILD_SALT "5.7.0-rc4-1-amd64-clang" -> "5.7.0-rc4-2-amd64-clang"
>+DEBUG_INFO_COMPRESSED y
>
>[ compiler and linker ]
>
>$ clang-10 -v
>ClangBuiltLinux clang version 10.0.1
>(https://github.com/llvm/llvm-project
>92d5c1be9ee93850c0a8903f05f36a23ee835dc2)
>Target: x86_64-unknown-linux-gnu
>Thread model: posix
>InstalledDir: /home/dileks/src/llvm-toolchain/install/bin
>Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/10
>Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/8
>Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/9
>Selected GCC installation: /usr/lib/gcc/x86_64-linux-gnu/10
>Candidate multilib: .;@m64
>Candidate multilib: 32;@m32
>Candidate multilib: x32;@mx32
>Selected multilib: .;@m64
>
>$ ld.lld-10 -v
>LLD 10.0.1 (https://github.com/llvm/llvm-project
>92d5c1be9ee93850c0a8903f05f36a23ee835dc2) (compatible with GNU
>linkers)
>
>[ sizes vmlinux ]
>
>$ du -m 5.7.0-rc4-*/vmlinux*
>409     5.7.0-rc4-1-amd64-clang/vmlinux
>7       5.7.0-rc4-1-amd64-clang/vmlinux.compressed
>404     5.7.0-rc4-1-amd64-clang/vmlinux.o
>324     5.7.0-rc4-2-amd64-clang/vmlinux
>7       5.7.0-rc4-2-amd64-clang/vmlinux.compressed
>299     5.7.0-rc4-2-amd64-clang/vmlinux.o
>
>[ readelf (.debug_info as example) ]
>
>$ readelf -S vmlinux.o
>  [33] .debug_info       PROGBITS         0000000000000000  01d6a5e8
>       0000000006be1ee6  0000000000000000           0     0     1
>
>$ readelf -S vmlinux.o
>  [33] .debug_info       PROGBITS         0000000000000000  01749f18
>       0000000002ef04d2  0000000000000000   C       0     0     1 <---
>XXX: "C (compressed)" Flag
>
>Key to Flags:
>  W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
>  L (link order), O (extra OS processing required), G (group), T (TLS),
>  C (compressed), x (unknown), o (OS specific), E (exclude),
>  l (large), p (processor specific)
>
>[ sizes linux-image debian packages ]
>
>$ du -m 5.7.0-rc4-*/linux-image*.deb
>47      5.7.0-rc4-1-amd64-clang/linux-image-5.7.0-rc4-1-amd64-clang_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
>424     5.7.0-rc4-1-amd64-clang/linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
>47      5.7.0-rc4-2-amd64-clang/linux-image-5.7.0-rc4-2-amd64-clang_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
>771     5.7.0-rc4-2-amd64-clang/linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
>
>[ sizes linux-git dir (compilation finished ]
>
>5.7.0-rc4-1-amd64-clang: 17963   /home/dileks/src/linux-kernel/linux
>5.7.0-rc4-2-amd64-clang: 14328   /home/dileks/src/linux-kernel/linux
>
>[ xz compressed linux-image-dbg packages ]
>
>$ file linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
>linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb:
>Debian binary package (format 2.0), with control.tar.xz, data
>compression xz
>$ file linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
>linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb:
>Debian binary package (format 2.0), with control.tar.xz, data
>compression xz
>
>[ file-lists ]
>
>$ dpkg --contents
>linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
>| wc -l
>4395
>$ dpkg --contents
>linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
>| wc -l
>4395
>
>[ file-lists vmlinux ]
>
>$ dpkg --contents
>linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
>| grep vmlinux
>-rwxr-xr-x root/root 428588312 2020-05-04 06:15
>./usr/lib/debug/lib/modules/5.7.0-rc4-1-amd64-clang/vmlinux
>lrwxrwxrwx root/root         0 2020-05-04 06:15
>./usr/lib/debug/boot/vmlinux-5.7.0-rc4-1-amd64-clang ->
>../lib/modules/5.7.0-rc4-1-amd64-clang/vmlinux
>lrwxrwxrwx root/root         0 2020-05-04 06:15
>./usr/lib/debug/vmlinux-5.7.0-rc4-1-amd64-clang ->
>lib/modules/5.7.0-rc4-1-amd64-clang/vmlinux
>
>$ dpkg --contents
>linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
>| grep vmlinux
>-rwxr-xr-x root/root 339341456 2020-05-04 12:24
>./usr/lib/debug/lib/modules/5.7.0-rc4-2-amd64-clang/vmlinux
>lrwxrwxrwx root/root         0 2020-05-04 12:24
>./usr/lib/debug/boot/vmlinux-5.7.0-rc4-2-amd64-clang ->
>../lib/modules/5.7.0-rc4-2-amd64-clang/vmlinux
>lrwxrwxrwx root/root         0 2020-05-04 12:24
>./usr/lib/debug/vmlinux-5.7.0-rc4-2-amd64-clang ->
>lib/modules/5.7.0-rc4-2-amd64-clang/vmlinux
>
>[ conclusion ]
>
>As you can see there is a size-reduction in case of vmlinux/vmlinux.o
>(debug) files...
>...and my linux-git directory in total is smaller: 17963M vs. 14328M.
>
>But the resulting linux-image-dbg file is much fatter: 424M vs. 711M.
>XZ-compressing the gz/zlib-compressed vmlinux (debug) file results in
>a fatter linux-image-dbg package.
>
>For a usage of vmlinux (debug) in a VM scenario this might be nice but
>seen from a debian repository perspective not.
>
>For the sake of completeness:  I have just installed and booted the
>"normal" linux-image debian package - not the debug packages.
>
>Thanks.
>
>Regards,
>- Sedat -
>
>> Suggested-by: David Blaikie <blakie@google.com>
>> Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
>> ---
>>  Makefile          | 5 +++++
>>  lib/Kconfig.debug | 9 +++++++++
>>  2 files changed, 14 insertions(+)
>>
>> diff --git a/Makefile b/Makefile
>> index 981eb902384b..313a054e5dc6 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -825,6 +825,11 @@ ifdef CONFIG_DEBUG_INFO_REDUCED
>>  DEBUG_CFLAGS   += $(call cc-option, -femit-struct-debug-baseonly) \
>>                    $(call cc-option,-fno-var-tracking)
>>  endif
>> +
>> +ifdef CONFIG_DEBUG_INFO_COMPRESSED
>> +DEBUG_CFLAGS   += -gz=zlib
>> +KBUILD_LDFLAGS += --compress-debug-sections=zlib
>> +endif
>>  endif
>>
>>  KBUILD_CFLAGS += $(DEBUG_CFLAGS)
>> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>> index f6f9a039f736..1f4a47ba6c1b 100644
>> --- a/lib/Kconfig.debug
>> +++ b/lib/Kconfig.debug
>> @@ -213,6 +213,15 @@ config DEBUG_INFO_REDUCED
>>           DEBUG_INFO build and compile times are reduced too.
>>           Only works with newer gcc versions.
>>
>> +config DEBUG_INFO_COMPRESSED
>> +       bool "Compressed debugging information"
>> +       depends on DEBUG_INFO
>> +       depends on $(cc-option,-gz=zlib)
>> +       depends on $(ld-option,--compress-debug-sections=zlib)
>> +       help
>> +         Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
>> +         5.0+.
>> +

linker option --compress-debug-sections=zlib require binutils >= 2.26 (ld-option)
Assembler option --compress-debug-sections=zlib also require binutils >= 2.26 (cc-option,-gz=zlib)

>>  config DEBUG_INFO_SPLIT
>>         bool "Produce split debuginfo in .dwo files"
>>         depends on DEBUG_INFO
>> --
>> 2.17.1
>>
>> --
>> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200504031340.7103-1-nick.desaulniers%40gmail.com.
>
>-- 
>You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CA%2BicZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw%40mail.gmail.com.
