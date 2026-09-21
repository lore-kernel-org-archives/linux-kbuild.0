Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AC34AD4B7
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2026 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004317; cv=none; b=cGG/V2ny/CaTRLrNrt5Kp1cn7OXGaKeBrlSIg5W75yoMx+OpP8XL0LniQpOk7YosI8cHXg7B1VPepmXRyQoJSkWz1KvCDl7IWzAnsIyET86nCRDO633nTrbD+E30v5neUVN0PKTC/zwtp2ymGV/UJ+5NXaRnHfbsCdnk2sNqcJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004317; c=relaxed/simple;
	bh=XIBUDzDIulK8h5ns2hWyPVLewhjCl1EzRllt9wV5v6k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HHmTRBsDsVRt2wgcDXzCbc8hhnGE82hG8ppHPQ5hF0kAgLn/Bc3K5y8OC2siwAZtKY9Bx6spxHPFHBM5OlAK8VkhV+hk8ETvmCuy6fYroCnT+qDuBIvme7Dyi5XvTdbvebnleL432v0402jK60Q3nVIU8P4myM/Zwzxx9hDZ8Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/reSqlx; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/reSqlx"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso23506895e9.2
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Sep 2026 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004314; x=1790609114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RViz1WxJ34/nNwVSXOrenn9sMxmEANgxqa76nMh73Y0=;
        b=A/reSqlxe1kkP3VwmGYtGxefRVQFfooit5vdDpaweYW1kcXFO7JMTL53Cf8zPQMd/F
         TeEhQ80BfWpFfjzkivztTXlY7B4aldM/UaY2y525pTsXsx0qzrzJiXyYc6NHknIR4uwC
         /JjCUWp9gOPBB2JwtK0FyVCE0RYKN+9TXaaVVGjfr21FjOIZTVXut7Bvcar7Ej+WglRL
         Dib8KB7Bxvtd1h3tz5kvIlJEi/EiciuQ7NmYiA2gqOohyeDZ/RTo75zNerqqrMiAJFyh
         +JMx5wBOCW6WQYBs5TnWexMZ9qJvZEJ4iKqBEXiTCt0qfg902k2TURccbUF+5jqE6Njz
         QDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004314; x=1790609114;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RViz1WxJ34/nNwVSXOrenn9sMxmEANgxqa76nMh73Y0=;
        b=09xHzimNLmsoww2FfP2s81FFj+6+3hYipN7pkFnK8zFT+wBcZPJ6WH8Htnsclq55Xx
         2mb+WUDWDMcWrcUJJb7ykqXSXGV7k0vY2H7f/DwoQWSk3/PFJctwt8oJILcGLvjloXfF
         MNiVpDxGgvEzoGA8uPHZrUrq2BWUD+DMDAdI85JKxVkSRkCN4BFVWg4SddbCPSbF9F/n
         PpRWlO1lUb3eu/vVZHu+FImtoCsJQi+r/tNIpEOHggSZh3kLGR4LO0hLaZ2KyOl7r04+
         ZZd4G5bHm22Dq6EGE1xsGX+7MShSrnVpsytC99uf88Qq4WpPWr+D4m6yAmy4gfpnAOsP
         ebxA==
X-Forwarded-Encrypted: i=1; AKwUvByew/MBcdAjr8rSwSgNQiDUc5TzWiSfiTFcz4wRadF26jakOtywmRFUMIoZxkPh8vNGOy/ro/gi25zPRcw=@vger.kernel.org
X-Gm-Message-State: AFuF++ltDnPfC4m1EdPWCmsu0wQdRKfqtwplMCZC6pp8YLtA0lHtisTC
	aXvMi9cnfGc0geAYPDfD9OHehN3MKxOyB2NG+nE+5HWtysirmX5qjbPn
X-Gm-Gg: AYBFou00xyL+AVRhh8EBiwMIpIbvjeHp92tpPjwlTtn3ciyzr1enyGRA+ACL0Rlb4UM
	7ariB9XNkoI99q/DXWVJvadW3jbIVJGacn/WJfxk6U+70+0gBRbECEXoxF2LbqFaZDk00w7c0dj
	m+lDRCAoSk7UMDCD4l1dbWlmvywDKzqmDkIJyKPuGbi4DG3i6/ERFSW0Dv5tlVsFG6xEzTSRh2A
	m4P2grBEI8l6+XI5j3vBOq11bgLgb+ftpM3QfTKTvg7Vbb8Cc6iJQaW9JWTQXfL4pkRisDOOI2L
	L/IUFxtqZsFfEi+aGYoR0wsbmyWOcJ4xW6NeFvYm7xitiRTDC5UQm1icbtjciuMFnDt1BSSJnBg
	CkDVnNH/8NfHSXkhAPsEEIeyUswGVG9RQrxJ8yEPmrIHzW82ufk1RQ+4wRu4pkfi+ab+KEUTUcv
	HBCrnNGTGEhOKrzTInzBccMh18IpBfxtaMaEOAWEWXYGBu1iMLpj+ixk9HMWlafJLDjCaVXxk2u
	hObc6NQIfXbY3FhBIcPtd4iQpeb9opoWx1O
X-Received: by 2002:a05:600c:35c9:b0:49f:bcce:13f5 with SMTP id 5b1f17b1804b1-49fc5736229mr180188565e9.24.1790004314350;
        Mon, 21 Sep 2026 08:25:14 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56eff84sm256455815e9.1.2026.09.21.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:25:13 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:25:11 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Kees Cook <kees@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH 2/3] kallsyms: Add 3-byte index into compressed symbols
 to replace marker scans
Message-ID: <20260921162511.233196a5@pumpkin>
In-Reply-To: <20260919-ksyms-tune-v1-2-d85c97da1a32@gmail.com>
References: <20260919-ksyms-tune-v1-0-d85c97da1a32@gmail.com>
	<20260919-ksyms-tune-v1-2-d85c97da1a32@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 19 Sep 2026 21:58:56 -0600
Jim Cromie <jim.cromie@gmail.com> wrote:

> From: Jim Cromie <jim.cromie@gmail.com>
> To: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>,   Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,   linux-kbuild@vger.kernel.org, bpf@vger.kernel.org,   Jim Cromie <jim.cromie@gmail.com>
> Subject: [PATCH 2/3] kallsyms: Add 3-byte index into compressed symbols to  replace marker scans
> Date: Sat, 19 Sep 2026 21:58:56 -0600
> 
> The compressed symbol table (kallsyms_names) packs ~130k kernel symbol
> names, in address order, into variable-length records with format
> [<len>][<tokenized-strings-wo-\0>].
> 
> This layout optimizes address-to-name mapping, but name-to-address
> lookups require a linear scan.  To accelerate lookups, kallsyms_markers
> was added to record the offset of every 256th entry, cutting the
> worst-case walk from 130k to ~128 hops on average.  However, this
> still leaves substantial work: during a 17-step binary search in
> kallsyms_lookup_names(), the marker walk repeats at every step
> (17 * 128), decoding ~2,176 record length headers per lookup.
> Address-to-name resolution (sprint_symbol) pays the same 0..255 hop
> penalty on every call.
> 
> Introduce kallsyms_names_offsets, a 3-byte-per-symbol direct index into
> the compressed kallsyms_names table.  scripts/kallsyms.c emits this
> table at build-time while writing kallsyms_names, capturing the exact
> byte offset for each symbol.  Using 24 bits covers up to 16 MiB of
> compressed symbol names, easily spanning the ~2.3 MiB table while
> saving 25% space compared to u32 entries.
> 
> With kallsyms_names_offsets:
> 
> 0. get_symbol_offset() performs an O(1) 3-byte table lookup, eliminating
>    the ~2,176 header scans per name search.
> 
> 1. Drop the legacy kallsyms_markers table, saving ~2 KiB of .rodata.
> 
> 2. Unroll the shift loop in get_symbol_seq() to match
>    get_symbol_offset() as a direct 3-byte big-endian load.

Why big-endian?
Most cpu are little endian, gcc 16 and clang 10 will replace two of
the 8bit loads with a 16bit one.

I'd also comment that the overhead is 3 bytes/symbol - with a note
about the average symbol size (excluding rust).
The +573kB sounds like a lot - but isn't that much compared to the
size of the table.

You should only need half the table.
The only odd index you need to check is the last one, and you'll have
just read the symbol below it.

David
