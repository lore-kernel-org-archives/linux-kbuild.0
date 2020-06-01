Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:53547 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726017AbgFARix (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 13:38:53 -0400
Date: Mon, 1 Jun 2020 12:38:40 -0500
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH 0/2] Build ORC fast lookup table in scripts/sorttable tool
Message-ID: <20200601173840.3f36m6l4fsu5bill@treble>
References: <20200429064626.16389-1-changhuaixin@linux.alibaba.com>
 <20200522182815.ezanmvbemhzq2fmm@treble>
 <482837A8-E9D9-4229-B7B1-8E14403FB2AC@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <482837A8-E9D9-4229-B7B1-8E14403FB2AC@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: changhuaixin <changhuaixin@linux.alibaba.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, bp@alien8.de, hpa@zytor.com, luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com, peterz@infradead.org, tglx@linutronix.de, x86@kernel.org, yamada.masahiro@socionext.com

On Sun, May 31, 2020 at 01:26:54PM +0800, changhuaixin wrote:
>    It turned out to be an alignment problem. If sh_size of previous section
>    orc_unwind is not 4-byte aligned, sh_offset of the following orc_lookup
>    section is not 4-byte aligned too. However, the VMA of section orc_lookup
>    is aligned to the nearest 4-byte. Thus, the orc_lookup section means two
>    different ares for scripts/sorttable tool and kernel.
> 
>    Sections headers look like this when it happens:
> 
>    12 .orc_unwind_ip 00172124  ffffffff82573b28  0000000002573b28  01773b28
>     2**0
>                     CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA
>    13 .orc_unwind   0022b1b6  ffffffff826e5c4c  00000000026e5c4c  018e5c4c
>     2**0
>                     CONTENTS, ALLOC, LOAD, READONLY, DATA
>    14 .orc_lookup   0003003c  ffffffff82910e04  0000000002910e04  01b10e02
>     2**0
>                     ALLOC
>    15 .vvar         00001000  ffffffff82941000  0000000002941000  01b41000
>     2**4
>                     CONTENTS, ALLOC, LOAD, DATA
> 
>    Sorttable tool uses the are starting with offset 0x01b10e02 for 0x0003003c
>    bytes. While kernel use the area starting with VMA at  0xffffffff82910e04
>    for 0x0003003c bytes, meaning that each entry in this table used by kernel
>    is actually 2 bytes behind the corresponding entry set from sorttable
>    tool.
> 
>    Any suggestion on fixing this？

The VMA and LMA are both 4-byte aligned.  The file offset alignment
(0x01b10e02) shouldn't matter.

Actually it looks like the problem is that the section doesn't have
CONTENTS, so it's just loaded as a BSS section (all zeros).  The section
needs to be type SHT_PROGBITS instead of SHT_NOBITS.

$ readelf -S vmlinux |grep orc_lookup
  [16] .orc_lookup       NOBITS           ffffffff82b68418  01d68418

I tried to fix it with

diff --git a/scripts/sorttable.h b/scripts/sorttable.h
index a36c76c17be4..76adb1fb88f8 100644
--- a/scripts/sorttable.h
+++ b/scripts/sorttable.h
@@ -341,6 +341,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 			param.lookup_table_size = s->sh_size;
 			param.orc_lookup_table = (unsigned int *)
 				((void *)ehdr + s->sh_offset);
+			w(SHT_PROGBITS, &s->sh_type);
 		}
 		if (!strcmp(secstrings + idx, ".text")) {
 			param.text_size = s->sh_size;


But that makes kallsyms unhappy, so I guess we need to do it from the
linker script where .orc_lookup is created.

Linker script doesn't seem to allow manual specification of the section
type, so this is the best I could come up with:

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index db600ef218d7..49f4f5bc6165 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -826,6 +826,8 @@
 		. += (((SIZEOF(.text) + LOOKUP_BLOCK_SIZE - 1) /	\
 			LOOKUP_BLOCK_SIZE) + 1) * 4;			\
 		orc_lookup_end = .;					\
+		/* HACK: force SHT_PROGBITS so sorttable can edit: */	\
+		BYTE(1);						\
 	}
 #else
 #define ORC_UNWIND_TABLE
