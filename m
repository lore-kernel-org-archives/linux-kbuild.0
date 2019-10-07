Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:65271 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbfJGQMf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Oct 2019 12:12:35 -0400
MIME-Version: 1.0
References: <f5cb4272-4cb8-4253-77fd-56aaf73a0dbc@infradead.org>
In-Reply-To: <f5cb4272-4cb8-4253-77fd-56aaf73a0dbc@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 8 Oct 2019 01:11:39 +0900
Message-ID: <CAK7LNARCzEQNAJa1-ub6Ga1VcC6pQHtqc8P1dutscyfQZFzTmQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: setlocalversion: fix a bashism
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Mike Crowe <mcrowe@zipitwireless.com>, LKML <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>

On Sun, Oct 6, 2019 at 12:02 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix bashism reported by checkbashisms by using only one '=':
>
> possible bashism in scripts/setlocalversion line 96 (should be 'b = a'):
>         if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
>
> Fixes: 38b3439d84f4 ("setlocalversion: update mercurial tag parsing")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mike Crowe <mcrowe@zipitwireless.com>

Applied to linux-kbuild. Thanks.

> ---
> Does anyone still use hg for kernel development?

I have also been wondering in which situation
this code is used...


>
>  scripts/setlocalversion |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- lnx-54-rc1.orig/scripts/setlocalversion
> +++ lnx-54-rc1/scripts/setlocalversion
> @@ -93,7 +93,7 @@ scm_version()
>         # Check for mercurial and a mercurial repo.
>         if test -d .hg && hgid=`hg id 2>/dev/null`; then
>                 # Do we have an tagged version?  If so, latesttagdistance == 1
> -               if [ "`hg log -r . --template '{latesttagdistance}'`" == "1" ]; then
> +               if [ "`hg log -r . --template '{latesttagdistance}'`" = "1" ]; then
>                         id=`hg log -r . --template '{latesttag}'`
>                         printf '%s%s' -hg "$id"
>                 else
>


-- 
Best Regards
Masahiro Yamada
