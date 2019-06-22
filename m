Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:44203 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbfFVNGk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Jun 2019 09:06:40 -0400
Date: Sat, 22 Jun 2019 15:06:36 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: compile-test global headers to ensure they are
 self-contained
Message-ID: <20190622130635.GA24262@ravnborg.org>
References: <20190621163931.19397-1-yamada.masahiro@socionext.com>
 <20190621175134.GB16409@ravnborg.org>
 <CAK7LNATz1iuG0Moab60gMSbVU8PJAmrLn27K8HK_1zQ0qeh26w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATz1iuG0Moab60gMSbVU8PJAmrLn27K8HK_1zQ0qeh26w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

Hi Masahiro

> At first, I tried to split Makefile per directory,
> and add header-test-y one by one.
> 
> I think you expect they look like this:
> 
> 
> include/Makefile:
> 
> subdir-y += drm
> subdir-y += linux
> subdir-y += media

So far we agree.

> include/drm/Makefile:
> 
> header-test-y += drm_cache.h
> header-test-y += drm_file.h
> header-test-y += drm_util.h
> ...
On this level it would be better to do:
header-test-y += $(call find_all_header_files)

# drm files that are not self-contained
header-test-n += drm_legacy.h

Likewise for all subdirs below include/
and include/linux should maybe be split up a little too.
Maybe include/uapi/ would need to be slipt a little.

Then we have a manageable number of Makefiles.
New header files are automatically checked and
we have a list of files to fix.
If for example drm/ have too much failures to a start
then we can add that directory to the higler level Makefile later.

The above is more or less what you already started,
but the difference is that we have it pushed down one or two
directories.

The header-test-n logic could be moved to the generic part,
and a helper could be made to find all header files.
Then the Makefiles would be more or less trival, with all the
Kbuild magic hidden away.

> In my analysis, 70% of headers are already conf-contained.
> After some fixups, 95% of headers can become self-contained.

Sounds good. And we do not want 100%, but close...

	Sam
