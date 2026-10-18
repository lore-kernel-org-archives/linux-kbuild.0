Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDA03A83AC
	for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2026 16:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341456; cv=none; b=pSqcI1m0kGAokOfnifyGdkHaE8XnfffRzs4IWhMtl1I36HKN4kLtyJBAKlIOxYPQCpZcEOddbbyQ9NAFfi9tRXSLqLMEzv/UfF4DVdGCPrNAPfpa7hZeKb1tnz2vOonk6kVXpzPKHXVkTwbSTgw7HscnYzKPDp9XrOZ7nxtYvzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341456; c=relaxed/simple;
	bh=Dn4leQDbq1m2uRP6oBxoD4WvGafxPMKi/15ipQiHAi8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tx+hUJu8ElE5RLX0ERTmQAE7BK+yi/GPxEqxYFoktRjaEJtCTz9tr2AYEovQW5w0bpKHyB33JuEY1bOzKdfhK/akpIfW/uoQenO8gmFp1kVHtmWleYG0KXadF06wUy7opFExsLdPJcqcHTozTiOGnQ579ha+7cniLkmO8JrPYic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJpuPVzg; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJpuPVzg"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso678573f8f.3
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Oct 2026 09:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341442; x=1792946242; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ua6j+thg4pXL7S9wJjMaHKA5Xj0iNYktIJ1108GNG0g=;
        b=mJpuPVzgqQPFcwoo1L6pEA/TslRAE2R1gmXrKcFArmF9WjqxWBdHcaYfjSm4sOAG4c
         T4NIb5jOJX0fkepYWcGbLcqtCV7o5wq3rK81IJKQv2hvlrmGkNosv4NMB22Ld6I26e0S
         Aa8rpFtLqOoiUQiohX/ZERFZNTO+aaut5s/2R3dgG4nWRn89JDKMaK+lGDpNk9nq81LQ
         v+m8jirZY2ZM5DJ8YyfrFeT49l+6FcYs/NLJwzU4HHy2tc/j057LuvmuaUUGLsovHbjq
         x+P6lO4SPtaZfwu9goSxdC27ikY7J+oCR+ucDWMMsMbj2vXVZfuFy6WOugVWfJWDOny4
         bL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341442; x=1792946242;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ua6j+thg4pXL7S9wJjMaHKA5Xj0iNYktIJ1108GNG0g=;
        b=gupGaMy++cSHSD1iWtensVybwHBprjHfCPCkAUTjqbFVyIk/QvgoEMGS5m8xV3SzBW
         AYGPlQdkePQdBxM5hwXZP0R5nCsMeU5Sl7xKcRf5BAQGDPDof8WP4V8r7JnU7Iel6Hh+
         mcIev2875vcUcMMSszP+DLLTkws91MuUT3hye0w0zkSGT2BMQLF8hTFHOaHIn8e9zOJE
         VnI9PyBIUVj3MKQB9YCVW6Sum2QKekYEjVEYzor5dG3B9s+yNSlLGn7qNifjZ/3wtX/D
         Xxi966s3kwVOPFGFblyAvZarfR7d75PbVfERma/7DKbgNG/qKJyIJ/Es80YJeBWntL/c
         EnDQ==
X-Forwarded-Encrypted: i=1; AKwUvByi6Vjvh5vf8vT1k2MsmFXznG/h2f6Djt6gBaeLNozZPwqv8YO334giA+oz2xtO0WnX8c1tXsVRDn0lorU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLPUl+NVvJzzqHmUbuQGF6os2ym4KHjS+lrlrUAo813s9gsyZNa
	GPDSqKs4njZI5ow3f1LKrIGKWufjqCE9EfWWa2XUcxjTtsLgXgpkTzzm
X-Gm-Gg: AYBFou2ZD/k1mHInJQk3F1Bm9Dj2HG+bBvmPhcvcwE5A5jOOoIxEdnlc4MllnjQ02ih
	5Q9APDHswvAXy+uZ5XaHw6exNKz0yLzmkuuEXW1aQZGUAKOJKEBLo0gsfq6bMFflYGt5TkLGMAN
	V0oGNM1uYZlCHzAQxAjcELt3SfBgklGudwEF5myqN6zhGIRnV7BiAZuDMojLrmEYlLKIoMHMIVX
	cgdMue8IaaX/6ZzoDOYyok19xuHBLWBaGcuisWFDwglvSOMwbZksoX415eRl6q3cOLODdNhiv7c
	HqUJ7Ic0lqF9y7qX9XNsf6EcD8XBuNg3+/EhojlAP7NreHQ8E8lEnmllQNy6SfX2SmEuh6L8ohq
	866Y4rnawq4b62lGS7hEYzJtWv9YNykmgp2mqaMN8j9DY1J6BqnJ+2ct91YZPYQoO5Erex72lwj
	QAwbWD975eL5xloTgQOE1GJkwrhBCJapfl8NMNQpt9zcPcykBKbEs5oBdtpBukJ0WpZcE9JzRDt
	YsKfd3JFa5ikEfX3lzc+dCTHYeuWlT7fFg=
X-Received: by 2002:a05:6000:4382:b0:48e:932:aef5 with SMTP id ffacd0b85a97d-48e0932b0d7mr10246501f8f.21.1792341442100;
        Sun, 18 Oct 2026 09:37:22 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd5033a2sm17651691f8f.45.2026.10.18.09.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:37:21 -0700 (PDT)
Date: Sun, 18 Oct 2026 17:37:20 +0100
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Andrew Morton"
 <akpm@linux-foundation.org>, "Petr Mladek" <pmladek@suse.com>, "Kees Cook"
 <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, "Jim
 Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v2 next 11/15] kallsyms: scripts/kallsyms: Keep full
 expansion of tokens
Message-ID: <20261018173720.142adfde@pumpkin>
In-Reply-To: <sashiko-outbox-176255@kernel.org>
References: <20261018155206.132411-1-david.laight.linux@gmail.com>
	<20261018155206.132411-12-david.laight.linux@gmail.com>
	<sashiko-outbox-176255@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Oct 2026 16:00:02 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] kallsyms: NULL token_table[].str passed to printf() in write_src()
> --
> 
> commit b464b94e58431a4ad1ec112c739d63f16547b8f2
> Author: David Laight <david.laight.linux@gmail.com>
> 
> kallsyms: scripts/kallsyms: Keep full expansion of tokens
> 
> This commit stores the full NUL-terminated string expansion for each token
> in token_table[] as tokens are allocated, avoiding recursive symbol
> expansions later.
> 
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 5603b2a6c77bd..9e1bc0fdaa9f2 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c  
> [ ... ]
> > @@ -415,9 +403,8 @@ static void write_src(void)
> >  	off = 0;
> >  	for (i = 0; i < 256; i++) {
> >  		best_idx[i] = off;
> > -		expand_symbol(token_table[i].ch, token_table[i].len, buf);
> > -		printf("\t.asciz\t\"%s\"\n", buf);
> > -		off += strlen(buf) + 1;
> > +		off += token_table[i].len + 1;
> > +		printf("\t.asciz\t\"%s\"\n", token_table[i].str);
> >  	}
> >  	printf(".size kallsyms_token_table, . - kallsyms_token_table\n");
> >  	printf("\n");  
> 
> [Severity: High]
> Can token_table[i].str be NULL here when some token slots remain unused?

Probably :-(

> In insert_real_symbols_in_table(), token_table[i].str is only allocated for
> character codes present in the input symbols:
> 
> 	for (i = 0; i <= 255; i++) {
> 		if (!token_table[i].len)
> 			continue;
> 		token_table[i].str = xmalloc(2);
> 		token_table[i].str[0] = i;
> 		token_table[i].str[1] = 0;
> 	}
> 
> Then in optimize_result(), the loop stops early as soon as find_best_token()
> finds no remaining token pairs with positive profit:
> 
> 		best = find_best_token();
> 		if (best < 0)
> 			break;
> 
> Any remaining unused entries in token_table[] keep len == 0 and str == NULL.
> During pass 0 in scripts/link-vmlinux.sh, kallsyms is invoked on an empty
> symbol file (.tmp_vmlinux0.syms), leaving all 256 token_table[i].str
> pointers as NULL.
> 
> Previously, expand_symbol() wrote an empty string into buf when len was 0.
> Passing a NULL token_table[i].str to printf("%s") in write_src() causes a
> segmentation fault on non-glibc hosts (such as musl) or prints "(null)" on
> glibc hosts while advancing off by only 1 byte, which corrupts
> kallsyms_token_table and best_idx[].

For glibc builds it won't really matter - that corrupt file doesn't matter
and in reality there are always enough symbols.

I'll add ?: "" to the code.

David


