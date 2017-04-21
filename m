Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0043.hostedemail.com ([216.40.44.43]:60757 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1040602AbdDUVCc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 17:02:32 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 72E7011A48B
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Apr 2017 20:56:35 +0000 (UTC)
Message-ID: <1492808184.30293.36.camel@perches.com>
Subject: Re: [RFC PATCH 0/2] kbuild: use relative path from $(srctree)
 instead of __FILE__
From: Joe Perches <joe@perches.com>
Date: Fri, 21 Apr 2017 13:56:24 -0700
In-Reply-To: <1492801407-26823-1-git-send-email-yamada.masahiro@socionext.com>
References: <1492801407-26823-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, x86@kernel.org, Michal Marek <mmarek@suse.com>, Sam Ravnborg <sam@ravnborg.org>, Linus Torvalds <torvalds@linux-foundation.org>

On Sat, 2017-04-22 at 04:03 +0900, Masahiro Yamada wrote:
> Kbuild works in objtree, not in srctree.  So, __FILE__ is prefixed
> with $(srctree)/ for out-of-tree build.
> 
> It would be nice to see the same log regardless
> in-tree, or out-of-tree build.
> 
> 1/2 adds a new macro KBUILD_FILE.  This points the relative path
> of the file we are building.  This is intended to replace __FILE__.
> 
> 2/2 replaces __FILE__ in bug.h as an example.  This will improve
> the output of WARN_ON() etc.

Good idea.

Perhaps a lot of the in-tree __FILE__ uses should be
KBUILD_BASENAME or another new type like KBUILD_PRETTY_FILE

