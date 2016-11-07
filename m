Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56129 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932817AbcKGTLT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Nov 2016 14:11:19 -0500
Subject: Re: Makefile race in 4.9-rc3 (generated/autoksyms.h: No such file or
 directory)
References: <CANVEwpYybigr3NcLA2TyoLZ4OkY1-7AcbL5t4vFyNpF488kFvQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fd47c2bf-dd14-d678-8e4a-9794499a7434@infradead.org>
Date: Mon, 7 Nov 2016 11:11:18 -0800
MIME-Version: 1.0
In-Reply-To: <CANVEwpYybigr3NcLA2TyoLZ4OkY1-7AcbL5t4vFyNpF488kFvQ@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ken Moffat <zarniwhoop73@googlemail.com>, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

[adding linux-kbuild and Michal]
[trying again]

On 10/31/16 13:46, Ken Moffat wrote:
> I just tried to build 4.9 (rc3) for the first time (x86_64, i7 haswell)
>  After making my choices in make oldconfig, make -j8 failed in
> less than 2 sec.
> 
>    CC      scripts/mod/empty.o
>   HOSTCC  scripts/mod/mk_elfconfig
>   HOSTCC  scripts/sortextable
>   CC      scripts/mod/devicetable-offsets.s
> In file included from ./include/linux/linkage.h:6:0,
>                  from ./include/linux/kernel.h:6,
>                  from ./include/asm-generic/bug.h:13,
>                  from ./arch/x86/include/asm/bug.h:35,
>                  from ./include/linux/bug.h:4,
>                  from ./include/linux/jump_label.h:170,
>                  from ./arch/x86/include/asm/string_64.h:5,
>                  from ./arch/x86/include/asm/string.h:4,
>                  from ./include/linux/string.h:18,
>                  from ./include/uapi/linux/uuid.h:21,
>                  from ./include/linux/uuid.h:19,
>                  from ./include/linux/mod_devicetable.h:12,
>                  from scripts/mod/devicetable-offsets.c:2:
> ./include/linux/export.h:81:33: fatal error: generated/autoksyms.h: No
> such file or directory
>  #include <generated/autoksyms.h>
>                                  ^
> compilation terminated.
> make[2]: *** [scripts/Makefile.build:154:
> scripts/mod/devicetable-offsets.s] Error 1
> make[1]: *** [scripts/Makefile.build:475: scripts/mod] Error 2
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:559: scripts] Error 2
> make: *** Waiting for unfinished jobs....
> 
> I then ran make clean and gave it another try, again using -j8.
> This time i t worked, so I guess there is a race in a Makefile.


-- 
~Randy
