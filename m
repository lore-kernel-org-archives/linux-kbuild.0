Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:42500 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1035213AbdDUFCw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 01:02:52 -0400
MIME-Version: 1.0
In-Reply-To: <20170404172706.171971-1-mka@chromium.org>
References: <20170404172706.171971-1-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 21 Apr 2017 14:02:46 +0900
Message-ID: <CAK7LNASfCFW4KZ72rYXQTpYFGf+KJcjK+L8wvHtiHmXNVYRtwg@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Add support to generate LLVM bitcode files
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Emese Revfy <re.emese@gmail.com>, Kees Cook <keescook@chromium.org>, Behan Webster <behanw@converseincode.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, Kyeongmin Cho <korea.drzix@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Peter Foley <pefoley2@pefoley.com>

Hi Matthias,


2017-04-05 2:27 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> From: Vin=C3=ADcius Tinti <viniciustinti@gmail.com>
>
> Add rules to kbuild in order to generate LLVM bitcode files with the .ll
> extension when using clang.


First, I'd like to be sure about the terminology "LLVM bitcode"
because "bitcode" sounds like human-unreadable binary.


For example, 'man llvm-as' says:
    llvm-as  is  the  LLVM  assembler.  It reads a file containing
    human-readable LLVM assembly language, translates it to LLVM
    bitcode, and writes the result into a file or to standard output.


As far as I understood:

*.ll   -  LLVM assembly  (human readable file)
*.bc   -  LLVM bitcode   (binary file)

Is this correct?






>   # from c code
>   CC=3Dclang make kernel/pid.ll

This does not work because CC is overridden in the top-level Makefile.
It should be
    make CC=3Dclang kernel/pid.ll




>   # from asm code
>   CC=3Dclang make arch/x86/kernel/preempt.ll

arch/x86/kernel/preempt.* does not exist
(at least in the latest tree).




> +
> +quiet_cmd_as_ll_S =3D CPP $(quiet_modtag) $@
> +      cmd_as_ll_S =3D $(CPP) $(a_flags)   -o $@ $<
> +
> +$(obj)/%.ll: $(src)/%.S FORCE
> +       $(call if_changed_dep,as_ll_S)
> +

I could not understand how this rule can convert
architecture-specific assembly to LLVM intermediate expression.

This is just pre-processing *.S file.


Actually, this is completely the same as the rule *.S -> *.s

quiet_cmd_cpp_s_S =3D CPP $(quiet_modtag) $@
cmd_cpp_s_S       =3D $(CPP) $(a_flags) -o $@ $<

$(obj)/%.s: $(src)/%.S FORCE
      $(call if_changed_dep,cpp_s_S)





--=20
Best Regards
Masahiro Yamada
