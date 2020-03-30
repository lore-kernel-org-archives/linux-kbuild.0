Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:41809 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727780AbgC3Ad7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 20:33:59 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 02U0Xiqw031238
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2020 09:33:45 +0900
Received: by mail-vs1-f46.google.com with SMTP id y138so9944024vsy.0
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2020 17:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <1966103.4dT7el1ifK@apollon> <2516578.0xqDLvIEN0@apollon>
 <CAK7LNAQBypq0QxUafH6f4k4d7wObjycK6eys2NKDZi8_Qdxb4A@mail.gmail.com> <3026651.zccbJs9ps7@apollon>
In-Reply-To: <3026651.zccbJs9ps7@apollon>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 30 Mar 2020 09:33:07 +0900
Message-ID: <CAK7LNASYss1OzYvQVSaMVfGY45XShteudLm9f=wuH9gAZSmmxQ@mail.gmail.com>
Subject: Re: Bug#954778: Patch: Suppress irrelevant warning when generating a
 debian package
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Reinhard Karcher <reinhard.karcher@gmx.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 954778@bugs.debian.org

On Mon, Mar 30, 2020 at 12:01 AM Reinhard Karcher
<reinhard.karcher@gmx.net> wrote:
>
> There was a blank line missing between the package definitions.
> Sorry for late testing.
>
> --
> Best regards
> Reinhard Karcher


The attached patch is not in a correct patch format.

This time, I manually crufted the format, and applied.

But, next time, please send it to ML instead of attachment,
in a correct format.

git supports useful commands to do this.

  [1]  "git format-patch"  to create a patch
  [2]  "git send-email" to send it to ML


I reworded the log as follows:

------------------>8---------------
kbuild: deb-pkg: fix warning when CONFIG_DEBUG_INFO is unset

Creating a Debian package without CONFIG_DEBUG_INFO produces
a warning that no debug package was created.

This patch excludes the debug package from the control file,
if no debug package is created by this configuration.

Signed-off-by: Reinhard Karcher <reinhard.karcher@gmx.net>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
------------------>8---------------


-- 
Best Regards
Masahiro Yamada
