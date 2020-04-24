Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726793AbgDXTSl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Apr 2020 15:18:41 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30C1DC09B049
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Apr 2020 12:18:40 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x2so1535438pfx.7
        for <linux-kbuild@vger.kernel.org>; Fri, 24 Apr 2020 12:18:40 -0700 (PDT)
Date: Fri, 24 Apr 2020 12:18:32 -0700
From: Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH] recordmcount: support >64k sections
Message-ID: <20200424191832.GA231432@google.com>
References: <20200422232417.72162-1-samitolvanen@google.com>
 <20200423214734.GB9040@rlwimi.vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200423214734.GB9040@rlwimi.vmware.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matt Helsley <mhelsley@vmware.com>, "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Matt,

On Thu, Apr 23, 2020 at 02:47:34PM -0700, Matt Helsley wrote:
> > +static unsigned int get_shnum(Elf_Ehdr const *ehdr, Elf_Shdr const *shdr0)
> 
> I noticed this returns an unsigned int ...
> 
> > +	Elf_Shdr *const shdr0 = (Elf_Shdr *)(old_shoff + (void *)ehdr);
> > +	unsigned const old_shnum = get_shnum(ehdr, shdr0);
> 
> While this is not explicitly called out as an unsigned int. Perhaps we
> could just make this and new_shnum explicit unsigned ints and then...

> > +	if (!ehdr->e_shnum || new_shnum >= SHN_LORESERVE) {
> > +		ehdr->e_shnum = 0;
> > +		shdr0->sh_size = w(new_shnum);
> > +	} else
> > +		ehdr->e_shnum = w2(2 + w2(ehdr->e_shnum));
> 
> If we make the unsigned int change proposed above can we reuse new_shnum
> here like so:
> 		ehdr->e_shnum = w2(new_shnum);
> 
> So this if/else is doing the inverse of get_shnum(). I think the code
> could be cleaned up a little and prepare for moving to objtool by
> putting it in a helper function.

Sure, sounds good to me.

> > +	for (relhdr = shdr0, k = nhdr; k; --k, ++relhdr) {
> > +		if (relhdr->sh_type == SHT_SYMTAB)
> > +			symtab = (void *)ehdr + relhdr->sh_offset;
> > +		else if (relhdr->sh_type == SHT_SYMTAB_SHNDX)
> > +			symtab_shndx = (void *)ehdr + relhdr->sh_offset;
> > +
> > +		if (symtab && symtab_shndx)
> > +			break;
> > +	}
> 
> Could you break this out into a helper function? find_symtab() maybe? Again, I think
> that helper would go away with conversion to objtool.

Agreed, this wouldn't be needed with libelf. I'll send v2 shortly.
Thanks for the review!

Sami
