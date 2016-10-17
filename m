Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:34974 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756265AbcJQG7U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Oct 2016 02:59:20 -0400
From: Mathieu OTHACEHE <m.othacehe@gmail.com>
Subject: Re: [GIT PULL] kbuild changes for v4.9-rc1
In-reply-to: <20161017145709.2882f33f@roar.ozlabs.ibm.com>
Date: Mon, 17 Oct 2016 08:57:13 +0200
Message-ID: <878ttnjwdy.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: Omar Sandoval <osandov@osandov.com>, Michal Marek <mmarek@suse.com>, Linus Torvalds <torvalds@linux-foundation.org>, adobriyan@gmail.com, sfr@canb.auug.org.au, viro@zeniv.linux.org.uk, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


Hi,

>> Reverting 784d5699eddc ("x86: move exports to actual definitions") fixes
>> it for me. This is with GCC 6.2.1, binutils 2.27, attached config.

I've had the same problem. Reverting your binutils from 2.27 to 2.26,
will also fix it. It seems ld 2.27 is not merging weak symbols from .o
files to vmlinux when linking.

Anyhow all crc for symbols exported from .S will be 0, so Nicholas
patch make sense.

Mathieu
