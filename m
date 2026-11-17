Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913576;
	b=5Ev6/8VGTKSe6SHZ2jmGlML3OvU8xGcQfuf5yKNNJt3/vFTCnpZD0aeqfpuTb64KKK7U
	 SSd/z+DaxdkYHnT4x1TLJd42biRE3zxQCsZ8FUny+1Nslc9biKMf4KNRSqsb26Fady5GP
	 JmJX2uV9cu6SRQF45N8bWPb8VtatWbFvSvjfrTZcKMmdbZYEw7R2abd1X9ZV7SrTWQ7VP
	 PXEGerjKRGkWqMb11u9OrVXPMwSeL8Kw/SKkT1Jyi/U7dTmfUKGZvOcjA2zAR978fganB
	 MTwx1Bm+25XbxyBHBTqHVxNhcCTrT3PZjNmZKivwmHtM7uhYElJHigJ/QNezFCHt6fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ChkKaHHAKUklGidpwJFPREnCjwZb6wuXyqrdGtCbZ5c=;
	b=1CTFB/XHvqWMJSEAAImvfaCRYZvkIbytTPdUQBqig1t5RjslEaOiDcW2pIZjKfxnL5V3
	 EtegzwrxxQSX3pe+Vd4fN+5T7a4f4vO5RRX/k3y4NPIunQaykbzuHZsCRFPOAxseMJEd0
	 Ja+KjIpoZ6hJ0cxUXfNu/yqC/A4H7OZR8gAINOsH1Fv5fZLman27wakwFi/kFOHtYP66r
	 cI7neVRq3ZBPsbxzEwJBFZQJdAMhDmrhyVNIjWx9uUCqGns02uCGktzHGm9picefRzxIT
	 jQeBMKC5/ftm+a6p4H+xOHLH19Vj6IUJZGy3G703KsBFp+09FuOwiax/SFtQENGp4XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JVjQKwXi;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AAF606A329
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 11:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0AAF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JVjQKwXi
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490d59c3edaso539595f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 03:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913574; x=1795518374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ChkKaHHAKUklGidpwJFPREnCjwZb6wuXyqrdGtCbZ5c=;
        b=JVjQKwXiRy8XPxYTeUjq7l5tiyCjUt7YGOzTla9jHdUnMrkmhfCR4t7M2If0v8s945
         F9TXMBxpxt5QZgL6sJnghTgjBGn36kT80CXs9R9oaOrzqUvLsXYxqtHOr+y9K3nLAWwS
         j7CqR8FWHBqZDqxP1NFGm2EzjQBBNa3Bc0ZcBZ2+nirtHhEecVH4Zzno8qwhjZ/z7QAx
         ccIgxn3UFeEcrAdEYU+P7EodkaE7fBA2tJItJ0phlUztTqYfNe0cFdyCdwt2PRhCraEL
         aR4RegYCM9nfTwcUspoN1ih5bRI+1Pj35/WWwzl0O3zQN7vgAscg7ZszlfUf/Ps3RKR3
         GaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913574; x=1795518374;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ChkKaHHAKUklGidpwJFPREnCjwZb6wuXyqrdGtCbZ5c=;
        b=YE5PHDIJb934EP+6TTD7cCHLsIqA8Iqe8bJtyPqyx/UD2tu0gqZ+4i+BjnnRFpr7+N
         7KBu3Bep8LkiMXRsjsJPqT3xvbCej+v8hRogMQDJOP6xPjb3PAoD+sz5a15MVtkUBrxa
         0TCw57mLXUHizFMMsdxI2cNBfPqo0EFkFqbs83TByA0kSOwPCQLhwAT87G9gNBwvrGL4
         oFTXf+8vhUJuvlCBKEJsmaXJvzM5M+oueCABujRcoluC3yUy78v465AusMjiG/fKj0pv
         Taq+gFHHr8g6p1nvYJwFcVVa9pxSIcHG2BGiGGNmN3A/xaJguChShnLcLNv8VG/af7UU
         G0hQ==
X-Forwarded-Encrypted: i=1; AL+hErGAr7TS6JQjo65/CSPyiP/4DRnf2P2WY94v8WM76vM2eW8fLSq/sY+cs64fwxi8GIh6U5xHjf3y3bdYfhg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uD1bZyEKQ1cpttciS6ZE/NUkP0ik99nSJb72egj4U5L8GHcb8
	vfFeGYLyt2gHje0C4pWQpq7CoOgnVyQQq0n5b9TMSvSdWHRwt+SB9Enr
X-Gm-Gg: AZFdTZfwx3p5bcUbX/G8YVLXJd+EMoHmJ8lhDMdS28Ro3k9uSGj99sw59uEQZWzkd4m
	Tl3aZpwc6n2mMxbeyo+nx3WiRdN+25Pvwm3gFEVcUhXx/EJTGm+D/pw4PjvYax4iazCTbLkWKqZ
	cFy28scOV6WFNN0KyCBjLt/ycxEfNH88T4zA8vmzq5j7L+HjNV8WAERLnht4+vsHb1oRXtssYhP
	r5xay+XBZ3LfiFXxsquBDoiikV7bKeNRr/UOaWK8PXTiTxks7i2JAcWB+h2hVJULNNIsDimpmDe
	82QUE/7nQjcdGeQtOz7lh64kCJn/SCQZcAwBnB0NGuicqVVjYgy989hkWBlEuxmQp/RMyXrJqts
	TG7tRPgeF7xXl3+FmE6gGCkFKGaGONXyBbNTFlreH2sxzuaA0gfmuPANdzJ8EucTv9Lcc0z15fn
	EWCp2UcxS0Hl20V6i8XNgN4XN0Nrc4jd52m8EuoS5AAOxiGrc0asdIfWUUL3hAxBOxDKtSWGsI5
	yqCABe5dcMQxG9WXQ2lAvKJ+pGEB6mtPvLOK3FsGjadTdb72i77q82U8deXRyVkrOIsmvzfMbI7
	z3qGydK4/Yksc0tWbND5REWULgDv+zJry9hjo6d7cJTiTJGOpbmiSb0UrK2T/bb0Qg==
X-Received: by 2002:adf:e18a:0:b0:48e:3c5f:a24e with SMTP id ffacd0b85a97d-4a3735b4249mr4831257f8f.11.1794913573701;
        Tue, 17 Nov 2026 03:06:13 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c69406640sm27345536f8f.12.2026.11.17.03.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:06:13 -0800 (PST)
Date: Tue, 17 Nov 2026 11:06:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Petr Mladek" <pmladek@suse.com>, "Kees
 Cook" <kees@kernel.org>, linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,
 "Jim Cromie" <jim.cromie@gmail.com>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Andrey Grodzovsky"
 <andrey.grodzovsky@crowdstrike.com>, "Steven Rostedt"
 <rostedt@goodmis.org>, "Andrii Nakryiko" <andrii@kernel.org>, "Samuel Wu"
 <wusamuel@google.com>, nathan@kernel.org, nsc@kernel.org
Subject: Re: [PATCH v4 next 13/13] scripts/kallsyms: Reuse little-used
 compression tokens
Message-ID: <20261117110612.1d61025a@pumpkin>
In-Reply-To: <sashiko-outbox-218682@kernel.org>
References: <20261117103352.1244657-1-david.laight.linux@gmail.com>
	<20261117103352.1244657-14-david.laight.linux@gmail.com>
	<sashiko-outbox-218682@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 17 Nov 2026 10:57:57 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] scripts/kallsyms: missing syms update on split in
>   uncompress_symbols()
> --
> 
> commit 33aea03661ccead3785f7f56d31a3c8974eb8710
> Author: David Laight <david.laight.linux@gmail.com>
> 
> scripts/kallsyms: Reuse little-used compression tokens
> 
> This commit reuses compression tokens that have few remaining references by
> expanding them back into their component tokens or three-character strings
> when a more common token pair is available.
> 
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > index 42a7c99585c56..976b525c4366d 100644
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c  
> 
> [ ... ]
> 
> > @@ -855,6 +954,125 @@ compress_symbols(unsigned int token_idx, int compressed_chr)
> >  	return subs;
> >  }
> >  
> > +/* Change every occurance of idx back to token_pair/triple.
> > + * This extends all the symbol table entries but frees up a token. */
> > +static __attribute__((noinline)) void
> > +uncompress_symbols(unsigned int token_pair, int idx)
> > +{
> > +	struct best_table *bt = best_table + idx;
> > +	unsigned int sym_idx, len;
> > +	unsigned char *sym, *p, *end;
> > +	unsigned int substitutions;
> > +	unsigned int third_char;
> > +
> > +	third_char = token_pair >> 16;
> > +	token_pair &= 0xffff;
> > +
> > +	for (int j = 0; j < bt->syms.cnt; j++) {
> > +		sym_idx = bt->syms.sym_indexes[j];
> > +
> > +		sym = table[sym_idx]->sym;
> > +		len = table[sym_idx]->len;
> > +		end = sym + len;
> > +
> > +		for (p = sym; (p = memchr(p, idx, len)); p += 2) {
> > +			len = end - p - 1;
> > +			if (len) {
> > +				if (third_char) {
> > +					/* Adding three characters */
> > +					adjust_profit(sym_idx, idx, third_char, p[1], p[1]);
> > +					memmove(p + 3, p + 1, len);
> > +				} else {
> > +					adjust_profit(sym_idx, idx, token_second(token_pair), p[1], p[1]);
> > +					memmove(p + 2, p + 1, len);
> > +				}
> > +			}
> > +			if (p != sym)
> > +				adjust_profit(sym_idx, p[-1], p[-1], idx, token_first(token_pair));
> > +			token_add_symbol(token_pair, sym_idx);
> > +			p[0] = token_first(token_pair);
> > +			p[1] = token_second(token_pair);
> > +			end++;
> > +			if (third_char) {
> > +				token_add_symbol(token_index(p[1], third_char), sym_idx);
> > +				p[2] = third_char;
> > +				end++;
> > +				p++;
> > +			}
> > +		}
> > +		/* sym_idx is already in best_table[].syms from earlier. */
> > +		table[sym_idx]->len = end - sym;
> > +	}  
> 
> [Severity: Medium]
> Can uncompress_symbols() leave sym_idx missing from best_table[].syms for
> token_first(token_pair) or token_second(token_pair)?

Read the comment - it is still in the list.
Quite subtle.

David

> 
> sym_arr_free_all() clears best_table[ch].syms.cnt when a token slot loses
> all references or is uncompressed, while split_token() only checks that
> first->str and second->str still concatenate to bt->str.  If a component
> slot is freed and later reused such that first->str and second->str still
> match bt->str (either reused for the same substring or for a different
> length split of bt->str), its syms array only tracks symbols from the new
> compression and no longer contains sym_idx where bt remained compressed.
> 
> Expanding bt back into those component tokens without adding sym_idx to
> their best_table[].syms arrays triggers the errx() in check_best_refs(), or
> leaves stale token bytes in table[sym_idx]->sym if that component token is
> split again before check_tables() runs.
> 

