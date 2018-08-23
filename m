Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:37186 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbeHWEHJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Aug 2018 00:07:09 -0400
MIME-Version: 1.0
References: <490A46D5-834E-46A9-9106-A31F94344F99@goldelico.com> <d5093e14-c826-9183-cd94-ecb99a799fc8@infradead.org>
In-Reply-To: <d5093e14-c826-9183-cd94-ecb99a799fc8@infradead.org>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 22 Aug 2018 17:39:52 -0700
Message-ID: <CAKdAkRQ+BXezzT0JsuSa_-imHq+u-q2P5rMVMCL4=N18VYxSAw@mail.gmail.com>
Subject: Re: please revert commit ce8556cca6 "kbuild: verify that $DEPMOD is
 installed" introduced in v4.18.4.
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, lucas.demarchi@profusion.mobi, lucas.de.marchi@gmail.com, michal.lkml@markovi.net, jeyu@kernel.org, cwhuang@linux.org.tw, "3.8+" <stable@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, Aug 22, 2018 at 4:35 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 08/22/2018 11:53 AM, H. Nikolaus Schaller wrote:
> > This patch requires that /sbin/depmod is installed and installable on
> > the build host.
> >
> > But not all build hosts for cross compiling Linux are Linux systems
> > and are able to provide a working port of depmod, especially at the
> > file patch /sbin/depmod.
> >
> > I use, for example, a Darwin system to cross compile Linux and I run
> > depmod -a on the embedded system once, after installing a new Linux
> > kernel there.
> >
> > I have no problem with seeing a warning, but aborting the build process
> > is IMHO a bad idea since the previous behaviour didn't harm many people
> > as far as I see. Probably 99% of people compiling Linux kernels do that
> > on Linux and 99% of those have depmod installed for optimal operation of
> > their build host. So IMHO printing the warning is good enough.
>
> Thanks for the report and sorry about the problem.
>
> I'm OK with changing the error to a warning.
> Does the patch below work for you?

Why would one want a warning on a host that never runs "make modules_install"?
Can this check be only done when we actually try to install modules?

Thanks.

-- 
Dmitry
