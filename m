Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E77C3DB632
	for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2026 17:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792343063; cv=none; b=t2c0ibzJJwMfpgBwx3uTcc4Z1vqzjn8eqjy9ECqhXW+Uw2lESCGiFVBL2+vzvqkdEJUOEBvDxb6GPrVOsQkoZGkyw3prLxBWGNHjVEBQKVCN1CilMSed+RGGgFRHdP4FPUU+oN63NoIyLx1747WmYeySEF9qAv2IzX//6QAYQjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792343063; c=relaxed/simple;
	bh=BANAP3Lc2+23fb8EhfAtZycAwPmcAdi1P+vUVcemTXk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gGrx2TImzviryINSQBbEeiFKM/fZueF5i9WIvlGxvJ5VLMpR6gfpFFmiSZ10CeR20LncECzFnOodpVIunhupbCib6ElosPn1MsCEptS+nk61XtCGmnX+135kIiZwtSCdF6OaVJ1YNge60HfqJe6pZanAFY7DT4ZWIsINf4n4XM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da2uSpXn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da2uSpXn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a01933b584so9707075e9.0
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2026 10:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792343059; x=1792947859; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wy50q/WaZjVAL/j6YEk/xR6SqWVwPpcjikDOg01mdZo=;
        b=da2uSpXnCu1VdmX+rSWDwT45unwjuyK+lxZzcVR5PMzSPTZcyRKV4Hlndm4v8le+tU
         nJFzAB1o+2WKP0CRbLIKcqt03pJ3cTSz9t/k9gbDXizwoI8d3k0b9O3qvr6CYf/rQY3x
         JS+3LJQfe5Us9W8y0Cg6nkd20e81Ik4JNkXji9cJa75UtKUa8XWOyax9AZ6sxIGh6h97
         3d3b0+V4WUQXFAgzYBbUCK1U0K/53U4xBxgp63YjruHJIon30mo2wRrYDPefqmWsPJbe
         Kyg2hpUdkGaEv0xS/H8cfq0G9H2qzsjMBCR6G9Ill5MPPAs4cf5M8B+/WvOKmo5wno0p
         3PBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792343059; x=1792947859;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy50q/WaZjVAL/j6YEk/xR6SqWVwPpcjikDOg01mdZo=;
        b=FxeZ7Mt6ucAqHxLtQrsLFE6AasmvMTNO/RDFJK8R9OPxErh55JUrtDdLckPV/TcdBK
         inHHoxaXnKFC0iLh/DRJn9fO7Hk6hpoUV07KeytFVOWqrsR2NMJJeIUgT44tf9ULyf7m
         wHUrIgOh7515TyCUNskPG+29vhiGXG7QIjWAIRt44TnP7ja1UI3svSCNOQ6e+sMZ03t/
         XWvFahtohAisEBUJV/UWsP/lhGlCowGqgsyt1qmumAD3RZAWWpmiFPNCLKBdlM+55f6o
         4pPXhPFD3molWkt/FqeVKIuhrbhwihdWnq5YGI/41vy91iNWaqC0xUTfagCZVpbX3ghL
         AeTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQOAyi8UFvCRfeHRHb0T1IO81upc4R2FKAemjjNZeLhmUuILElB7ewLQHptsGdsDBv4iiohnxuX3pBl7U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1Fz91qDSgE+rDmldLYmTAP+hQLf2H7cvff1bTXvBIHNFjab8E
	1lSAZJVZWDZ60RhOx5R0WbhYZoKrzBTHrpvecMbVGiYrVD+zSlCcAnFU
X-Gm-Gg: AYBFou3+fo2M7rtnvmdacz+LASEd1wAt1al+VNItW3dUgi0d3T3Qg1rh3slkCpp2gdq
	6z94bFBu5sM7iooXAZCo0GsiQHyLf+REKJTdwxi3X51lbF00+ATuYug62hbjY7RxuBRkxB3EnL2
	1ZbB+qXEBeiI/w1EmLcevTIeADb26mIv/ZmQVEb7dbCrTTaYX+BlCAOa2ROQt/uiSvY0iEarlzI
	i/t7JAReutzenJkti4lz5XaEeh6qF32JdUNgGgbg1VT6lChlCMzSxxqd6+I4mBNSm7bjxKlXp0T
	9y2mK7wxKZnT+xod6kv5uvn25u9f3HqRMbf9dYUbDiPZzsdtRwcT/ynLONwJ6P8Prh+lkjssGYL
	ADLTkP/ZQCs7cA50OxlRgmX607lmVDbxpSiy6e4P/hsKMvEF3zcy57dSNLec9VUYYzCXTFmFALr
	AMZY3y/7UTxuTRNbC4K7IuOHuAkHZAzAO5F8OWUzQCKbu/UPXv95HI2hUQ+3ZhrOIzPvhloL50/
	2Q/zEvBPYdKWjBSi4UMO62/DDwFwB32L0E=
X-Received: by 2002:a05:600d:4444:20b0:4a1:b027:99dc with SMTP id 5b1f17b1804b1-4a1d760098dmr81877465e9.18.1792343059298;
        Sun, 18 Oct 2026 10:04:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm17494036f8f.42.2026.10.18.10.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:04:18 -0700 (PDT)
Date: Sun, 18 Oct 2026 18:04:17 +0100
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Andrew Morton"
 <akpm@linux-foundation.org>, "Petr Mladek" <pmladek@suse.com>, "Kees Cook"
 <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, "Jim
 Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v2 next 06/15] kallsyms: Optimise symbol name search
Message-ID: <20261018180417.5438751b@pumpkin>
In-Reply-To: <sashiko-outbox-176273@kernel.org>
References: <20261018155206.132411-1-david.laight.linux@gmail.com>
	<20261018155206.132411-7-david.laight.linux@gmail.com>
	<sashiko-outbox-176273@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Oct 2026 16:15:56 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] kallsyms: race in set_kallsyms_off_size() causes NULL dereference
> - [High] kallsyms: set_kallsyms_off_size() sleeps in atomic context
> --
> 
> commit d36232e927821c82911022ce5bae7cb3de465edd
> Author: David Laight <david.laight.linux@gmail.com>
> 
> kallsyms: Optimise symbol name search
> 
> This commit optimizes symbol name lookups by indexing the compressed
> names table directly instead of the array of symbol values. It supports
> both 24-bit and 32-bit offset tables, selecting between them using a
> static branch initialized on the first symbol lookup.
> 
> > diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> > index d18d78e626db2..31451feac8221 100644
> > --- a/kernel/kallsyms.c
> > +++ b/kernel/kallsyms.c  
> 
> [ ... ]
> 
> > @@ -185,14 +216,19 @@ unsigned long kallsyms_sym_address(int idx)
> >  	return (unsigned long)offset_to_ptr(kallsyms_offsets + idx);
> >  }
> >  
> > -static unsigned int get_symbol_seq(int index)
> > -{
> > -	unsigned int i, seq = 0;
> > +static DEFINE_STATIC_KEY_TRUE(kallsyms_off_size_24);
> >  
> > -	for (i = 0; i < 3; i++)
> > -		seq = (seq << 8) | kallsyms_seqs_of_names[3 * index + i];
> > +static inline unsigned int get_symbol_name_offset(unsigned long index)
> > +{
> > +	if (static_branch_likely(&kallsyms_off_size_24))
> > +		return kallsyms_off24_of_names[index].v;
> > +	return kallsyms_off32_of_names[index];
> > +}
> >  
> > -	return seq;
> > +static void set_kallsyms_off_size(void)
> > +{
> > +	if (kallsyms_off_size != 24)
> > +		static_branch_disable(&kallsyms_off_size_24);
> >  }  
> 
> [Severity: High]
> Can calling static_branch_disable() in set_kallsyms_off_size() sleep in
> an atomic or early-boot context when kallsyms_off_size != 24?

Any suggestions on how to get the static branch set early enough?

...
> 
> [Severity: High]
> Does DO_ONCE_LITE(set_kallsyms_off_size) allow a concurrent caller to
> dereference NULL in get_symbol_name_offset() when kallsyms_off_size == 32?

I should have just open-code the 'do once'.
It doesn't matter if it is called twice.

But it looks as though I can't patch the code from there anyway.

David
