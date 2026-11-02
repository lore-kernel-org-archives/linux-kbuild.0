Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649078;
	b=5lWjUOLuX2x+jM01tq9KZ8h8tGp3mcCkwkUHA6LdlMXE7SOKMv9mfwqxVpsBJarct+WK
	 nIi8dO9wOuKeeHQ1TYF0fvpFrCLX1rChgFXlMKc2AyR9UuAvX4BuQZJSXhOoeXvKuW+3A
	 itjD1jDUMc2KIjTNKF2n7CK7z+oxK8jQaiBXLFrRQuVwMPd7uHPTNOhBhlx5lYftW99x7
	 C1suZ0OfiuaIGmDav1hPdL1Qlvxk6oEBu+bH+C8Jw5Pxxoiv4K2Z53VRYa9ETCMRrULdn
	 bJ+bM/UKbpmv+8WLeVE+yJ2F9vT7i2PLj5h5gtMn9jaacSJWT1dEb/7pqecgHjapeWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ByzPJcPHD+/MZugpPjiaW6JdHdzSrBmVJioywqKvUl4=;
	b=izA3UlFAJ12H8mNK90X14gOHUW8LTq65aOP4ZfGStzee1AIJyWdulU+N49MkO9LdXgIi
	 WBmY80Ifbqgc9yMSbxijU+6nz/mbMcxfst28rCim6R5uZBhER6PNGtTTfRJpLoEEK2EM7
	 fqhrQkN8L+oJf+TZSVVKR9jNWVnrRU6GdCf2Xx4RmcGe8It+zCx+qQHyRcMGPoxRuLxP/
	 nSXLYUnU7ciYBxuPe++0c98x061V/t/sVjnO4ILQZMka1z/iDi12uf7OqoXy25BSdjWQ/
	 UKjkCD/Vk4tq8XPjGWVUXGDvWF5fo/A8cQDEWngZu0uTQKIyEiUQ/SW1n/81YDD4r6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NIGnOxmk;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC89B606A327
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Nov 2026 19:51:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC89B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NIGnOxmk
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a214af2076so26085745e9.0
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Nov 2026 11:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649076; x=1794253876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ByzPJcPHD+/MZugpPjiaW6JdHdzSrBmVJioywqKvUl4=;
        b=NIGnOxmkb+2jVAnNLME39LE7KIlW1GaiH4Rrdx5uqLkEcAaH9DzFx+rYMBKWXzYSQc
         8sRbdYfKxcWxwDzIs9jSt/F5IxwFLcxErC1SR5p0DF+Qmvf1CKupro+xB7z9G5zVRqbh
         Pjm9BEeH1jTjqRrvDV6yhB2SYikroDWOPQsTSXJ35OP+j5gygP0noHNUi/Qy4wI7DTjR
         R7DEpE15OIrxnSiWcpYB3lsIk6W20kNmOwRU0YmQaO6XHSv9XjHUYP+YT9leL0izu0qX
         BnB0hZUQ/f86g3wntxIjUX7lMcF4EcwVfeZNJGyIFSzL/oIrsEA+UFh+Jkn44W4io5Fl
         c8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649076; x=1794253876;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByzPJcPHD+/MZugpPjiaW6JdHdzSrBmVJioywqKvUl4=;
        b=2PUkC9yg2K5BsU2jQ5RiX+fN54MQ4Vs+jsjkzbDY039JeV5GeOcDMzIPd3kX2UqHkP
         6W0bT1Pl63ZKISPWTccGi1UmgF/6eCm6qGb4FhAycxE4LN1PEq9Tv4ISI47B3diWLfTz
         M8N+ephbJQ/61YqZqDAV3M3P0iylm2HG3uqJJDKNXKIb3SNU8N234ciYkh85DtHtXwBI
         KYpPsHGjfEuuDDd6YKIwgJHFsbPCmW6BCHKPadhERwdMrWQLrPiyniSLq0AnEqI5BZSp
         VKioSVWFlUzuAIs0aCiEqZc3uuPq/iIitJwp5TM6FSkXvSthJdGBh13fgHHyJMpybMIt
         UnkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzJZlbeYtULCwtKvYKUzDuyS+qk4cYHFdtEJ+FlAnAzB8ZlpDO1t7K4AmVqL7RUpPjnaEWif44btrRBLQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlQIlgptTxhpnbeAUXCHTDO9achKRyQin7sVIr+AAL4xQyWkkS
	SeFEf59+JK/mI6uxik7swkTdCNyrQ5fjnyIOJxQBDR+XQLUY9XXEdofs
X-Gm-Gg: AYBFou0vLAbY6qc+Vb3mQfzl8D/J5POovOXtBukloEgaBdJDg0HpUZea9NYbjWMSHxD
	811rqLCgasW5lhyw4CpWijJqgkmNx++Vh8a8nfMWI1uSwUd73HZRlUzX+GOl/9+GSX5oqgKLA6H
	at0nZu6vZiGwbu1m22ON0rtQtwaIigb3GzQMmuwimdvXcMmiIpXfJnOGXskOFf0Wh7+jFEksFUs
	wx+DZUZ3sMzRHVmMAW5+kGaPJF7hsP2VjU8dPO8aYN2Ygl1jCQXJXOQIM+kRgk/BMJH/9Rs+L0H
	lHmBjx2En/nKA6+bH4lPT+1bqpSbbkDwdNT2thsTItio8yGjP679HqsZMpNGp+yYf33ltsGA4Bg
	t37HwtuMn68Wi5A/6HIFreVKY4ww9JWSfDOLISVJXnlHlL09YMPy26p/ss3kiXXfRXgtzj08Mbl
	2+ex0taEPWu6sC94ueiUyWPiKZ39uG0w1dH4VmZ+3LjaYr5Nxas7JuG9ROZx1FguiBOh2zLxQ9h
	BHNp0DcJMMvVtquYYZEkpfiILUICm41tdl1c+diSrjY1xvQFntTAMrl68ReSc1NFAZIhfwEZKm4
	gwWWnMwXGLcd7oKPF3bU2/6LuwuHVtJvmsnnsX4fJ1fk4B6UpMVY1lfhjkrj2MMX
X-Received: by 2002:a05:600d:82f2:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4afc2105bf0mr153755035e9.24.1793649076120;
        Mon, 02 Nov 2026 11:51:16 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aa5781c9sm8659825e9.8.2026.11.02.11.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:51:15 -0800 (PST)
Date: Mon, 2 Nov 2026 19:51:14 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Julian Braha <julianbraha@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Speed up KConfig - fix hashtable confusion
Message-ID: <20261102195114.742df19b@pumpkin>
In-Reply-To: <CAHk-=wjx9EAO50CkadGadOA_ea0D7bBBmMbFfRqyf0OriZP+tQ@mail.gmail.com>
References: <CAHk-=wi_GuySe0L-uCAM2+nScCLYGBp5BLi6UUPR1gALmNM_3w@mail.gmail.com>
	<20261102094716.2c8b1cdd@pumpkin>
	<CAHk-=wjx9EAO50CkadGadOA_ea0D7bBBmMbFfRqyf0OriZP+tQ@mail.gmail.com>
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

On Mon, 2 Nov 2026 10:20:35 -0800
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 2 Nov 2026 at 01:47, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > An alternative would be:
> >         ((key) * (u64)(size)) >> 32
> > which avoids the division when size isn't a constant power of 2.  
> 
> That's certainly cleaner
> 
> Not that it should matter - afaik the size is always a constant (it
> comes from 'sizeof()'), and I would actually prefer it if
> HASHTABLE_DECLARE and HASHTABLE_DEFINE took the number of *bits* (like
> DECLARE_HASHTABLE() does for the kernel proper), and we'd just make it
> a rule that it's always a power-of-2.
> 
> It already *is* always a power-of-two, and the old code used to make
> it a slow modulus operation if it wasn't.

Ah yes, some people think hash tables need to have a prime size.
Do not doubt the sanity of the person who decided that the elf symbol
hash table size would be (IIRC) 'the prime number below the power of
2 below the number of symbols' - this makes every hash list have ~1.5
symbols so you pretty much always have to do name compares on every
shared library that gets loaded with a program in order to find a
symbol that is in libc.
I remember significantly speeding up loading of mozilla by rewriting
the elf interpreter to generate a merged symbol table for all those
libraries - no idea what the one the Linux uses does.

With a reasonable hash function (or even the crap and slow to calculate
one elf uses) a power of two sized table works just as well.

> I'd also worry a tiny bit about what the compilers do on 32-bit
> targets, although obviously hopefully (a) they'd optimize it to the
> right 32-bit code rather than do 64-bit ops and (b) it's not like we
> seriously care about 32-bit host builds anyway.

They'll probably zero-pad both sides to 64 bit and do all four multiplies.
But that isn't so bad on most systems.
At least the 32bit shift is cheap!

But yes, you are going to have trouble with a lot of builds on 32bit hosts.
objtool sat for minutes (long enough for me to think it might be stuck)
with an RSS of ~30GB on a recent build (ok it was allyesconfig - I wanted
the symbol table) - but I suspect it will hit 3GB on a reasonable kernel.

David

> 
>              Linus

