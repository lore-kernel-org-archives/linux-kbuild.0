Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:62855 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgCZGOu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 02:14:50 -0400
MIME-Version: 1.0
References: <20200324161539.7538-1-masahiroy@kernel.org> <20200324161539.7538-3-masahiroy@kernel.org>
 <CAKwvOdkjiyyt8Ju2j2O4cm1sB34rb_FTgjCRzEiXM6KL4muO_w@mail.gmail.com> <CAKwvOdmWqAUhL5DRg9oQPXzFtogK-0Q-VZ=FWf=Cjm-RJgR4sw@mail.gmail.com>
In-Reply-To: <CAKwvOdmWqAUhL5DRg9oQPXzFtogK-0Q-VZ=FWf=Cjm-RJgR4sw@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 26 Mar 2020 15:13:50 +0900
Message-ID: <CAK7LNAS+3gq-uL6HF=o2NbZ2udkr+dqAhsvs-XxFs0M9wShJbw@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: remove AS variable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, clang-built-linux <clang-built-linux@googlegroups.com>

Hi Nick,


On Wed, Mar 25, 2020 at 4:59 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Mar 24, 2020 at 12:38 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> > consistent in this regard (and not using the compiler as the driver),
>
> Ah, the preprocessor; we need to preprocess the .S files, .s files are
> fine (though we have .lds.S files that are not `-x
> assembler-with-cpp`)


Right, there is no '*.s' source file in the kernel tree.

If we want to de-couple $(AS), we must the compilation
before the assemble stage   ( $(CC) -S ), but
doing so does not buy us.

So, $(CC) always works as the front-end
for compiling both .c and .S files.


You can see the internal database by
'make --print-data-base'.

I see the following for  *.S -> *.o rule.

# default
COMPILE.S = $(CC) $(ASFLAGS) $(CPPFLAGS) $(TARGET_MACH) -c


So, using $(CC) is the right thing.


Even if we keep AS, we cannot do like AS=llvm-as
since llvm-as is a different kind of tool
that processes LLVM assembly (.ll) .


-- 
Best Regards
Masahiro Yamada
