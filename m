Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f196.google.com ([209.85.222.196]:34879 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfEOSzJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 14:55:09 -0400
Received: by mail-qk1-f196.google.com with SMTP id c15so696149qkl.2
        for <linux-kbuild@vger.kernel.org>; Wed, 15 May 2019 11:55:09 -0700 (PDT)
MIME-Version: 1.0
From: Ivan Babrou <ivan@cloudflare.com>
Date: Wed, 15 May 2019 11:54:54 -0700
Message-ID: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
Subject: Linux 4.19 and GCC 9
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: kernel-team <kernel-team@cloudflare.com>, miguel.ojeda.sandonis@gmail.com

Hey,

It looks like it's not possible to build Linux 4.19.43 (latest LTS as
of today) with GCC 9.1 (latest stable GCC). From what I see, some
support for GCC 9 was added by Miguel (cc'd) in 4.20, but it was never
backported into 4.19.

Should this happen or is 4.19 stuck on GCC 8?

I've tried doing this manually first, but it seems beyond a quick fix
with a few backports for me:

1. Disable perf (breaks on -Werror=stringop-truncation)
2. Apply https://lore.kernel.org/patchwork/patch/1005478/
3. Try applying https://lore.kernel.org/patchwork/cover/1040185/ and
discover a missing file
4. Discover that more things changed:
https://github.com/torvalds/linux/commits/master/include/linux/compiler_attributes.h
