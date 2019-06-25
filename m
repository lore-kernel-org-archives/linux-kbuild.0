Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:59505 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbfFYGL0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jun 2019 02:11:26 -0400
Date: Tue, 25 Jun 2019 08:11:20 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: compile-test global headers to ensure they are
 self-contained
Message-ID: <20190625061120.GA7561@ravnborg.org>
References: <20190621163931.19397-1-yamada.masahiro@socionext.com>
 <20190621175134.GB16409@ravnborg.org>
 <CAK7LNATz1iuG0Moab60gMSbVU8PJAmrLn27K8HK_1zQ0qeh26w@mail.gmail.com>
 <20190622130635.GA24262@ravnborg.org>
 <20190624214027.GA14740@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624214027.GA14740@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>

> 
> When all header files below include/drm are self-contained it will be a
> single line:
> 
>     header-test-y += $(all_headers_with_subdir)
In reality it will likely be the above, and then a list of 

header-test-n += foo.h

For the header files that we for one or the other reason do not want to
make self-contained.
It would be nice to have the list of ignored files close to their home
and not a full list in one Makefile in include/

> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 3e630fcaffd1..e2f765e9d1e1 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -67,6 +67,7 @@ extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
>  endif
>  
>  # Test self-contained headers
> +header-test-y := $(filter-out $(header-test-n), $(header-test-y))
This part should include the logic to filter out duplicates too.
I think we may do something wrong if the same header is listed twice.

We could also extend this with a check that all files in header-test-n
exits.

	Sam
