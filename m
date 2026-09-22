Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E971B3EF643
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Sep 2026 04:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790052119; cv=pass; b=HrX8oIV0lG8DIzuYxr9wdgF3n5X5sU/OxSLKszOoIDVlxdd/e73FvrcfQ3EgL2bObWz2p8fKq4l5YHGghvOJBsB/5vRfQDM/w4EpTPSddfNV/WqXpsEwxWVI+UoSc20wKx2K0z0AoJOEBRPa+WiR6sDSCx6tS4qq4W2fVxxbSrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790052119; c=relaxed/simple;
	bh=5c25rEpnWwjQq0kdbCWbDLkdxQo6pekDJrSKx37Wl5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uC0ihbRIWk2xm4XSxlux+LHFE+XmvMeM8LSvPeCUQOwmcYkdSXA7bDGLzqany6iYhoBn2Y/KItwJlS+TdDvZJ09H36daGvy44WSBrU/u9EYhSULE9H90zHsYJtyBLzq4zxmhzf+3JTToXfNtqKlVNz0PAH6Nc6WnnVVb2XruJz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVT3bM4c; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVT3bM4c"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d440939e3so25219957b3.0
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2026 21:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790052117; cv=none;
        d=google.com; s=arc-20260327;
        b=CXffx6taau07V+aVXILMg3762UH+mFnW1w1UklkcUxkgBBTcIawUAb0fbOHjUR82Q+
         xX0+ts3+AZ+wj3RvQu+YvK0Tc7riCc5KrEOdL9y+Qq/Sr3Ceqlge18IpB6NKHpUoZG7x
         im+DbqvIhrDOqGhRes5mJgROeLBXohjYcw55rwflgZ18jye+ngRRIsPakzcGQ2Sud5IV
         Ar1Feg2lz5o8JwBSLOGgcEP+IN9WyO4STWU18ZZHgInLipDJh3zh6PlJ+9GSaJq6AeJX
         Q/Ye4Df7XTcgMPC0nqQ8Ls732onFoKLztHM0r+osIsW0vpBBDFjvgSlGXP1qN2+gIMnf
         aA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5c25rEpnWwjQq0kdbCWbDLkdxQo6pekDJrSKx37Wl5k=;
        fh=y817MFdxgffQygcmKZLY/6TZNEjZs0heLh/IjlxrPTs=;
        b=WS0Ky28/HPQEu/2pA8M9GnO12NSH7HzpFQLQdBSEbOP2E01crqR8yVSSuhmjBRie3k
         FxWNxapdnfq99nvDNXZuDDEkGufX0dbDbaT9dJuP7DvjSf2gcPSkWZM9LDbbFBVzLPbs
         5q5t3wqtf37wTMRaOmzgRd5b4/TfejeUQMDk4LjtLDWREMTYUNkWm7SbJCPpPk5hu1UM
         9DIDcm7jw6+2Dstc2JAdCHQkRwrNeDcdXQUaaPvSiJHDrnuYIkTLu6EIj2P/xWN2LQ/r
         KFUQXCtmOYuJjVwooHddOL4P4Qe3aqaKDaiJI4kvCR9KOkgn4NB0lmbnHKEyxDy37wZ+
         ZTPw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790052117; x=1790656917; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5c25rEpnWwjQq0kdbCWbDLkdxQo6pekDJrSKx37Wl5k=;
        b=XVT3bM4cyq4/9vQHKU6vekdxjffmr+y4AI/uWOTOeFyvpzHUzo01RLZ6NjxDLJjhYm
         CQaPl9xDDSev/7tprplYRPy11yQBBX7p0ppXEfOeFZGoSJsNX5JtWFeycrgxy8kPD2Ax
         sL60BPdMyxA+WtI6yerw73vWTEdepBzWm+Wz5fX6du8nnablfdwWNGWLq8EINx6LmkNQ
         gZOHhVLDslkXWZVlyJZ6qqbbLbPUNy6343vUssy9C5zEhUigyE8hAphpWhGD21oBGyZ6
         vCN2ps78/nLkX0mP7mInfjQleCtQ5MEmkSqSykXaZZO0a0qEAbH0mx4psz4S98NirB85
         mLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790052117; x=1790656917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5c25rEpnWwjQq0kdbCWbDLkdxQo6pekDJrSKx37Wl5k=;
        b=x/J6lzlXK5guXLIeBdWdxVE25G4E719pRomQW/g4sxo12sCNo+MB2ymESGf6oQ/Iyx
         CjdUsYYN48vuotWKN38eV2pKNgy18/pOoV19yQUvKS/AdIgb3CWggEWhHzm05ZCXdxji
         jqg0WYvLrIGo/kEZ41MUz45U+5koO6avVdWxvzqsjKmL/A0Kko2H7s6Y2qsWR4UaB/oJ
         17LC16B/zjSqSGYe0omhLhJcNklOhwoTCACAau48H+SG0YkNJxrID3+RzD28aqhnT8h7
         G+J0ZEGdNqn/mh0jnuN750GiFYjBHb2i1QSHxwJMNIlHFIMOErUMdZfoy+wWbyWRXOt9
         9UVA==
X-Forwarded-Encrypted: i=1; AKwUvBwZzPTNHoRUTAqrCRJBPjTcr6q2zZu1j4qoChHAXVbQjOKPphSm/IrrpR6omK68V8SpWbiJ8n8E+Gcipq0=@vger.kernel.org
X-Gm-Message-State: AFuF++nTumQrw6y/URaVYQxbTzjK92TbE6fx2u7jN5Htt64x00D5kVE3
	WoXo6Q9tbjxn8zhkAlLSq9mqpURSx1PfSpMBPEZl+mUyvrDnZrsP/sWj8+eayQPEae2CGE15oEA
	tW7OhiDdrJZjE3+4tAft18tXpsFUZZJM=
X-Gm-Gg: AYBFou3/o+LZZcjUyoWu+WrjIfSOBG20avzhWmiKEUK7iL1iwFR89xRgAMjo3kUj/Z6
	rKVm7fJIOGi9EKZP14b+qKg6Rt7xbL3vFL8ixXhWvBfvaKwvwxOt4Q4LT70a2+rl1yaOJAF6dst
	vsMug00zlgAVZqUwcgZBkpaRNcUZKodKLoRK+lsDRq1bSSHpenIfGPkaa3BrlwSt8cOOjvuUm2q
	DP3Hst4JVbB1up1148Vf+EQX39ASu5+ghLSjwMXzyHieaOgT9kj+ZfTvbWbNM0WacV6Th9BTXmR
	aI2tCd71OjTjk5xE1aacAF+1CV2qSTP1cw2zzkcbWsPBo/e1BOsPrYa4uAUF9fZiCB78elbhOOa
	vTzeOU6bXkaHRgbYA0Hx57DNWtFhV0yOqFe61T3ji2bWS
X-Received: by 2002:a05:690e:b4b:b0:672:a4a6:298c with SMTP id
 956f58d0204a3-672a4a62b60mr3004078d50.6.1790052116810; Mon, 21 Sep 2026
 21:41:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919-ksyms-tune-v1-0-d85c97da1a32@gmail.com> <202609211605.9F15E5B1@keescook>
In-Reply-To: <202609211605.9F15E5B1@keescook>
From: jim.cromie@gmail.com
Date: Mon, 21 Sep 2026 22:41:30 -0600
X-Gm-Features: AcwNN1Utyycyg5fZYcTu3CM11pNZpX7emt-G0eshr0PTJzFXqlmzavs0XJTRWL8
Message-ID: <CAJfuBxyYYpk44BEV3vig2Aeo3yn1mNDL9wVA+G4y1z8BP4aeRg@mail.gmail.com>
Subject: Re: [PATCH 0/3] kallsyms: Accelerate symbol name lookups by ~19x
To: Kees Cook <kees@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
	david.laight.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 5:07=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> On Sat, Sep 19, 2026 at 09:58:54PM -0600, Jim Cromie wrote:
> > Memory footprint: +573 KiB .rodata for kallsyms_names_offsets (191k
> > symbols * 3 bytes on x86_64 defconfig), minus ~2 KiB from dropping
> > kallsyms_markers[].
>
> The speed-up is impressive, but I have to say 500KB is not exactly
> trivial. It's not _huge_, but it's not small. Is the rate of symbol
> lookups in the kernel high enough to justify this loss of memory?
>

IIUC the use is quite lumpy.
so a dynamic allocation could solve all the problems.
1- 32 bit table, since 24 bit fiddling is silly on table thats freed soon.
2- can do David Laights stride-2 thing almost for free
3 - 0 bytes rodata
4 - no conflict with Lorenzo's patchset - no touches to scripts/kallsyms.c

It could be batch-loaded and freed, w fallback to existing slow search.
or left around till OOM
I will play with this.


> --
> Kees Cook
