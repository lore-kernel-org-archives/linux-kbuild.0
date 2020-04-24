Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ex13-edg-ou-001.vmware.com ([208.91.0.189]:32761 "EHLO
        EX13-EDG-OU-001.vmware.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725874AbgDXWWS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Apr 2020 18:22:18 -0400
Date: Fri, 24 Apr 2020 15:22:14 -0700
From: Matt Helsley <mhelsley@vmware.com>
Subject: Re: [PATCH v2] recordmcount: support >64k sections
Message-ID: <20200424222214.GC9040@rlwimi.vmware.com>
References: <20200422232417.72162-1-samitolvanen@google.com>
 <20200424193046.160744-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200424193046.160744-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 24, 2020 at 12:30:46PM -0700, Sami Tolvanen wrote:
> When compiling a kernel with Clang and LTO, we need to run
> recordmcount on vmlinux.o with a large number of sections, which
> currently fails as the program doesn't understand extended
> section indexes. This change adds support for processing binaries
> with >64k sections.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Feel free to add

Reviewed-by: Matt Helsley <mhelsley@vmware.com>

> ---
> Changes in v2:
>  - Switched to unsigned int for (old|new)_shnum in append_func.
>  - Added set_shnum and find_symtab helper functions and moved
>    the new logic there.
> 
> ---
>  scripts/recordmcount.h | 98 +++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 92 insertions(+), 6 deletions(-)

<snip>
