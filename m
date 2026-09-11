Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FC947C10B
	for <linux-kbuild@vger.kernel.org>; Fri, 11 Sep 2026 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148022; cv=none; b=cEX1Fvy03tqR83Xq03mWZjpafASpsg6fnmhuVIxNNhm0bTK/CqYX4KGaYbJs6m/GlKYLgbnMCD0D8+AY/XPt3V+CkXJqxyLnbsfLB1olauxmED6sqIPQ2FUr9LvW3F+fA72fNuoVc2tpJNEHmRlmS7fq/E8zHf4ygSeQE1FlivI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148022; c=relaxed/simple;
	bh=76bsxwDnANEo0kLB2mrhhQlwm4C2VGFZMyLQwWFFfs0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ihDoIeLXKT7tZzbccHQiRaEJWkIT21Tauf8mChPFSjLLSxutKK6s2FoCcqKtDboIf6zbLD8Cx+IrSdK9I5t0XkiUYZTtq7IMgHqnjyUfE2PGwNdDcRdDYWu6Qfw16TWpo4GAie4VDThqZos3ECWioz+WEQoFNFhlTRw3NQSGVk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7X+6rKd; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7X+6rKd"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so959755e9.1
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Sep 2026 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789148015; x=1789752815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oHkfE3imp4BQyC9rRB22q5PBnbDLbNtc6L6K0uF99Ik=;
        b=l7X+6rKdv+a+2H9VVk/5tjdV/dmauzOsd9F3pLAjg5HKAH/FbYRyfRju89HHYQmlIh
         arCHlImki9lN/iEttOdBDIpQE8dtpaRgOVCCIK1cLrxshaTAa7jOqOlJEufOQp/MlGyG
         In0ltJN4FX5H1F2ZrleEquQHblmeAJdU6xem8UnmqQ0bw0QYX7FyJUUiHyP3WgtXyic2
         /vrwR89RC3zM6P6WHF8EACv8yCNoehuRQUKnlo/Ng89fDphZ/psxu0e9yHI5Bx/h7kq7
         TA3IaIXaWvcxdNrlRriEDLfuMfm0JtB7Tp+EwvmrIfdvCHlboxOTSfqLmfwyPZoBcDcE
         ElWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789148015; x=1789752815;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHkfE3imp4BQyC9rRB22q5PBnbDLbNtc6L6K0uF99Ik=;
        b=MTr9ZRJuHQDHgpRKdnrcFhooQz3GJRSvV5/2IhnTCxoqb3hJaWlpo2bmPbymd1BBMR
         SBMdRzjDCcROzaEHWIWy31IbIO6Xe+XjH0Ahm+4RnovsVh/TD5y3bY5WKPd9FGZYQRb8
         MIhKgszV4XDhOGPAq79p4YbozJMYsy+Rl+6yiw0nyxRR5k27UJCDZUkag63tNt8NK+Du
         GkhQAZ9UPQv8f+ZD5jvNqOey662r8XLF8O4peMgO51kVF1RanGDcZtu9xPWDO8wek5xY
         rj1EfTTl2usEOC1RBn5us5g4hPX7uYe9qYBV6oQJR5eeqpSFd04uZr3EJR4O5NLXU58A
         GlRQ==
X-Forwarded-Encrypted: i=1; AKwUvBw86CuiI3TLPjLEUfA51bdI2esIccNduvjpfrV9NxjTYmv9uejeHmID/JVNuLISGWfmvpMPWWsVHngvJWI=@vger.kernel.org
X-Gm-Message-State: AFuF++m5I6w78uxBhahCibd5HoFwi3z+QisCfSyMBIOeNJ0lkG4hU9wD
	+M+70Oi3JhOnGWRFDgZXXyRmFeNfOl3XOVnQ5pDl5gNXwtaDkrEz93Tn
X-Gm-Gg: AYBFou2gCo9ysHJmLTO1J5RgF5K5tZaZbxlTu+V93X4AfzcVOljN12Mi50b7SXOBF7A
	bvZ2j3D4EvuQ/K0qwBxdBWiOsxdFEmqC1vmIQKnwxBo0/Kk10CpD3Wc7eRvrgPQhGRRV9dQXS/+
	FHqnu+V/RdbOMRspjrJOUxqCjcBSD2oazFnbPNDxJhk9dpFKr+zRr2TDf0VW4P56TcApIYu33YJ
	RHBWoojDMTJn4FiNzATaKIEMctXH2sIrbHXti1PxTALP0iiHWFTLfwwtZReBdxf7JjTzlmBLRNC
	eAcK6uxSXhJxr462dsdI2GtasrYWK647lfRPAw/UgZwuJzSLRpGCw7Qm/eyAuihKDmLTUs1VFg8
	2LNun8Au6vHIV9Sv1p+kaUnQeo9F3t38L09Lzvu8o90rwZvVsZBt2RU7Z4T5ooqxikMi4Cy+t6d
	bWwmo8N2Mk1aeNDd06jNMFHSOcmo6qpb+NNnWC4Pmy6rHDETMWGbu6alCInz5pUXPqKOA3vXUWY
	ZmGs4+UoPo/pzhSWYjunIqFP+dPcKqHOWUl
X-Received: by 2002:a05:600c:4e0c:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49e6198734emr158528945e9.6.1789148015226;
        Fri, 11 Sep 2026 10:33:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm80821885e9.2.2026.09.11.10.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:33:34 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:33:33 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Schier <n.schier@fritz.com>
Cc: Nathan Chancellor <nathan@kernel.org>, "Lorenzo Stoakes (ARM)"
 <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nick
 Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Masahiro Yamada
 <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>, Jonathan Corbet
 <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 12/23] kbuild: avoid re-running compiler and linker
 probes
Message-ID: <20260911183333.1df0f2e2@pumpkin>
In-Reply-To: <20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
	<20260908-build-speedup-v1-12-5dc1ac01672d@kernel.org>
	<178901395292.3971858.13236774094648272066.b4-review@b4>
	<20260910-translucent-sweet-sidewinder-7acacb@l-nschier-aarch64>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Sep 2026 17:42:35 +0200
Nicolas Schier <n.schier@fritz.com> wrote:

...
> Yes, skimming through the patch, I thought about that, too.  Moving more 
> cc option checks to Kconfig will make building out-of-tree kmods with a 
> different compiler more dangerous.  Maybe we will have to make the 
> warning in Makefile's prepare (external kmods) target a bit louder.

One problem is that distributions have a nasty habit of shipping kernels
that are compiled with a different compiler version to they actually
ship as a compiler.
In some cases the versions are clearly the same - but the version
strings differ.

David
