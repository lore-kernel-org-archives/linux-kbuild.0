Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E895310784
	for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2026 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342065; cv=none; b=ElZ7PufO9Dox4XJlTGv4nWq3vCAeIIYcekpp+8arvwWqJroZGdkGPozw1WdL5KzUZHw9oo/ZcVN1NiUvYE00TqB7GyZbKd7JPl06El1aAxg6m+ie3Y8BNPLEgv19UwikzvNqe3d16X+awRBaEg5kQri6kzelLyEJQjQK795NWvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342065; c=relaxed/simple;
	bh=F4gfl0+YMk4ioGpONVD79EZfw8vpMfcktCDSQJ6061I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lTNmutmgZceCpF6YT4n0u03jjWJ86Np+zjYGYgBOBHn+kpRsGssLfYf5Y7VXvLpjQOXf/0DiTs/NyquJVOYbxL1QUFbbOxIwlL+x1zmaUA0b8fe4E3Co0776VaJCAL3tyquNFQuPesUedzFeD7s/TXJQBx/vUNSqKOWx2qzcDfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShcgmJ9u; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShcgmJ9u"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso681985f8f.3
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2026 09:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792342061; x=1792946861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EnjrROwlUYtLbg1DZjsxtXuCk8E0M6SVTV0/eLvG49o=;
        b=ShcgmJ9ucl1pJplXjVLsArfDouBdEHDwbnFGeTNkK2xNU4qrVIMF54nVyliorb7u6j
         RtIMFSW8NeLkGwPdEMr9foBt1TxQtRncw3i3KEUF+QPHs46on6yd9SWg1IzkGNgSPi2U
         3bBKN7QGrx3fUBGga8IiDSWS1m4r6vexqcPFgiGbRnES68vWYFdI5CWX5WGXwsctBs3g
         bct2+NEBicR5a8TDbApbRyUBAsfzuoiaMt686eQOXbSYzxYmbbXbdHNSsFixOq8gMUi5
         UWxDM6bTguJnCBJzIuluTho8uyTSOe0Vx4x12jVqVuUiSUi+0rg6T0yy2Vn0Jz2jI5ii
         L1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792342061; x=1792946861;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EnjrROwlUYtLbg1DZjsxtXuCk8E0M6SVTV0/eLvG49o=;
        b=EdWwdjMdhB8HnXgpt7iDZlSPOpyV/3L+ol3tBiGvNCfY8yvQ081qtv/zwsNUtmQN02
         1mi/LH8wvpscszHZKJ5qDXo56aptbIWXWyh79glNvqQ5G4yKShhqIoq4Cq32QBO9trak
         xFkfvRVFSPuB+Gtt5cRukBATy6n7BiD51b9beIAaH2A6rqvrOfoeGkZw1R6r1Odw+sM9
         /u4ZuCrYm9DayoJ5uKhTh11nQzYlpMMZJfNbpP3HKs5pfdnHIxItMs2aJ8Gf+gWbhKrh
         qVi11Crot/dl3OIatxqOBbtqZt+BkP2Y6I1pV4EuQZEqZ+QCOPCYreH4S+AY2A9nljXY
         Sqsw==
X-Forwarded-Encrypted: i=1; AKwUvBwplkohF71KscOT+Ie2OPzIxTAEuXaTmCmHulVAzUnbbM2xjrbpFVKenqrJ9ElpWpArkWLkJjJiPz8FcUw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6nAG70io0pTKHl6BwuqdjugrGAT6k1JAFQFCg59ILs7wQC4bn
	37zCJVhBdVnKgs9JH0NQdXAL5+wgfVJZ1PooOTo6k5Rtq6lJ+5LduyTzcbR/mlzY
X-Gm-Gg: AYBFou0/VC55juSbcEGOeb3DD3FeQotG/GB+jf7pGdsQCcKmjh4CJsxxVH7zvYKwz9j
	EDjjvrgijFOpz5v7t19NK0FToRKjIlK69Lyi/YgMt4jBlhGTihssKUZLMCjQudPg3vdENODsVgJ
	7wJqjmum6O27jP6+6Vj6mRpQxp/IZrkNhihd8uR+x2sGpY5RFkY5yHFdDViGpXmWpTyzlV5yG+q
	fHsMX0C6btPjcZKnY3cQCP7hEz5Ku9Ol6XSGjoQOaJNzX1yXPPMtU3fzgSKU8G7eDGXWMysXatu
	OZ+w5A18uC7h369Dj9fP6Xw/5qVEFwr4JwWeYyxgfEPiUNHLAjJiOrXg09WDxBYop2XIeQ0ygqX
	HSsl3l2R6oHCmM6tlBf7I/Otm0fIvTkgiQOnT9EFwWfJAaSZlU5DABTDfvhhGhxk0tpK0WPdGr8
	ruEXRGl0gQ0Vk1AuYufOIhGZMKYwE7qLTp8PvDoiJ/In2xvlrhGQjGfL8TwrhwszG/ZjzjnTVfU
	QL4s4LZdZ2rOomFDcykezilMZdqfgg0mRw=
X-Received: by 2002:a05:6000:654:b0:48c:557d:ab24 with SMTP id ffacd0b85a97d-48e079800d3mr8049235f8f.4.1792342060574;
        Sun, 18 Oct 2026 09:47:40 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503d78sm17256266f8f.50.2026.10.18.09.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:47:40 -0700 (PDT)
Date: Sun, 18 Oct 2026 17:47:38 +0100
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Andrew Morton"
 <akpm@linux-foundation.org>, "Petr Mladek" <pmladek@suse.com>, "Kees Cook"
 <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, "Jim
 Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH 14/15] kallsyms: scripts/kallsyms: Reduce the output
 file size
Message-ID: <20261018174738.79ae97b3@pumpkin>
In-Reply-To: <sashiko-outbox-176260@kernel.org>
References: <20261018155206.132411-1-david.laight.linux@gmail.com>
	<20261018155206.132411-15-david.laight.linux@gmail.com>
	<sashiko-outbox-176260@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Oct 2026 16:05:41 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kallsyms: NULL dereference and offset mismatch in write_src() on unused tokens
> --
> 
> commit 20102d6e3b81d88a59f6ac3b9732c8a7b28d3f98
> Author: David Laight <david.laight.linux@gmail.com>
> 
> kallsyms: scripts/kallsyms: Reduce the output file size
> 
> This commit reduces the size of the assembly output generated by
> scripts/kallsyms by formatting byte values in decimal, packing multiple
> values per line for kallsyms_token_index and kallsyms_markers, moving the
> token tables first, and replacing duplicate symbol name comments with
> symbol offsets.
> 
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 189fb50ec8c58..8576fe6ad90b7 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c
> > @@ -350,6 +350,30 @@ static void write_src(void)
> >  	struct sym_entry *se;
> >  
> >  	printf("\t.section .rodata, \"a\"\n");
> > +	printf("\n");
> > +
> > +	output_label("kallsyms_token_table");
> > +	off = 0;
> > +	for (i = 0; i < 256; i++) {
> > +		best_idx[i] = off;
> > +		off += token_table[i].len + 1;
> > +		printf("\t.asciz\t\"%s\"\t/* %u: %u */\n",
> > +		       token_table[i].str, i, token_table[i].refs);
> > +	}  
> 
> [Severity: High]
> Can token_table[i].str be NULL here when fewer than 256 tokens are
> populated?

This is the same issue it found earlier in patch 11.

David

> 
> During pass 0 of a CONFIG_KALLSYMS=y build, scripts/link-vmlinux.sh runs
> scripts/kallsyms on an empty symbol file:
> 
> scripts/link-vmlinux.sh:kallsyms_step() {
>     ...
>     if is_enabled CONFIG_KALLSYMS; then
>         true > .tmp_vmlinux0.syms
>         kallsyms .tmp_vmlinux0.syms .tmp_vmlinux0.kallsyms
>     fi
>     ...
> }
> 
> When symbol_cnt is 0 (or whenever the input symbols do not populate all
> 256 entries), insert_real_symbols_in_table() leaves token_table[i].str as
> NULL and token_table[i].len as 0 for unreferenced tokens:
> 
> scripts/kallsyms.c:insert_real_symbols_in_table() {
>     ...
>     for (i = 0; i <= 255; i++) {
>         if (!token_table[i].refs)
>             continue;
>         token_table[i].len = 1;
>         token_table[i].str = xmalloc(2);
>         token_table[i].str[0] = i;
>         token_table[i].str[1] = 0;
>     }
> }
> 
> In optimize_result(), find_best_token() then returns -1 and breaks out of
> the loop before filling the remaining unused tokens.
> 
> When write_src() passes token_table[i].str to printf("%s"), isn't that
> undefined behavior that segfaults on non-glibc hosts (such as musl)? Also,
> on glibc hosts where printf("%s", NULL) outputs "(null)" (7 bytes
> including the NUL terminator in .asciz), off is only incremented by
> token_table[i].len + 1 (1 byte), which mismatches the actual size emitted
> into kallsyms_token_table and corrupts the offsets recorded in best_idx[].
> 
> [ ... ]
> 

