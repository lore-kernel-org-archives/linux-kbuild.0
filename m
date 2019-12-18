Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17557 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbfLRORQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Dec 2019 09:17:16 -0500
MIME-Version: 1.0
References: <20191217115151.12465-1-masahiroy@kernel.org>
In-Reply-To: <20191217115151.12465-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 18 Dec 2019 23:16:08 +0900
Message-ID: <CAK7LNAQj3Hsv7Nbd3qVj-ie2z+DsPmBseh4tS9hfk+6mg4PpYw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: remove ---help--- from documentation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Dec 17, 2019 at 8:52 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit 84af7a6194e4 ("checkpatch: kconfig: prefer 'help' over
> '---help---'"), scripts/checkpatch.pl warns the use of ---help---.
>
> This still exists, but new code should avoid using it.
> Let's stop advertising it in documentation.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.

>
>  Documentation/kbuild/kconfig-language.rst | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
> index 74bef19f69f0..231e6a64957f 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -196,14 +196,11 @@ applicable everywhere (see syntax).
>    or equal to the first symbol and smaller than or equal to the second
>    symbol.
>
> -- help text: "help" or "---help---"
> +- help text: "help"
>
>    This defines a help text. The end of the help text is determined by
>    the indentation level, this means it ends at the first line which has
>    a smaller indentation than the first line of the help text.
> -  "---help---" and "help" do not differ in behaviour, "---help---" is
> -  used to help visually separate configuration logic from help within
> -  the file as an aid to developers.
>
>  - misc options: "option" <symbol>[=<value>]
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
