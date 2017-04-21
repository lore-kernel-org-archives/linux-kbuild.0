Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:34003 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1425657AbdDUTzG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 15:55:06 -0400
Received: by mail-io0-f179.google.com with SMTP id a103so132659273ioj.1
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Apr 2017 12:55:06 -0700 (PDT)
Date: Fri, 21 Apr 2017 12:55:02 -0700
From: Matthias Kaehlcke <mka@chromium.org>
Subject: Re: [PATCH v3] kbuild: Add support to generate LLVM bitcode files
Message-ID: <20170421195502.GL128305@google.com>
References: <20170404172706.171971-1-mka@chromium.org>
 <CAK7LNASfCFW4KZ72rYXQTpYFGf+KJcjK+L8wvHtiHmXNVYRtwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASfCFW4KZ72rYXQTpYFGf+KJcjK+L8wvHtiHmXNVYRtwg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Emese Revfy <re.emese@gmail.com>, Kees Cook <keescook@chromium.org>, Behan Webster <behanw@converseincode.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, =?utf-8?B?Vmluw61jaXVz?= Tinti <viniciustinti@gmail.com>, Kyeongmin Cho <korea.drzix@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Peter Foley <pefoley2@pefoley.com>

Hi Masahiro,

El Fri, Apr 21, 2017 at 02:02:46PM +0900 Masahiro Yamada ha dit:

> 2017-04-05 2:27 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> > From: Vinícius Tinti <viniciustinti@gmail.com>
> >
> > Add rules to kbuild in order to generate LLVM bitcode files with the .ll
> > extension when using clang.
> 
> 
> First, I'd like to be sure about the terminology "LLVM bitcode"
> because "bitcode" sounds like human-unreadable binary.
> 
> 
> For example, 'man llvm-as' says:
>     llvm-as  is  the  LLVM  assembler.  It reads a file containing
>     human-readable LLVM assembly language, translates it to LLVM
>     bitcode, and writes the result into a file or to standard output.
> 
> 
> As far as I understood:
> 
> *.ll   -  LLVM assembly  (human readable file)
> *.bc   -  LLVM bitcode   (binary file)
> 
> Is this correct?

Yes, the terminology should be changed to talk about 'LLVM assembly'.

> >   # from c code
> >   CC=clang make kernel/pid.ll
> 
> This does not work because CC is overridden in the top-level Makefile.
> It should be
>     make CC=clang kernel/pid.ll

Will change

> >   # from asm code
> >   CC=clang make arch/x86/kernel/preempt.ll
> 
> arch/x86/kernel/preempt.* does not exist
> (at least in the latest tree).
> 
> 
> 
> 
> > +
> > +quiet_cmd_as_ll_S = CPP $(quiet_modtag) $@
> > +      cmd_as_ll_S = $(CPP) $(a_flags)   -o $@ $<
> > +
> > +$(obj)/%.ll: $(src)/%.S FORCE
> > +       $(call if_changed_dep,as_ll_S)
> > +
> 
> I could not understand how this rule can convert
> architecture-specific assembly to LLVM intermediate expression.
> 
> This is just pre-processing *.S file.
> 
> 
> Actually, this is completely the same as the rule *.S -> *.s
> 
> quiet_cmd_cpp_s_S = CPP $(quiet_modtag) $@
> cmd_cpp_s_S       = $(CPP) $(a_flags) -o $@ $<
> 
> $(obj)/%.s: $(src)/%.S FORCE
>       $(call if_changed_dep,cpp_s_S)

Indeed, unsurprisingly the content of a .ll file generated from a .S
is the same as the corresponding .s.

Besides the Makefile rules it isn't clear to me how assembly would be
converted to LLVM IR. I suggest to remove the rules for assembly.

Cheers

Matthias
