Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35213 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942880AbdDTKxu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Apr 2017 06:53:50 -0400
Received: by mail-lf0-f54.google.com with SMTP id 75so26649918lfs.2
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Apr 2017 03:53:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQT8pSjgW5ujnWWP3MKfU0=XnFKWVeNu-fx5NRRX0XgMg@mail.gmail.com>
References: <20170331130941.5250-1-riku.voipio@linaro.org> <20170331130941.5250-4-riku.voipio@linaro.org>
 <CAK7LNAQT8pSjgW5ujnWWP3MKfU0=XnFKWVeNu-fx5NRRX0XgMg@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Thu, 20 Apr 2017 13:53:48 +0300
Message-ID: <CAAqcGHk80P4tKFn+j5n6M=77XaDFkc_e30RZ04+MmMf=qJDyzw@mail.gmail.com>
Subject: Re: [PATCH 3/3] builddeb: add make fastdeb-pkg target
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, debian-kernel <debian-kernel@lists.debian.org>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>

Hi,

Thanks for taking time to review.

On 18 April 2017 at 17:31, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Before expanding this even more,
> please help me understand this script.
>
> Commit 3716001b implemented source package build
> at the end of the builddeb script.
> However, the binary packages are still built in its own way.
> (So, debian/rules is not used in general workflows,
> so we need to test it explicitly somehow.)

Historic reasons.. since the builddeb already existed, the easiest way
to implement debian/rules was to make a skeleton debian/rules that
calls builddeb indrectly.

> Why do not we create a source package first,
> then build binary packages from it?

I wouldn't do a source package per se, but we could create a debian/
directory tree and the call dpkg-buildpackage. This would be a more
substantial overhaul that might break some expected behavior of
deb-pkg targets. If people think its worth, I can give it a shot.

> rpm-pkg does that way.
> (generate a spec-file, then run rpmbuild)

speaking of the mkspec script, it would be nice to refactor it to here
documents over endless lines of echo.

Riku
