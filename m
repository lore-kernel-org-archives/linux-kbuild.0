Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from 13.mo1.mail-out.ovh.net ([178.33.253.128]:52611 "EHLO
	mo1.mail-out.ovh.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753828Ab2GWRYm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Jul 2012 13:24:42 -0400
Received: from mail94.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 4D5FDFF9835
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Jul 2012 11:10:50 +0200 (CEST)
Date: Mon, 23 Jul 2012 11:05:43 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: Re: [PATCH 6/7] compressed: rename barebox target to zbarebox and
 zbarebox.bin
Message-ID: <20120723090543.GR22657@game.jcrosoft.org>
References: <20120723042052.GK22657@game.jcrosoft.org>
 <1343017563-27932-1-git-send-email-plagnioj@jcrosoft.com>
 <1343017563-27932-6-git-send-email-plagnioj@jcrosoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1343017563-27932-6-git-send-email-plagnioj@jcrosoft.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: barebox@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

Hi Sam,

	I put the linux-kbuild ml as in barebox we use the kbuild system

	we are adding the compressed image support to barebox

	but we have some trouble to integrate it correctly in the kbuild
	system

	we have file needed by the decompressor store arround the source code

	arch/<arch>/boards/<baord>/
	arch/<arch>/mach-<mach>/

	the idea was to introduce a new target called comp-y => build-comp.o
	that will be build acrros the tree and then we do the finally link in
	the main Makefile

	Could you help us to archive it or do have an other way to do so

Best Regards,
J.
On 06:26 Mon 23 Jul     , Jean-Christophe PLAGNIOL-VILLARD wrote:
> Today we link to whole barebox and rely on gcc to cleanup via it's garbage
> collector.
> Now we specify only what is needed and introduce a new directory with source
> only related to the compressed target.
> 
> Build it in arch/<arm>/compressed
> Rebuild all the needed object.
> 
> Keep the previous target untouched.
> This fix the modules support and allow custom flags for each file.
> 
> Import string functions from linux 3.4 (arch/arm/boot/compressed/string.c) and
> implement a dummy panic.
> 
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> ---
>  Makefile                          |   37 ++---------
>  arch/arm/Makefile                 |    9 ++-
>  arch/arm/compressed/Makefile      |   69 ++++++++++++++++++++
>  arch/arm/compressed/barebox.lds.S |   70 ++++++++++++++++++++
>  arch/arm/compressed/piggy.lzo.S   |    6 ++
>  arch/arm/cpu/start.c              |   41 +++++++-----
>  compressed/misc.c                 |   14 ++++
>  compressed/string.c               |  127 +++++++++++++++++++++++++++++++++++++
>  piggy.lzo.S                       |    6 --
>  9 files changed, 323 insertions(+), 56 deletions(-)
>  create mode 100644 arch/arm/compressed/Makefile
>  create mode 100644 arch/arm/compressed/barebox.lds.S
>  create mode 100644 arch/arm/compressed/piggy.lzo.S
>  create mode 100644 compressed/misc.c
>  create mode 100644 compressed/string.c
>  delete mode 100644 piggy.lzo.S
> 
> diff --git a/Makefile b/Makefile
> index 0b3da03..46c9491 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -512,7 +512,6 @@ common-y	:= $(patsubst %/, %/built-in.o, $(common-y))
>  barebox-common := $(common-y)
>  barebox-all    := $(barebox-common)
>  barebox-lds    := $(lds-y)
> -barebox-compressed-lds    := $(lds-compressed-y)
>  
>  # Rule to link barebox
>  # May be overridden by arch/$(ARCH)/Makefile
> @@ -668,11 +667,12 @@ quiet_cmd_objcopy = OBJCOPY $@
>        cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>  
>  OBJCOPYFLAGS_barebox.bin = -O binary
> -OBJCOPYFLAGS_barebox-uncompressed.bin = -O binary
>  
>  barebox.bin: barebox FORCE
>  	$(call if_changed,objcopy)
> +ifndef CONFIG_IMAGE_COMPRESSION
>  	$(call cmd,check_file_size,$(CONFIG_BAREBOX_MAX_IMAGE_SIZE))
> +endif
>  
>  ifdef CONFIG_X86
>  barebox.S: barebox
> @@ -702,41 +702,13 @@ quiet_cmd_disasm = DISASM  $@
>  
>  barebox.S: barebox FORCE
>  	$(call if_changed,disasm)
> -barebox-uncompressed.S: barebox-uncompressed FORCE
> -	$(call if_changed,disasm)
>  endif
>  
>  # barebox image
> -barebox-uncompressed: $(barebox-lds) $(barebox-head) $(barebox-common) $(kallsyms.o)
> -	$(call barebox-modpost)
> -	$(call if_changed_rule,barebox__)
> -	$(Q)rm -f .old_version
> -
> -barebox-uncompressed.bin: barebox-uncompressed
> -	$(call if_changed,objcopy)
> -
> -suffix_$(CONFIG_IMAGE_COMPRESSION_LZO)	= lzo
> -
> -barebox-uncompressed.bin.lzo: barebox-uncompressed.bin
> -	@echo "  LZO    " $@
> -	$(Q)lzop -f -9 -o $@ barebox-uncompressed.bin
> -
> -piggy.$(suffix_y).o: barebox-uncompressed.bin.$(suffix_y) $(src)/piggy.$(suffix_y).S
> -	@echo "  CC     " $@
> -	$(Q)$(CC) $(CFLAGS) $(CPPFLAGS) -c $(src)/piggy.$(suffix_y).S -o $@
> -
> -ifdef CONFIG_IMAGE_COMPRESSION
> -barebox: piggy.$(suffix_y).o
> -	@echo "  LD     " $@
> -	$(Q)$(LD) $(LDFLAGS) $(LDFLAGS_barebox) -o $@ \
> -		-T $(barebox-compressed-lds) \
> -		--start-group $(barebox-common) piggy.$(suffix_y).o --end-group
> -else
>  barebox: $(barebox-lds) $(barebox-head) $(barebox-common) $(kallsyms.o) FORCE
>  	$(call barebox-modpost)
>  	$(call if_changed_rule,barebox__)
>  	$(Q)rm -f .old_version
> -endif
>  
>  barebox.srec: barebox
>  	$(OBJCOPY) -O srec $< $@
> @@ -1031,11 +1003,10 @@ endif # CONFIG_MODULES
>  # Directories & files removed with 'make clean'
>  CLEAN_DIRS  += $(MODVERDIR)
>  CLEAN_FILES +=	barebox System.map include/generated/barebox_default_env.h \
> -                .tmp_version .tmp_barebox* barebox.bin barebox.map barebox.S \
> +                .tmp_version .tmp_barebox* barebox.* \
>  		.tmp_kallsyms* barebox_default_env* barebox.ldr \
>  		scripts/bareboxenv-target \
> -		Doxyfile.version barebox.srec barebox.s5p \
> -		barebox-uncompressed barebox-uncompressed.bin barebox-uncompressed.bin.lzo
> +		Doxyfile.version barebox.srec barebox.s5p
>  
>  # Directories & files removed with 'make mrproper'
>  MRPROPER_DIRS  += include/config include2 usr/include
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index a93c4d5..647c536 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -184,6 +184,14 @@ ifeq ($(CONFIG_OMAP_BUILD_IFT),y)
>  KBUILD_IMAGE := MLO
>  endif
>  
> +ifdef CONFIG_IMAGE_COMPRESSION
> +KBUILD_IMAGE := zbarebox.bin
> +endif
> +
> +comp := arch/arm/compressed
> +zbarebox.S zbarebox.bin zbarebox: barebox.bin
> +	$(Q)$(MAKE) $(build)=$(comp) $(comp)/$@
> +
>  all: $(KBUILD_IMAGE)
>  
>  archprepare: maketools
> @@ -208,6 +216,5 @@ common-y += $(BOARD) $(MACH)
>  common-y += arch/arm/lib/ arch/arm/cpu/
>  
>  lds-y	:= arch/arm/lib/barebox.lds
> -lds-compressed-y := arch/arm/lib/barebox-compressed.lds
>  
>  CLEAN_FILES += include/generated/mach-types.h arch/arm/lib/barebox.lds
> diff --git a/arch/arm/compressed/Makefile b/arch/arm/compressed/Makefile
> new file mode 100644
> index 0000000..627a411
> --- /dev/null
> +++ b/arch/arm/compressed/Makefile
> @@ -0,0 +1,69 @@
> +
> +suffix_$(CONFIG_IMAGE_COMPRESSION_LZO)	= lzo
> +
> +OBJCOPYFLAGS_zbarebox.bin = -O binary
> +
> +targets := zbarebox zbarebox.bin zbarebox.S \
> +	   piggy.$(suffix_y) piggy.$(suffix_y).o \
> +	   lib1funcs.o lib1funcs.S ashldi3.o ashldi3.S \
> +	   misc.o string.o start.o
> +
> +# Make sure files are removed during clean
> +extra-y       += piggy.gzip piggy.lzo piggy.lzma piggy.xzkern \
> +		 lib1funcs.S ashldi3.S start.c string.c misc.c
> +
> +$(obj)/zbarebox.bin:	$(obj)/zbarebox FORCE
> +	$(call if_changed,objcopy)
> +	$(call cmd,check_file_size,$(CONFIG_BAREBOX_MAX_IMAGE_SIZE))
> +	@echo '  Barebox: $@ is ready'
> +
> +$(obj)/zbarebox.S: $(obj)/zbarebox FORCE
> +	$(call if_changed,disasm)
> +
> +# For __aeabi_uidivmod
> +lib1funcs = $(obj)/lib1funcs.o
> +
> +$(obj)/lib1funcs.S: $(srctree)/arch/$(SRCARCH)/lib/lib1funcs.S
> +	$(call cmd,shipped)
> +
> +CFLAGS_start.o = -D CONFIG_COMPRESSOR
> +start= $(obj)/start.o
> +$(obj)/start.c: $(srctree)/arch/$(SRCARCH)/cpu/start.c
> +	$(call cmd,shipped)
> +
> +string= $(obj)/string.o
> +$(obj)/string.c: $(srctree)/compressed/string.c
> +	$(call cmd,shipped)
> +
> +misc= $(obj)/misc.o
> +$(obj)/misc.c: $(srctree)/compressed/misc.c
> +	$(call cmd,shipped)
> +
> +# For __aeabi_llsl
> +ashldi3 = $(obj)/ashldi3.o
> +
> +$(obj)/ashldi3.S: $(srctree)/arch/$(SRCARCH)/lib/ashldi3.S
> +	$(call cmd,shipped)
> +
> +# For __div0
> +div0 = $(obj)/div0.o
> +
> +$(obj)/div0.c: $(srctree)/arch/$(SRCARCH)/lib/div0.c
> +	$(call cmd,shipped)
> +
> +LDFLAGS_zbarebox	:= -Map zbarebox.map
> +comp := $(obj)/piggy.$(suffix_y).o \
> +	$(lib1funcs) $(ashldi3) $(start) $(string) $(misc) $(div0)
> +
> +$(obj)/zbarebox: $(obj)/barebox.lds $(comp) FORCE
> +	@echo "  LD     " $@
> +	$(Q)$(LD) $(LDFLAGS) $(LDFLAGS_zbarebox) -o $@ \
> +		-T $(obj)/barebox.lds \
> +		--start-group $(comp) --end-group
> +
> +$(obj)/piggy.$(suffix_y): $(obj)/../../../barebox.bin FORCE
> +	$(call if_changed,$(suffix_y))
> +
> +$(obj)/piggy.$(suffix_y).o:  $(obj)/piggy.$(suffix_y) FORCE
> +
> +$(obj)/barebox.lds: $(obj)/barebox.lds.S
> diff --git a/arch/arm/compressed/barebox.lds.S b/arch/arm/compressed/barebox.lds.S
> new file mode 100644
> index 0000000..809e567
> --- /dev/null
> +++ b/arch/arm/compressed/barebox.lds.S
> @@ -0,0 +1,70 @@
> +/*
> + * (C) Copyright 2012 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
> + *
> + * See file CREDITS for list of people who contributed to this
> + * project.
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License as
> + * published by the Free Software Foundation; either version 2 of
> + * the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> + * MA 02111-1307 USA
> + *
> + */
> +
> +#include <asm-generic/barebox.lds.h>
> +#include <asm-generic/memory_layout.h>
> +
> +OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
> +OUTPUT_ARCH(arm)
> +ENTRY(compressed_start)
> +SECTIONS
> +{
> +	. = HEAD_TEXT_BASE;
> +
> +	PRE_IMAGE
> +
> +	. = ALIGN(4);
> +	.text      :
> +	{
> +		_stext = .;
> +		_text = .;
> +		*(.text_head_entry*)
> +		__ll_return = .;
> +		*(.text_ll_return*)
> +		__bare_init_start = .;
> +		*(.text_bare_init*)
> +		__bare_init_end = .;
> +		*(.text*)
> +	}
> +	BAREBOX_BARE_INIT_SIZE
> +
> +	. = ALIGN(4);
> +	.rodata : { *(.rodata*) }
> +
> +	_etext = .;			/* End of text and rodata section */
> +
> +	. = ALIGN(4);
> +	.piggydata : {
> +		*(.piggydata)
> +	}
> +
> +	. = ALIGN(4);
> +	.data : { *(.data*) }
> +
> +	. = ALIGN(4);
> +	__bss_start = .;
> +	.bss : { *(.bss*) }
> +	__bss_stop = .;
> +	_end = .;
> +	_barebox_image_size = __bss_start - HEAD_TEXT_BASE;
> +}
> diff --git a/arch/arm/compressed/piggy.lzo.S b/arch/arm/compressed/piggy.lzo.S
> new file mode 100644
> index 0000000..0c0d216
> --- /dev/null
> +++ b/arch/arm/compressed/piggy.lzo.S
> @@ -0,0 +1,6 @@
> +	.section .piggydata,#alloc
> +	.globl	input_data
> +input_data:
> +	.incbin	"arch/arm/compressed/piggy.lzo"
> +	.globl	input_data_end
> +input_data_end:
> diff --git a/arch/arm/cpu/start.c b/arch/arm/cpu/start.c
> index 8ab6fdc..6c745f7 100644
> --- a/arch/arm/cpu/start.c
> +++ b/arch/arm/cpu/start.c
> @@ -100,6 +100,7 @@ void __naked __bare_init reset(void)
>  	board_init_lowlevel_return();
>  }
>  
> +#ifdef CONFIG_COMPRESSOR
>  extern void *input_data;
>  extern void *input_data_end;
>  
> @@ -129,6 +130,29 @@ void barebox_uncompress(void *compressed_start, unsigned int len)
>  	barebox();
>  }
>  
> +void barebox_decompress(uint32_t offset)
> +{
> +	uint32_t compressed_start, compressed_end, len;
> +	void (*uncompress)(void *compressed_start, unsigned int len);
> +
> +	compressed_start = (uint32_t)&input_data - offset;
> +	compressed_end = (uint32_t)&input_data_end - offset;
> +	len = compressed_end - compressed_start;
> +
> +	uncompress = barebox_uncompress;
> +
> +	/* call barebox_uncompress with its absolute address */
> +	__asm__ __volatile__(
> +		"mov r0, %1\n"
> +		"mov r1, %2\n"
> +		"mov pc, %0\n"
> +		:
> +		: "r"(uncompress), "r"(compressed_start), "r"(len)
> +		: "r0", "r1");
> +}
> +#else
> +void barebox_decompress(uint32_t offset) {}
> +#endif
>  
>  /*
>   * Board code can jump here by either returning from board_init_lowlevel
> @@ -137,8 +161,6 @@ void barebox_uncompress(void *compressed_start, unsigned int len)
>  void __naked __section(.text_ll_return) board_init_lowlevel_return(void)
>  {
>  	uint32_t r, addr, offset;
> -	uint32_t compressed_start, compressed_end, len;
> -	void (*uncompress)(void *compressed_start, unsigned int len);
>  
>  	/*
>  	 * Get runtime address of this function. Do not
> @@ -169,20 +191,7 @@ void __naked __section(.text_ll_return) board_init_lowlevel_return(void)
>  	__asm__ __volatile__("mcr p15, 0, %0, c7, c5, 0" : : "r" (0));
>  
>  	if (IS_ENABLED(CONFIG_IMAGE_COMPRESSION)) {
> -		compressed_start = (uint32_t)&input_data - offset;
> -		compressed_end = (uint32_t)&input_data_end - offset;
> -		len = compressed_end - compressed_start;
> -
> -		uncompress = barebox_uncompress;
> -
> -		/* call barebox_uncompress with its absolute address */
> -		__asm__ __volatile__(
> -			"mov r0, %1\n"
> -			"mov r1, %2\n"
> -			"mov pc, %0\n"
> -			:
> -			: "r"(uncompress), "r"(compressed_start), "r"(len)
> -			: "r0", "r1");
> +		barebox_decompress(offset);
>  	} else {
>  		/* call start_barebox with its absolute address */
>  		r = (unsigned int)&start_barebox;
> diff --git a/compressed/misc.c b/compressed/misc.c
> new file mode 100644
> index 0000000..47e9cea
> --- /dev/null
> +++ b/compressed/misc.c
> @@ -0,0 +1,14 @@
> +#include <common.h>
> +#include <init.h>
> +#include <linux/types.h>
> +#include <linux/string.h>
> +#include <linux/ctype.h>
> +
> +void __noreturn panic(const char *fmt, ...)
> +{
> +	while(1);
> +}
> +
> +void start_barebox(void)
> +{
> +}
> diff --git a/compressed/string.c b/compressed/string.c
> new file mode 100644
> index 0000000..6787e82
> --- /dev/null
> +++ b/compressed/string.c
> @@ -0,0 +1,127 @@
> +/*
> + * arch/arm/boot/compressed/string.c
> + *
> + * Small subset of simple string routines
> + */
> +
> +#include <linux/types.h>
> +
> +void *memcpy(void *__dest, __const void *__src, size_t __n)
> +{
> +	int i = 0;
> +	unsigned char *d = (unsigned char *)__dest, *s = (unsigned char *)__src;
> +
> +	for (i = __n >> 3; i > 0; i--) {
> +		*d++ = *s++;
> +		*d++ = *s++;
> +		*d++ = *s++;
> +		*d++ = *s++;
> +		*d++ = *s++;
> +		*d++ = *s++;
> +		*d++ = *s++;
> +		*d++ = *s++;
> +	}
> +
> +	if (__n & 1 << 2) {
> +		*d++ = *s++;
> +		*d++ = *s++;
> +		*d++ = *s++;
> +		*d++ = *s++;
> +	}
> +
> +	if (__n & 1 << 1) {
> +		*d++ = *s++;
> +		*d++ = *s++;
> +	}
> +
> +	if (__n & 1)
> +		*d++ = *s++;
> +
> +	return __dest;
> +}
> +
> +void *memmove(void *__dest, __const void *__src, size_t count)
> +{
> +	unsigned char *d = __dest;
> +	const unsigned char *s = __src;
> +
> +	if (__dest == __src)
> +		return __dest;
> +
> +	if (__dest < __src)
> +		return memcpy(__dest, __src, count);
> +
> +	while (count--)
> +		d[count] = s[count];
> +	return __dest;
> +}
> +
> +size_t strlen(const char *s)
> +{
> +	const char *sc = s;
> +
> +	while (*sc != '\0')
> +		sc++;
> +	return sc - s;
> +}
> +
> +int memcmp(const void *cs, const void *ct, size_t count)
> +{
> +	const unsigned char *su1 = cs, *su2 = ct, *end = su1 + count;
> +	int res = 0;
> +
> +	while (su1 < end) {
> +		res = *su1++ - *su2++;
> +		if (res)
> +			break;
> +	}
> +	return res;
> +}
> +
> +int strcmp(const char *cs, const char *ct)
> +{
> +	unsigned char c1, c2;
> +	int res = 0;
> +
> +	do {
> +		c1 = *cs++;
> +		c2 = *ct++;
> +		res = c1 - c2;
> +		if (res)
> +			break;
> +	} while (c1);
> +	return res;
> +}
> +
> +void *memchr(const void *s, int c, size_t count)
> +{
> +	const unsigned char *p = s;
> +
> +	while (count--)
> +		if ((unsigned char)c == *p++)
> +			return (void *)(p - 1);
> +	return NULL;
> +}
> +
> +char *strchr(const char *s, int c)
> +{
> +	while (*s != (char)c)
> +		if (*s++ == '\0')
> +			return NULL;
> +	return (char *)s;
> +}
> +
> +#undef memset
> +
> +void *memset(void *s, int c, size_t count)
> +{
> +	char *xs = s;
> +	while (count--)
> +		*xs++ = c;
> +	return s;
> +}
> +
> +void __memzero(void *s, size_t count)
> +{
> +	memset(s, 0, count);
> +}
> diff --git a/piggy.lzo.S b/piggy.lzo.S
> deleted file mode 100644
> index 6cc618d..0000000
> --- a/piggy.lzo.S
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -	.section .piggydata,#alloc
> -	.globl  input_data
> -input_data:
> -	.incbin "barebox-uncompressed.bin.lzo"
> -	.globl  input_data_end
> -input_data_end:
> -- 
> 1.7.10
> 
