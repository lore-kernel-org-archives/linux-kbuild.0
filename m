Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f194.google.com ([209.85.222.194]:33758 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725947AbfFUTFl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Jun 2019 15:05:41 -0400
MIME-Version: 1.0
References: <20190604101409.2078-1-yamada.masahiro@socionext.com> <20190604101409.2078-16-yamada.masahiro@socionext.com>
In-Reply-To: <20190604101409.2078-16-yamada.masahiro@socionext.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 21 Jun 2019 21:05:22 +0200
Message-ID: <CAK8P3a08f25WYP5r57JHPcZWieS2+07=_qTphLosS4M2w8F0Zw@mail.gmail.com>
Subject: Re: [PATCH 15/15] kbuild: compile test UAPI headers to ensure they
 are self-contained
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, David Howells <dhowells@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>, Song Liu <songliubraving@fb.com>, Alexei Starovoitov <ast@kernel.org>, Networking <netdev@vger.kernel.org>, Yonghong Song <yhs@fb.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-riscv@lists.infradead.org, Michal Marek <michal.lkml@markovi.net>, Martin KaFai Lau <kafai@fb.com>, Palmer Dabbelt <palmer@sifive.com>, bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>, Albert Ou <aou@eecs.berkeley.edu>

On Tue, Jun 4, 2019 at 12:16 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> --- a/Makefile
> +++ b/Makefile
> @@ -1363,7 +1363,7 @@ CLEAN_DIRS  += $(MODVERDIR) include/ksym
>  CLEAN_FILES += modules.builtin.modinfo
>
>  # Directories & files removed with 'make mrproper'
> -MRPROPER_DIRS  += include/config usr/include include/generated          \
> +MRPROPER_DIRS  += include/config include/generated          \
>                   arch/$(SRCARCH)/include/generated .tmp_objdiff
>  MRPROPER_FILES += .config .config.old .version \
>                   Module.symvers tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS \

This change seems to have caused a minor regression:

$ make clean ; make clean
find: ‘*’: No such file or directory

Any idea?

      Arnd
