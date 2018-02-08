Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f196.google.com ([209.85.217.196]:41371 "EHLO
        mail-ua0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750736AbeBHAJK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Feb 2018 19:09:10 -0500
MIME-Version: 1.0
In-Reply-To: <1517877294-4826-11-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com> <1517877294-4826-11-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 8 Feb 2018 01:09:09 +0100
Message-ID: <CAFkk2KSnXQXjPRStKUk7QCoGuXGrD3HqMUfL9aurkia3_3kYEA@mail.gmail.com>
Subject: Re: [PATCH 10/14] kconfig: test: check if new symbols in choice are asked
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 6, 2018 at 1:34 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> If new choice values are added with new dependency, and they become
> visible during user configuration, oldconfig should recognize them
> as (NEW), and ask the user for choice.
>
> This issue was fixed by commit 5d09598d488f ("kconfig: fix new choices
> being skipped upon config update").
>
> This is a subtle corner case.  Add a test case to avoid breakage.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/kconfig/tests/new_choice_with_dep/Kconfig  | 37 ++++++++++++++++++++++
>  .../kconfig/tests/new_choice_with_dep/__init__.py  | 14 ++++++++
>  scripts/kconfig/tests/new_choice_with_dep/config   |  3 ++
>  .../tests/new_choice_with_dep/expected_stdout      | 10 ++++++
>  4 files changed, 64 insertions(+)
>  create mode 100644 scripts/kconfig/tests/new_choice_with_dep/Kconfig
>  create mode 100644 scripts/kconfig/tests/new_choice_with_dep/__init__.py
>  create mode 100644 scripts/kconfig/tests/new_choice_with_dep/config
>  create mode 100644 scripts/kconfig/tests/new_choice_with_dep/expected_stdout
>
> diff --git a/scripts/kconfig/tests/new_choice_with_dep/Kconfig b/scripts/kconfig/tests/new_choice_with_dep/Kconfig
> new file mode 100644
> index 0000000..53ef1b8
> --- /dev/null
> +++ b/scripts/kconfig/tests/new_choice_with_dep/Kconfig
> @@ -0,0 +1,37 @@
> +config A
> +       bool "A"
> +       help
> +         This is a new symbol.
> +
> +choice
> +       prompt "Choice ?"
> +       depends on A
> +       help
> +         "depends on A" has been newly added.
> +
> +config CHOICE_B
> +       bool "Choice B"
> +
> +config CHOICE_C
> +       bool "Choice C"
> +       help
> +         This is a new symbol, so should be asked.
> +
> +endchoice
> +
> +choice
> +       prompt "Choice2 ?"
> +
> +config CHOICE_D
> +       bool "Choice D"
> +
> +config CHOICE_E
> +       bool "Choice E"
> +
> +config CHOICE_F
> +       bool "Choice F"
> +       depends on A
> +       help
> +         This is a new symbol, so should be asked.
> +
> +endchoice
> diff --git a/scripts/kconfig/tests/new_choice_with_dep/__init__.py b/scripts/kconfig/tests/new_choice_with_dep/__init__.py
> new file mode 100644
> index 0000000..4306ccf
> --- /dev/null
> +++ b/scripts/kconfig/tests/new_choice_with_dep/__init__.py
> @@ -0,0 +1,14 @@
> +"""
> +Ask new choice values when they become visible
> +==============================================
> +
> +If new choice values are added with new dependency, and they become
> +visible during user configuration, oldconfig should recognize them
> +as (NEW), and ask the user for choice.
> +
> +Related Linux commit: 5d09598d488f081e3be23f885ed65cbbe2d073b5
> +"""
> +
> +def test(conf):
> +    assert conf.oldconfig('config', 'y') == 0
> +    assert conf.stdout_contains('expected_stdout')
> diff --git a/scripts/kconfig/tests/new_choice_with_dep/config b/scripts/kconfig/tests/new_choice_with_dep/config
> new file mode 100644
> index 0000000..47ef95d
> --- /dev/null
> +++ b/scripts/kconfig/tests/new_choice_with_dep/config
> @@ -0,0 +1,3 @@
> +CONFIG_CHOICE_B=y
> +# CONFIG_CHOICE_D is not set
> +CONFIG_CHOICE_E=y
> diff --git a/scripts/kconfig/tests/new_choice_with_dep/expected_stdout b/scripts/kconfig/tests/new_choice_with_dep/expected_stdout
> new file mode 100644
> index 0000000..358d5cf
> --- /dev/null
> +++ b/scripts/kconfig/tests/new_choice_with_dep/expected_stdout
> @@ -0,0 +1,10 @@
> +A (A) [N/y/?] (NEW)
> +  Choice ?
> +  > 1. Choice B (CHOICE_B)
> +    2. Choice C (CHOICE_C) (NEW)
> +  choice[1-2?]:
> +Choice2 ?
> +  1. Choice D (CHOICE_D)
> +> 2. Choice E (CHOICE_E)
> +  3. Choice F (CHOICE_F) (NEW)
> +choice[1-3?]:
> --
> 2.7.4
>

Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
