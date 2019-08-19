Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vs1-f48.google.com ([209.85.217.48]:33077 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfHSBqw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Aug 2019 21:46:52 -0400
Received: by mail-vs1-f48.google.com with SMTP id i7so175802vsp.0
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Aug 2019 18:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <CALYGOBV9FERiui6mJDmQyAjaNASAOQ5z1k-6nCHQVB+c4XxmSw@mail.gmail.com>
 <CAK7LNAQSFdSZ5OctMkhXRmmXrq4S0cJ4Xy3MOd9iLF-Cs_VQMw@mail.gmail.com>
 <CALYGOBVauUutGGc8HNvLwue58AJp5DxOuM8b30XDgfbqJkLo1w@mail.gmail.com>
 <50091cb8-37ee-4234-9fb8-47d148e36ed3@metux.net> <CALYGOBXEZOk3k+tWCLjRhWmJ5e__ZwoAN2PvpOsFB0JYBox42w@mail.gmail.com>
 <e14fa0ff-e12c-85d1-7fc8-69e1d937b04f@metux.net>
In-Reply-To: <e14fa0ff-e12c-85d1-7fc8-69e1d937b04f@metux.net>
From: Thomas Albers <thomas.gameiro@googlemail.com>
Date: Sun, 18 Aug 2019 20:46:40 -0500
Message-ID: <CALYGOBWWKzDUyLthcroq=R4Vefqy3kp9HWG-cEweABBhf0zmMg@mail.gmail.com>
Subject: Re: make_kernelconfig fails in OpenWRT buildroot
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hello!

> Maybe have a closer look what it passes in $PKG_CONFIG (probably a
> wrapper script) and what the actual call behind is.

Openwrt does use a wrapper script for pkg-config, and when it comes to
making any kernel target a certain environment variable is undefined.
Consequently, pkg-config fails, returning the empty string, and the
kconfig scripts fall back to default values, which do no apply here.

It's an Openwrt issue; see Openwrt bug # 2423:
https://bugs.openwrt.org/index.php?do=details&task_id=2423

Regards,
Thomas
