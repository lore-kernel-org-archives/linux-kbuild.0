Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga17.intel.com ([192.55.52.151]:24872 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751955AbeA1Sdp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jan 2018 13:33:45 -0500
Date: Sun, 28 Jan 2018 10:33:35 -0800
From: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH 20/21] Kbuild, lto: Add Link Time Optimization support
Message-ID: <20180128183335.GR26209@tassilo.jf.intel.com>
References: <20171127213423.27218-1-andi@firstfloor.org>
 <20171127213423.27218-21-andi@firstfloor.org>
 <CAK8P3a3RQhiEkh6uUjdX-juXggNdZxvxRPJbE6M3e6Dy-ycGxw@mail.gmail.com>
 <20180127005554.GM26209@tassilo.jf.intel.com>
 <CAK8P3a2koJV=ncMa=5fkQXV=Jj6CnScy-nN2gsfHiAeeePsHPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2koJV=ncMa=5fkQXV=Jj6CnScy-nN2gsfHiAeeePsHPA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andi Kleen <andi@firstfloor.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>, samitolvanen@google.com, alxmtvv@gmail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Andrew Morton <akpm@linux-foundation.org>

> 
> kallsyms failure: relative symbol value 0xffffffff81000000 out of
> range in relative mode
> 
> I seem to get that all the time here, and have also disabled it for now,
> but it sounds important (and breaks the build).

Need to take a look at it. 

I had some patches that completely revamped kallsyms as part of the single
pass linking, but I dropped them again because they still had too many 
issues.

-Andi
