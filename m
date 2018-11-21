Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:30033 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbeKURdt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Nov 2018 12:33:49 -0500
MIME-Version: 1.0
References: <20181120144007.016e4998@endymion>
In-Reply-To: <20181120144007.016e4998@endymion>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 21 Nov 2018 15:59:49 +0900
Message-ID: <CAK7LNATyF4GvvoMz0FphfBu739Qvy7L1KzdFcNyj5HhFsYK53Q@mail.gmail.com>
Subject: Re: Backed up kernels
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: jdelvare@suse.de
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, martin.wilck@suse.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jean,


On Tue, Nov 20, 2018 at 10:40 PM Jean Delvare <jdelvare@suse.de> wrote:
>
> Hi Masahiro, Michal,
>
> When I run "make install", if a kernel by the same version number +
> flavor string already exists, a backup is created with ".old" appended.
> Over time, this adds many entries to my boot menu, makes some package
> updates take much longer (e.g. when all initrds must be regenerated),
> and ultimately confuses grub2, which fails to find the matching modules
> directory under /lib/modules.
>
> You could argue that grub2 could be fixed to find the right modules
> directory, but in fact there is no guarantee that the modules built for
> the new kernel are fully compatible with the old kernel. Keeping a
> backup copy of the old modules is also not possible, because both
> kernels have the same $(uname -r) and therefore the modules of both
> kernels must live under the same /lib/modules/$(uname -r), which
> collides.
>
> Given that, is there really any practical value in saving a backup of
> old kernels? I'm doing kernel development for 15 years and I can't
> remember ever booting one of these ".old" kernels. If my latest
> development kernel doesn't work for any reason, I will just boot back
> to the distribution kernel.
>
> Therefore I am asking, can we change "make install" so that it does NOT
> create a backup copy of an existing kernel?


I think your suggestion makes sense,
but "make install" is basically implemented
by arch-specific shell script.
(For example, arch/x86/boot/install.sh)

Will you talk to the maintainers
of architecture you are interested in?

(or send it to linux-arch@vger.kernel.org)


> Thanks,
> --
> Jean Delvare
> SUSE L3 Support



-- 
Best Regards
Masahiro Yamada
