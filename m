Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yh0-f41.google.com ([209.85.213.41]:59537 "EHLO
	mail-yh0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751880AbaCHPE7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 8 Mar 2014 10:04:59 -0500
Received: by mail-yh0-f41.google.com with SMTP id v1so881803yhn.0
        for <linux-kbuild@vger.kernel.org>; Sat, 08 Mar 2014 07:04:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1388448270-28832-1-git-send-email-bjorn.forsman@gmail.com>
References: <1388448270-28832-1-git-send-email-bjorn.forsman@gmail.com>
Date: Sat, 8 Mar 2014 16:04:58 +0100
Message-ID: <CAEYzJUESb2OCz+MX-uWYa_M6Nu4CMWJ3C4YrpwFj0YXZkg7r=g@mail.gmail.com>
Subject: Re: [PATCH] kconfig/lxdialog: get ncurses CFLAGS with pkg-config
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

On 31 December 2013 01:04, Bjørn Forsman <bjorn.forsman@gmail.com> wrote:
> check-lxdialog.sh has functions for finding ncurses linker and compiler
> flags; ldflags() and ccflags().
>
> ldflags() tries to get linker flags from pkg-config and has a fallback
> if pkg-config fails. But ccflags() currently doesn't use pkg-config at
> all, instead it does manual checks like this:
>
>   if [ -f /usr/include/ncursesw/curses.h ]; then
>       echo '-I/usr/include/ncursesw -DCURSES_LOC="<curses.h>"'
>       echo ' -DNCURSES_WIDECHAR=1'
>   elif [ -f /usr/include/ncurses/ncurses.h ]; then
>       echo '-I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>"'
>   [...]
>
> This patch changes ccflags() so that it also tries pkg-config first, and
> only if pkg-config fails does it go back to the fallback/manual checks.
>
> This makes ldflags()/ccflags() symmetric (both try to use pkg-config
> before falling back to manual checks) and has the nice side-effect of
> making "make menuconfig" work on systems where ncurses is not installed
> in a standard location (such as on NixOS).
>
> Signed-off-by: Bjørn Forsman <bjorn.forsman@gmail.com>
> ---
>  scripts/kconfig/lxdialog/check-lxdialog.sh | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/lxdialog/check-lxdialog.sh b/scripts/kconfig/lxdialog/check-lxdialog.sh
> index 9d2a4c5..5075ebf 100644
> --- a/scripts/kconfig/lxdialog/check-lxdialog.sh
> +++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
> @@ -21,7 +21,11 @@ ldflags()
>  # Where is ncurses.h?
>  ccflags()
>  {
> -       if [ -f /usr/include/ncursesw/curses.h ]; then
> +       if pkg-config --cflags ncursesw 2>/dev/null; then
> +               echo '-DCURSES_LOC="<ncurses.h>" -DNCURSES_WIDECHAR=1'
> +       elif pkg-config --cflags ncurses 2>/dev/null; then
> +               echo '-DCURSES_LOC="<ncurses.h>"'
> +       elif [ -f /usr/include/ncursesw/curses.h ]; then
>                 echo '-I/usr/include/ncursesw -DCURSES_LOC="<curses.h>"'
>                 echo ' -DNCURSES_WIDECHAR=1'
>         elif [ -f /usr/include/ncurses/ncurses.h ]; then
> --
> 1.8.5.2

Ping. No comments?

Best regards,
Bjørn Forsman
