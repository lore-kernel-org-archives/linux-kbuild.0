Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f52.google.com ([209.85.215.52]:32914 "EHLO
        mail-lf0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934300AbcJQXgi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Oct 2016 19:36:38 -0400
Received: by mail-lf0-f52.google.com with SMTP id x79so321105304lff.0
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Oct 2016 16:36:37 -0700 (PDT)
MIME-Version: 1.0
From: Mike Lothian <mike@fireburn.co.uk>
Date: Tue, 18 Oct 2016 00:36:15 +0100
Message-ID: <CAHbf0-GUwQ4wneBW=G0MGr8RosQ=zqrXumYxG2kXWAdJC4Nczg@mail.gmail.com>
Subject: Kbuild Regression
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: viro@zeniv.linux.org.uk, mmarek@suse.cz, mmarek@suse.com, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi

I've raised https://bugzilla.kernel.org/show_bug.cgi?id=177741

Unfortunately I wasn't sure which component to file this under and I
was unable to CC any of your emails directly to the bug

I can't currently build the kernel with ld.gold I've bisected this back to:

commit 7f2084fa55e6cb61f61b4224d4a8bafaeee55f9f
Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Fri Jan 15 14:01:22 2016 -0500

   [kbuild] handle exports in lib-y objects reliably

   Collect the symbols exported by anything that goes into lib.a and
   add an empty object (lib-exports.o) with explicit undefs for each
   of those to obj-y.

   That allows to relax the rules regarding the use of exports in
   lib-* objects - right now an object with export can be in lib-*
   only if we are guaranteed that there always will be users in
   built-in parts of the tree, otherwise it needs to be in obj-*.
   As the result, we have an unholy mix of lib- and obj- in lib/Makefile
   and (especially) in arch/*/lib/Makefile.  Moreover, a change in
   generic part of the kernel can lead to mysteriously missing exports
   on some configs.  With this change we don't have to worry about
   that anymore.

   One side effect is that built-in.o now pulls everything with exports
   from the corresponding lib.a (if such exists).  That's exactly what
   we want for linking vmlinux and fortunately it's almost the only thing
   built-in.o is used in.  arch/ia64/hp/sim/boot/bootloader is the only
   exception and it's easy to get rid of now - just turn everything in
   arch/ia64/lib into lib-* and don't bother with arch/ia64/lib/built-in.o
   anymore.

   [AV: stylistic fix from Michal folded in]

   Acked-by: Michal Marek <mmarek@suse.cz>
   Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Reverting this commit allows the kernel to build again

I'm not subscribed to either mailing list to please can you make sure
I'm CC'd in any followups

Thanks

Mike
