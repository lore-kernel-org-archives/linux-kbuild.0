Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua1-f54.google.com ([209.85.222.54]:39201 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbfHJPoo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:44:44 -0400
Received: by mail-ua1-f54.google.com with SMTP id j8so38805692uan.6
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Aug 2019 08:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
 <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
 <CALYGOBVauUutGGc8HNvLwue58AJp5DxOuM8b30XDgfbqJkLo1w@mail.gmail.com> <50091cb8-37ee-4234-9fb8-47d148e36ed3@metux.net>
In-Reply-To: <50091cb8-37ee-4234-9fb8-47d148e36ed3@metux.net>
From: Thomas Albers <thomas.gameiro@googlemail.com>
Date: Sat, 10 Aug 2019 10:44:32 -0500
Message-ID: <CALYGOBXEZOk3k+tWCLjRhWmJ5e__ZwoAN2PvpOsFB0JYBox42w@mail.gmail.com>
Subject: Re: make_kernelconfig fails in OpenWRT buildroot
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hello!

> > Somehow, kconfig is not linked against libtinfow.
>
> can you make sure you don't have any ncurses pieces in your sysroot and
> retry ?

No ncurses in sysroot. The kconfig script worked when the sysroot's
pkg-config was disabled. Right now I think there are issues with the
way OpenWRT uses pkg-config.

Regards,
Thomas
