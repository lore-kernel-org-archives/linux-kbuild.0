Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42158 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbfBGAhR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Feb 2019 19:37:17 -0500
Date: Wed, 6 Feb 2019 17:37:12 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] kbuild, LLVMLinux: Don't suppress format warnings
Message-ID: <20190207003712.GA10692@archlinux-ryzen>
References: <20190201210853.244043-1-jflat@chromium.org>
 <CAK7LNAS5j6+o+wb8WL=8WP4r4fgqY1MDSGe0_u9Nri81_Eb3xw@mail.gmail.com>
 <20190206164528.GA8925@archlinux-ryzen>
 <CACJJ=pyLqhrxka2jXtby9CUqsAr=-_oQUraH5ua3PZpgXHgdOQ@mail.gmail.com>
 <CAKwvOdm=dqScCDVTgQ71i0wtBSqezEzLr69Pxp3bZJFs+_mXsQ@mail.gmail.com>
 <20190206174339.GA19743@archlinux-ryzen>
 <CAK7LNAQ97h3RjKNy8f2abb7fnCaQS3TOoF2LFeGgNxeoCy0GwA@mail.gmail.com>
 <CAK7LNATAdXh4d39VfNqmLX-V-46sLwVXK+YhE1AiMCDutvUr0w@mail.gmail.com>
 <CAKwvOdk4cT=Ay2Xk4hYo4-x8=4ng9gF5rF=5RsV-Rp=q5UFNtg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdk4cT=Ay2Xk4hYo4-x8=4ng9gF5rF=5RsV-Rp=q5UFNtg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>, g@archlinux-ryzen
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Jon Flatley <jflat@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Wed, Feb 06, 2019 at 04:30:21PM -0800, Nick Desaulniers wrote:
> On Wed, Feb 6, 2019 at 4:28 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> > BTW, it would be nice if kbuild test robot
> > could test building with clang ...
> 
> Is "kbuild test robot" different than 0day, kernelCI, or ClangBuiltLinux's CI?
> -- 
> Thanks,
> ~Nick Desaulniers

kbuild test robot is 0day (that's the name the emails come under when
reporting issues).

Nathan
