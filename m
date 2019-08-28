Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:34508 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbfH1Qjs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 12:39:48 -0400
MIME-Version: 1.0
References: <20190814105400.1339-1-yamada.masahiro@socionext.com> <20190814105400.1339-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190814105400.1339-2-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 29 Aug 2019 01:39:03 +0900
Message-ID: <CAK7LNASwnqxT6fyv+qHTVzx_7-vZX7Rk+9D1f219Yvw1hwrZgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs: kbuild: fix invalid ReST syntax
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Aug 14, 2019 at 7:54 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I see the following warnings when I open this document with a ReST
> viewer, retext:
>
> /home/masahiro/ref/linux/Documentation/kbuild/makefiles.rst:1142: (WARNING/2) Inline emphasis start-string without end-string.
> /home/masahiro/ref/linux/Documentation/kbuild/makefiles.rst:1152: (WARNING/2) Inline emphasis start-string without end-string.
> /home/masahiro/ref/linux/Documentation/kbuild/makefiles.rst:1154: (WARNING/2) Inline emphasis start-string without end-string.
>
> These hunks were added by commit e846f0dc57f4 ("kbuild: add support
> for ensuring headers are self-contained") and commit 1e21cbfada87
> ("kbuild: support header-test-pattern-y"), respectively. They were
> written not for ReST but for the plain text, and merged via the
> kbuild tree.
>
> In the same development cycle, this document was converted to ReST
> by commit cd238effefa2 ("docs: kbuild: convert docs to ReST and rename
> to *.rst"), and merged via the doc sub-system.
>
> Merging them together into Linus' tree resulted in the current situation.
>
> To fix the syntax, surround the asterisks with back-quotes, and
> use :: for the code sample.
>
> Fixes: 39ceda5ce1b0 ("Merge tag 'kbuild-v5.3' of git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>


Both applied to linux-kbuild.





>  Documentation/kbuild/makefiles.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index f4f0f7ffde2b..b4c28c543d72 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -1139,7 +1139,7 @@ When kbuild executes, the following steps are followed (roughly):
>
>      header-test-y
>
> -       header-test-y specifies headers (*.h) in the current directory that
> +       header-test-y specifies headers (`*.h`) in the current directory that
>         should be compile tested to ensure they are self-contained,
>         i.e. compilable as standalone units. If CONFIG_HEADER_TEST is enabled,
>         this builds them as part of extra-y.
> @@ -1147,11 +1147,11 @@ When kbuild executes, the following steps are followed (roughly):
>      header-test-pattern-y
>
>         This works as a weaker version of header-test-y, and accepts wildcard
> -       patterns. The typical usage is:
> +       patterns. The typical usage is::
>
> -                 header-test-pattern-y += *.h
> +               header-test-pattern-y += *.h
>
> -       This specifies all the files that matches to '*.h' in the current
> +       This specifies all the files that matches to `*.h` in the current
>         directory, but the files in 'header-test-' are excluded.
>
>  6.7 Commands useful for building a boot image
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
