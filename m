Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38775 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726496AbfBGAae (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Feb 2019 19:30:34 -0500
Received: by mail-pf1-f194.google.com with SMTP id q1so3941946pfi.5
        for <linux-kbuild@vger.kernel.org>; Wed, 06 Feb 2019 16:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20190201210853.244043-1-jflat@chromium.org> <CAK7LNAS5j6+o+wb8WL=8WP4r4fgqY1MDSGe0_u9Nri81_Eb3xw@mail.gmail.com>
 <20190206164528.GA8925@archlinux-ryzen> <CACJJ=pyLqhrxka2jXtby9CUqsAr=-_oQUraH5ua3PZpgXHgdOQ@mail.gmail.com>
 <CAKwvOdm=dqScCDVTgQ71i0wtBSqezEzLr69Pxp3bZJFs+_mXsQ@mail.gmail.com>
 <20190206174339.GA19743@archlinux-ryzen> <CAK7LNAQ97h3RjKNy8f2abb7fnCaQS3TOoF2LFeGgNxeoCy0GwA@mail.gmail.com>
 <CAK7LNATAdXh4d39VfNqmLX-V-46sLwVXK+YhE1AiMCDutvUr0w@mail.gmail.com>
In-Reply-To: <CAK7LNATAdXh4d39VfNqmLX-V-46sLwVXK+YhE1AiMCDutvUr0w@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 6 Feb 2019 16:30:21 -0800
Message-ID: <CAKwvOdk4cT=Ay2Xk4hYo4-x8=4ng9gF5rF=5RsV-Rp=q5UFNtg@mail.gmail.com>
Subject: Re: [PATCH] kbuild, LLVMLinux: Don't suppress format warnings
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Jon Flatley <jflat@chromium.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Wed, Feb 6, 2019 at 4:28 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> BTW, it would be nice if kbuild test robot
> could test building with clang ...

Is "kbuild test robot" different than 0day, kernelCI, or ClangBuiltLinux's CI?
-- 
Thanks,
~Nick Desaulniers
