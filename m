Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-la0-f52.google.com ([209.85.215.52]:36564 "EHLO
	mail-la0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751740AbbC1Ug3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 28 Mar 2015 16:36:29 -0400
Received: by labe2 with SMTP id e2so92757648lab.3
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Mar 2015 13:36:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1427536841-3089-1-git-send-email-diego.viola@gmail.com>
References: <1427536841-3089-1-git-send-email-diego.viola@gmail.com>
Date: Sat, 28 Mar 2015 17:36:27 -0300
Message-ID: <CA+ToGPE9Uy3O88hNLUuWgwEw9BQwze+tDbhNRMXP2CDrc3mXhA@mail.gmail.com>
Subject: Re: [PATCH] scripts/kconfig/Makefile: fix Qt spelling
From: Diego Viola <diego.viola@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Sorry for sending this twice. I thought the list required subscription
for sending emails.

Diego

On Sat, Mar 28, 2015 at 7:00 AM, Diego Viola <diego.viola@gmail.com> wrote:
> Proper spelling is Qt, not QT.
>
> Signed-off-by: Diego Viola <diego.viola@gmail.com>
> ---
>  scripts/kconfig/Makefile | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index cb2cf54..1ce4e39 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -124,7 +124,7 @@ help:
>         @echo  '  config          - Update current config utilising a line-oriented program'
>         @echo  '  nconfig         - Update current config utilising a ncurses menu based program'
>         @echo  '  menuconfig      - Update current config utilising a menu based program'
> -       @echo  '  xconfig         - Update current config utilising a QT based front-end'
> +       @echo  '  xconfig         - Update current config utilising a Qt based front-end'
>         @echo  '  gconfig         - Update current config utilising a GTK based front-end'
>         @echo  '  oldconfig       - Update current config utilising a provided .config as base'
>         @echo  '  localmodconfig  - Update current config disabling modules not loaded'
> @@ -158,7 +158,7 @@ HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags) \
>  # mconf:  Used for the menuconfig target
>  #         Utilizes the lxdialog package
>  # qconf:  Used for the xconfig target
> -#         Based on QT which needs to be installed to compile it
> +#         Based on Qt which needs to be installed to compile it
>  # gconf:  Used for the gconfig target
>  #         Based on GTK which needs to be installed to compile it
>  # object files used by all kconfig flavours
> @@ -217,11 +217,11 @@ ifeq ($(MAKECMDGOALS),xconfig)
>  $(obj)/.tmp_qtcheck: $(src)/Makefile
>  -include $(obj)/.tmp_qtcheck
>
> -# QT needs some extra effort...
> +# Qt needs some extra effort...
>  $(obj)/.tmp_qtcheck:
>         @set -e; echo "  CHECK   qt"; dir=""; pkg=""; \
>         if ! pkg-config --exists QtCore 2> /dev/null; then \
> -           echo "* Unable to find the QT4 tool qmake. Trying to use QT3"; \
> +           echo "* Unable to find the Qt4 tool qmake. Trying to use Qt3"; \
>             pkg-config --exists qt 2> /dev/null && pkg=qt; \
>             pkg-config --exists qt-mt 2> /dev/null && pkg=qt-mt; \
>             if [ -n "$$pkg" ]; then \
> @@ -235,8 +235,8 @@ $(obj)/.tmp_qtcheck:
>               done; \
>               if [ -z "$$dir" ]; then \
>                 echo >&2 "*"; \
> -               echo >&2 "* Unable to find any QT installation. Please make sure that"; \
> -               echo >&2 "* the QT4 or QT3 development package is correctly installed and"; \
> +               echo >&2 "* Unable to find any Qt installation. Please make sure that"; \
> +               echo >&2 "* the Qt4 or Qt3 development package is correctly installed and"; \
>                 echo >&2 "* either qmake can be found or install pkg-config or set"; \
>                 echo >&2 "* the QTDIR environment variable to the correct location."; \
>                 echo >&2 "*"; \
> --
> 2.3.4
>
