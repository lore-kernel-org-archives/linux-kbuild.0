Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:42952 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750767AbeBHAQu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Feb 2018 19:16:50 -0500
MIME-Version: 1.0
In-Reply-To: <1517877294-4826-15-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com> <1517877294-4826-15-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 8 Feb 2018 01:16:49 +0100
Message-ID: <CAFkk2KSA3=Mt1=jssDLju0scGw42teyarRX6yF3+FtgjnXYuwA@mail.gmail.com>
Subject: Re: [PATCH 14/14] kconfig: test: check if recursive inclusion is detected
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 6, 2018 at 1:34 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> If recursive inclusion is detected, it should fail with error messages.
> Test this.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/kconfig/tests/err_recursive_inc/Kconfig         |  1 +
>  scripts/kconfig/tests/err_recursive_inc/Kconfig.inc     |  1 +
>  scripts/kconfig/tests/err_recursive_inc/__init__.py     | 10 ++++++++++
>  scripts/kconfig/tests/err_recursive_inc/expected_stderr |  4 ++++
>  4 files changed, 16 insertions(+)
>  create mode 100644 scripts/kconfig/tests/err_recursive_inc/Kconfig
>  create mode 100644 scripts/kconfig/tests/err_recursive_inc/Kconfig.inc
>  create mode 100644 scripts/kconfig/tests/err_recursive_inc/__init__.py
>  create mode 100644 scripts/kconfig/tests/err_recursive_inc/expected_stderr
>
> diff --git a/scripts/kconfig/tests/err_recursive_inc/Kconfig b/scripts/kconfig/tests/err_recursive_inc/Kconfig
> new file mode 100644
> index 0000000..3ce7a3f
> --- /dev/null
> +++ b/scripts/kconfig/tests/err_recursive_inc/Kconfig
> @@ -0,0 +1 @@
> +source "Kconfig.inc"
> diff --git a/scripts/kconfig/tests/err_recursive_inc/Kconfig.inc b/scripts/kconfig/tests/err_recursive_inc/Kconfig.inc
> new file mode 100644
> index 0000000..1fab1c1
> --- /dev/null
> +++ b/scripts/kconfig/tests/err_recursive_inc/Kconfig.inc
> @@ -0,0 +1 @@
> +source "Kconfig"
> diff --git a/scripts/kconfig/tests/err_recursive_inc/__init__.py b/scripts/kconfig/tests/err_recursive_inc/__init__.py
> new file mode 100644
> index 0000000..1dae64f
> --- /dev/null
> +++ b/scripts/kconfig/tests/err_recursive_inc/__init__.py
> @@ -0,0 +1,10 @@
> +"""
> +Detect recursive inclusion error
> +================================
> +
> +If recursive inclusion is detected, it should fail with error messages.
> +"""
> +
> +def test(conf):
> +    assert conf.oldaskconfig() != 0
> +    assert conf.stderr_contains('expected_stderr')
> diff --git a/scripts/kconfig/tests/err_recursive_inc/expected_stderr b/scripts/kconfig/tests/err_recursive_inc/expected_stderr
> new file mode 100644
> index 0000000..b256c91
> --- /dev/null
> +++ b/scripts/kconfig/tests/err_recursive_inc/expected_stderr
> @@ -0,0 +1,4 @@
> +Kconfig:1: recursive inclusion detected. Inclusion path:
> +  current file : 'Kconfig'
> +  included from: 'Kconfig.inc:1'
> +  included from: 'Kconfig:3'
> --
> 2.7.4
>

Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
