Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgEQX3s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 19:29:48 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60588C061A0C
        for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2020 16:29:48 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id v128so7541910oia.7
        for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2020 16:29:48 -0700 (PDT)
MIME-Version: 1.0
From: Ed Spiridonov <edo.rus@gmail.com>
Date: Mon, 18 May 2020 02:29:35 +0300
Message-ID: <CACm0Nn02AmTtgocnCgbzWGwFGODovEzGsoASukmuRCQ5-28PFQ@mail.gmail.com>
Subject: kconfig: dependency handling
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi

I encountered a dependency error while executing 'make config' in a
patched Buildroot.

After some investigation, I found that such a file causes a dependency issu=
e:
config LIB1
 bool

config LIB2
 bool

config A
 bool
 select LIB1 if !LIB2

config B
 bool
 select LIB2 if !LIB1

(both A and B could use either of LIB1 or LIB2, but I prefer LIB1 for
A and LIB2 for B).

The error message is puzzling, there is nothing about A and B, only
LIB1 and LIB2 is mentonied:
Config.in:1:error: recursive dependency detected!
Config.in:1:    symbol LIB1 is selected by LIB2
Config.in:4:    symbol LIB2 is selected by LIB1
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

It is clear what is happening in this short example, but I spent
several hours to find the reason  on a real config with hundreds and
hundreds of packages.

0. Is it possible to easily fix kconfig so that it does not produce an
error on this file? (I guess no)
1. Could the error message be more specific?
2. Should documentation be improved?
I suppose this case could be mentioned in
Documentation/kbuild/kconfig-language.rst
Maybe the example above should be added as
Documentation/kbuild/Kconfig.recursion-issue-03

P.=E2=80=AFS. This is not a Buildroot-specific issue, I have checked vanill=
a
kconifg with the same result.
