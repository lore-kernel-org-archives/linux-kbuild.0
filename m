Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41380 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726777AbfCRTVb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 15:21:31 -0400
Date: Mon, 18 Mar 2019 15:21:27 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v2 8/8] documentation: Update on livepatch elf format
Message-ID: <20190318192127.GA23238@redhat.com>
References: <20190301141313.15057-1-jmoreira@suse.de>
 <20190301141313.15057-9-jmoreira@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190301141313.15057-9-jmoreira@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joao Moreira <jmoreira@suse.de>
Cc: live-patching@vger.kernel.org, mbenes@suse.cz, pmladek@suse.cz, jikos@suse.cz, nstange@suse.de, jpoimboe@redhat.com, khlebnikov@yandex-team.ru, jeyu@kernel.org, matz@suse.de, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, michal.lkml@markovi.net

On Fri, Mar 01, 2019 at 11:13:13AM -0300, Joao Moreira wrote:
> Add a section to Documentation/livepatch/module-elf-format.txt
> describing how klp-convert works for fixing relocations.
> 
> Signed-off-by: Joao Moreira <jmoreira@suse.de>
> ---
>  Documentation/livepatch/module-elf-format.txt | 47 ++++++++++++++++++++++++---
>  1 file changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/livepatch/module-elf-format.txt b/Documentation/livepatch/module-elf-format.txt
> index f21a5289a09c..6b0259dfab49 100644
> --- a/Documentation/livepatch/module-elf-format.txt
> +++ b/Documentation/livepatch/module-elf-format.txt
> @@ -2,7 +2,8 @@
>  Livepatch module Elf format
>  ===========================
>  
> [ ... snip ... ]
>
> +--------------------------------------------------
> +4.  Automatic conversion of unresolved relocations
> +--------------------------------------------------
> +Sometimes livepatches may operate on symbols which are not self-contained nor
> +exported. When this happens, these symbols remain unresolved in the elf object
> +and will trigger an error during the livepatch instantiation.
> +
> +Whenever possible, the kernel building infrastructure solves this problem
> +automatically. First, a symbol database containing information on all compiled
> +objects is built. Second, this database - a file named Symbols.list, placed in
> +the kernel source root directory - is used to identify targets for unresolved
> +relocations, converting them in the livepatch elf accordingly to the
> +specifications above-described. While the first staged is fully handled by the
                                                   ^^^^^^
nit: s/staged/stage

> +building system, the second is done by a tool called klp-convert, which can be
> +found in "scripts/livepatch".
> +
> +When an unresolved relocation has as target a symbol whose name is also used by
> +different symbols throughout the kernel, the relocation cannot be resolved
> +automatically. In these cases, the livepatch developer must add annotations to
> +the livepatch, making it possible for the system to identify which is the
> +correct target amongst multiple homonymous symbols. Such annotations must be
> +done through a data structure as follows:
> +
> +struct KLP_MODULE_RELOC(object) data_structure_name[] = {
> +	KLP_SYMPOS(symbol, pos)
> +};
> +
> +In the above example, object refers to the object file which contains the
> +symbol, being vmlinux or a module; symbol refers to the symbol name that will
> +be relocated and pos is its position in the object.
> [ ... snip ... ]

Should we be explicit about how position is counted?  First = 1, second
= 2, etc?  See the off-by-one bug I pointed out in the "livepatch: Add
klp-convert tool" patch earlier.

-- Joe
