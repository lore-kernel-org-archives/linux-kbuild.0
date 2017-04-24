Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:42874 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1164144AbdDXCV7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Apr 2017 22:21:59 -0400
MIME-Version: 1.0
In-Reply-To: <20170421195502.GL128305@google.com>
References: <20170404172706.171971-1-mka@chromium.org> <CAK7LNASfCFW4KZ72rYXQTpYFGf+KJcjK+L8wvHtiHmXNVYRtwg@mail.gmail.com>
 <20170421195502.GL128305@google.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 24 Apr 2017 11:21:48 +0900
Message-ID: <CAK7LNAQas1xvs6KzAjaBBu+0iYzj_ZjhQOTAQB-1ciC0m1242Q@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Add support to generate LLVM bitcode files
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Emese Revfy <re.emese@gmail.com>, Kees Cook <keescook@chromium.org>, Behan Webster <behanw@converseincode.com>, "Luis R . Rodriguez" <mcgrof@kernel.org>, =?UTF-8?Q?Vin=C3=ADcius_Tinti?= <viniciustinti@gmail.com>, Kyeongmin Cho <korea.drzix@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Peter Foley <pefoley2@pefoley.com>

Hi Matthias,



2017-04-22 4:55 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> Hi Masahiro,
>
> El Fri, Apr 21, 2017 at 02:02:46PM +0900 Masahiro Yamada ha dit:
>
>> 2017-04-05 2:27 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
>> > From: Vin=C3=ADcius Tinti <viniciustinti@gmail.com>
>> >
>> > Add rules to kbuild in order to generate LLVM bitcode files with the .=
ll
>> > extension when using clang.
>>
>>
>> First, I'd like to be sure about the terminology "LLVM bitcode"
>> because "bitcode" sounds like human-unreadable binary.
>>
>>
>> For example, 'man llvm-as' says:
>>     llvm-as  is  the  LLVM  assembler.  It reads a file containing
>>     human-readable LLVM assembly language, translates it to LLVM
>>     bitcode, and writes the result into a file or to standard output.
>>


One more thing:

Please add '*.ll' pattern to the following clean target.


clean: $(clean-dirs)
        $(call cmd,rmdirs)
        $(call cmd,rmfiles)
        @find $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE=
) \
                \( -name '*.[oas]' -o -name '*.ko' -o -name '.*.cmd' \
                -o -name '*.ko.*' \
                -o -name '*.dwo'  \
                -o -name '*.su'  \
                -o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
                -o -name '*.symtypes' -o -name 'modules.order' \
                -o -name modules.builtin -o -name '.tmp_*.o.*' \
                -o -name '*.c.[012]*.*' \
                -o -name '*.gcno' \) -type f -print | xargs rm -f





--=20
Best Regards
Masahiro Yamada
