Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:43584 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750745AbeBHAP5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Feb 2018 19:15:57 -0500
MIME-Version: 1.0
In-Reply-To: <1517877294-4826-14-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com> <1517877294-4826-14-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 8 Feb 2018 01:15:56 +0100
Message-ID: <CAFkk2KQv3oXWVdvyH9EPhmCiOEX1Ab++wvcsd+=gP-8RvTua+g@mail.gmail.com>
Subject: Re: [PATCH 13/14] kconfig: test: check if recursive dependencies are detected
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 6, 2018 at 1:34 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Recursive dependency should be detected and warned.  Test this.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/kconfig/tests/warn_recursive_dep/Kconfig   | 62 ++++++++++++++++++++++
>  .../kconfig/tests/warn_recursive_dep/__init__.py   | 10 ++++
>  .../tests/warn_recursive_dep/expected_stderr       | 33 ++++++++++++
>  3 files changed, 105 insertions(+)
>  create mode 100644 scripts/kconfig/tests/warn_recursive_dep/Kconfig
>  create mode 100644 scripts/kconfig/tests/warn_recursive_dep/__init__.py
>  create mode 100644 scripts/kconfig/tests/warn_recursive_dep/expected_stderr
>
> diff --git a/scripts/kconfig/tests/warn_recursive_dep/Kconfig b/scripts/kconfig/tests/warn_recursive_dep/Kconfig
> new file mode 100644
> index 0000000..9ab2474
> --- /dev/null
> +++ b/scripts/kconfig/tests/warn_recursive_dep/Kconfig
> @@ -0,0 +1,62 @@
> +# depends on itself
> +
> +config A
> +       bool "A"
> +       depends on A
> +
> +# select itself
> +
> +config B
> +       bool
> +       select B
> +
> +# depends on each other
> +
> +config C1
> +       bool "C1

Missing end quote here. Noticed because the output contains
"Kconfig:16:warning: multi-line strings not supported". :)

> +       depends on C2
> +
> +config C2
> +       bool "C2"
> +       depends on C1
> +
> +# depends on and select
> +
> +config D1
> +       bool "D1"
> +       depends on D2
> +       select D2
> +
> +config D2
> +       bool
> +
> +# depends on and imply
> +# This is not recursive dependency
> +
> +config E1
> +       bool "E1"
> +       depends on E2
> +       imply E2
> +
> +config E2
> +       bool "E2"
> +
> +# property
> +
> +config F1
> +       bool "F1"
> +       default F2
> +
> +config F2
> +       bool "F2"
> +       depends on F1
> +
> +# menu
> +
> +menu "menu depending on its content"
> +       depends on G
> +
> +config G
> +       bool "G"
> +
> +endmenu
> diff --git a/scripts/kconfig/tests/warn_recursive_dep/__init__.py b/scripts/kconfig/tests/warn_recursive_dep/__init__.py
> new file mode 100644
> index 0000000..cdf2c13
> --- /dev/null
> +++ b/scripts/kconfig/tests/warn_recursive_dep/__init__.py
> @@ -0,0 +1,10 @@
> +"""
> +Warn recursive inclusion
> +========================
> +
> +Recursive dependency should be warned.
> +"""
> +
> +def test(conf):
> +    assert conf.oldaskconfig() == 0
> +    assert conf.stderr_contains('expected_stderr')
> diff --git a/scripts/kconfig/tests/warn_recursive_dep/expected_stderr b/scripts/kconfig/tests/warn_recursive_dep/expected_stderr
> new file mode 100644
> index 0000000..ea47cae
> --- /dev/null
> +++ b/scripts/kconfig/tests/warn_recursive_dep/expected_stderr
> @@ -0,0 +1,33 @@
> +Kconfig:16:warning: multi-line strings not supported
> +Kconfig:9:error: recursive dependency detected!
> +Kconfig:9:     symbol B is selected by B
> +For a resolution refer to Documentation/kbuild/kconfig-language.txt
> +subsection "Kconfig recursive dependency limitations"
> +
> +Kconfig:3:error: recursive dependency detected!
> +Kconfig:3:     symbol A depends on A
> +For a resolution refer to Documentation/kbuild/kconfig-language.txt
> +subsection "Kconfig recursive dependency limitations"
> +
> +Kconfig:15:error: recursive dependency detected!
> +Kconfig:15:    symbol C1 depends on C2
> +Kconfig:19:    symbol C2 depends on C1
> +For a resolution refer to Documentation/kbuild/kconfig-language.txt
> +subsection "Kconfig recursive dependency limitations"
> +
> +Kconfig:30:error: recursive dependency detected!
> +Kconfig:30:    symbol D2 is selected by D1
> +Kconfig:25:    symbol D1 depends on D2
> +For a resolution refer to Documentation/kbuild/kconfig-language.txt
> +subsection "Kconfig recursive dependency limitations"
> +
> +Kconfig:59:error: recursive dependency detected!
> +Kconfig:59:    symbol G depends on G
> +For a resolution refer to Documentation/kbuild/kconfig-language.txt
> +subsection "Kconfig recursive dependency limitations"
> +
> +Kconfig:50:error: recursive dependency detected!
> +Kconfig:50:    symbol F2 depends on F1
> +Kconfig:48:    symbol F1 default value contains F2
> +For a resolution refer to Documentation/kbuild/kconfig-language.txt
> +subsection "Kconfig recursive dependency limitations"
> --
> 2.7.4
>

Besides the missing end quote:

Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
