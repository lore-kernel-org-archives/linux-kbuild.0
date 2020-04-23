Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbgDWSrX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 14:47:23 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C4DC09B042
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Apr 2020 11:47:23 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id 7so3906792pjo.0
        for <linux-kbuild@vger.kernel.org>; Thu, 23 Apr 2020 11:47:23 -0700 (PDT)
Date: Thu, 23 Apr 2020 11:47:16 -0700
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH] recordmcount: support >64k sections
Message-ID: <20200423184716.GA257363@google.com>
References: <20200422232417.72162-1-samitolvanen@google.com>
 <20200422200532.480face2@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200422200532.480face2@oasis.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Matt Helsley <mhelsley@vmware.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 22, 2020 at 08:05:32PM -0400, Steven Rostedt wrote:
> On Wed, 22 Apr 2020 16:24:17 -0700
> Sami Tolvanen <samitolvanen@google.com> wrote:
> 
> > When compiling a kernel with Clang and LTO, we need to run
> > recordmcount on vmlinux.o with a large number of sections, which
> > currently fails as the program doesn't understand extended
> > section indexes. This change adds support for processing binaries
> > with >64k sections.
> 
> Thanks! As you have also Cc'd Matt Helsley, perhaps you have noticed we
> are trying to get this code merged with objtool.
> 
> How would that affect this?

Yes, I saw the patches. If you are copying over code, a similar fix
might be needed, but otherwise I don't see any issues. I also sent a
patch for objtool a couple of days ago to support >64k sections:

  https://lore.kernel.org/lkml/20200421220843.188260-2-samitolvanen@google.com/

Sami
