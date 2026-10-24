Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829828;
	b=jNou1ba7wcDlTkhNLv7npbhwtOXC/NBN1Mn4Y6r+pTXcUuXiMEQ8y0E5vY/PGAHBLwXj
	 YYcnf3WYioXtJwv0+eQb2dlNoKCRUwNWj+OdGj7szB4wX1dn1gCxCBAXk0KnN0hqmrQsR
	 a6fXY9Qo3lVGuF/V58Tj6atvCoSSrEt58Gc8B+mKernKEy+7QASAiV5xVeoHgEtmXlixv
	 yOlPK4OOs/r7jwv3q8VaGc3aOK99XIudFAeutQVZyIRppP0tDKztqtup4zA/D2xWziH11
	 jW5rpy4pTKpqPpfgXgSUOj7C6nRVw8k4RFJ/IUoTsNnZlv2um03d4GlFpdwaPgbEiZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
	b=pvWz80YQYadzXeM6sAQxS4IpEJIPTH/xv0WdTdO377ugjipXepkRNPnWSw4h2bejFUwG
	 M043RTlT8JOHE/tK2npnAkaGj4WOYjfEinFB392fP894B0doDazBJTjxb/W7Q6+RKVlNg
	 33FtgIBHT8UNefK4IYjmYQfs4LqOP02yn4GiKdWUI1J6gYKWNiqiPX9BY4YeenxBRbaau
	 xBVDhpZ8i052GUvlQquEGdptqairPFMmmBbtTf8qqFZU5giLn14AkbkqH4kJni6VV2u/O
	 i3TN6lSSIfPqbOQybfxbon24N7I4PXjBonjlvP88M2njxHqF9jy2lOMQGRkIs6QoaTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="RQ/C/ciB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87041606A330
	for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 08:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87041606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RQ/C/ciB
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a0794669a6so2054108a12.2
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 01:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829826; cv=none;
        d=google.com; s=arc-20260327;
        b=SorFTohToak9fnXHwcHyiLU92a55+IE4/vDQV4eTKgHudD365nBHFbCNBaaJ61P7BF
         dQqORJybuZ7fSD6Ii4w6L2Er3qg3leb8wjy1leZRnuRgCmkZghl59X4HEMifFqF6Dtrr
         m3A2FnAtlIANdPmRM5w/pvDFUPTLV5LxRpXLInyikRAACU961RRz3y2p6uRojb2L+WWz
         luY63oufdyhy8l3F8YnH2fE7CvsiakUQ62nTKC/dyaEe9kgJewKof5Oi/pP3FopH0YoK
         f6uidr4Hzh8+D7pFgZasiDYe5jZXmjiv+6SIa57LOZxNsH3TyWf5dexvVr3COuGjvP/w
         AUDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        fh=ihjMYDHL3v7xQjUb4mZCNVsV/yh7L+aMWP4Ln22Snog=;
        b=P9T6ckFvPAjFr3YwbGnMDstmxfxpV6GNp44meyihu7a5cfrtin4pc33pKfpzhTpRyy
         5AvGmT4lpIC6BVB8RR/KC9QkgRBVkTnwssUx9F6cxf2DausCq5Jw/kqT5iNadFfMuZ6q
         6s2/f0PfXJ4HuFOezsTTSKg2VKVqUWulqGqkbMJtU/zolet/QhDb7ZAV7AK+piDl8rMD
         1v1z4uqc/l9YtV/D68xfYlC5XusQUl7NGNwY0uglEsc2EVE5m3etJWVUFEtNCdCAaGe9
         YqaHxk/LYx3NJK6XfE4TKgqHnCBa88fsBmUX6ayw6+ws2jO5AZ55pEN9Rdl1VbgqmGpu
         gUbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829826; x=1793434626; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        b=RQ/C/ciBKZJHGdvCZm/dYrMbyOFdij4a0YW87tH+vXDq+9FS+P0+VhkPe2yvw8PouR
         1rl5NjCRsmehOHog4MCGLudY+nXK4o7aKeyawk/ABbhLZrLiG/YXwW5Ec453FETEL8A9
         gIgBxk5de6f7THQVvOrLyQmTAT4gg/7K+qaok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829826; x=1793434626;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AGDStmYSsmq+afHkW2UV6kbMdOLt3+TYcYPs+HdAPQ4=;
        b=W3t7o6zd4I7SjYsCfnIRbNhOKYadR8l3Z12cVZA7H97hfGaUja7cd32bdO8aK7JxH3
         nXP5nMymIMuaydidCEd1vwd2zbmostGfzyr18f+gI+jPAs9WUWqx8hU/j2P7GuSMEXx1
         1VdEHBMkyk4OQ1ssDOJ7vIyjzEA19C6kCaEUqbnwz+jlwlIVufWGqqZL+4U92sMXf1Wn
         Yo1BkIo8aBJwzh49R4mkJyB3ZGFhEW3dCQJu2fK7mNjmzlw6nmtko6m7sBD4berxWCl2
         czzApR0Ag5K1gZI7YFCvUmfygI6Eq0LiWB1YVqGZl/XW/xkcqzw71EfP/rxlcSX3qaPX
         UsQA==
X-Forwarded-Encrypted: i=1; AKwUvBz84cpaD/tUZ2WNa4/WO1H56aGxxg9+5qjszumvJ+8WjIdhGLN7OIzAm8cqElECcxh3+eHojXQpRdzXDvA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJK1PooGW7hQpkT+l9LBHWHwJEY7j9cjwTebdNWcdJDCMyYZjQU
	iTM1iMFOW2dKWAidE9v4cZ4QM7nuFi1BjB+BZNZA2y2bfZaADo0wmUl9WkvfrnCGol67MJ8mj2O
	YQJwOlUy6TlyYKbhr5QTXhgl3Ts6KrJnJ8b6iuV2H1rFNgv3qklta4w==
X-Gm-Gg: AYBFou3QcBN6ZBet0QGuL7FxxALlOE8yHILFrFoFdUrgsiwArXS80TvnresnaSZiQKH
	9JVfPN/iImfekG1YzmeKGuoLQP74MZXey7Unq9PuabD/IhY/xk+/upbQ/gxNw3xxSIlkfjH8cmp
	2/+JVL/eqNiKZ/01/b1+o7wcj4yc1/1liVH3JnHyHhwqBEu/PtnjhgHcMn9P3upTjdawpBOSkOW
	khu5QF34/B1HrTuvbnGH4XIPIwxEkZql4WpV0LoiX07Isk3CC8m9XzOtg2J+Ey4Z/LvOmi+by6I
	ATyd66XQjhoGWYMieHwkYqBx9FmX5CmeanUThKSHgKhZDlRpgCUlr2Gbs+BgDuPrElqpdT5rqCG
	nD/4nwfE73QD9THSwzMuRDrXm5OENWtBKHas=
X-Received: by 2002:aa7:d6da:0:b0:6aa:e46b:2ca with SMTP id
 4fb4d7f45d1cf-6b442ff19aamr1213416a12.30.1792829825967; Sat, 24 Oct 2026
 01:17:05 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:17:01 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:11:00 -0700
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020083501.RFC.2.I4f270f317b44e1ba96f016c6fd9d93390ccafcdc@changeid>
References: <20261020153652.2907186-1-dianders@chromium.org> <20261020083501.RFC.2.I4f270f317b44e1ba96f016c6fd9d93390ccafcdc@changeid>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:17:01 -0700
X-Gm-Features: AclHuK_qmQOwk_OOKs0VN1cm__skt9GZJUv6Fec-Si_oH1IGjBDYDz8yVEqOjak
Message-ID: <CAFLszTidu1NFSJ9dprCHts0-XY73gk-ZPAhz0V9BdYPoCcXmvQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/7] scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Doug,

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:
> scripts/dtc: Update to upstream version v1.8.1-22-gf3451d12532b
>
> This adds the following commits from upstream:

>
> f3451d12532b meson: Only take the version from dtc's own git repository

The script builds this list from the last sync point (v1.7.2-69), so
fdtget.c and fdtput.c get loads of changes beyond what this lists.
That's fine, but you could mention it (e.g. the new -r and -d options
in fdtput, automatic growth of the blob, long options, strtol()
instead of sscanf() for parsing integers, fdt_pack() before writing,
the libfdt iterators in fdtget)

I built scripts/dtc and lib/fdt_rw.o at this patch with no warnings,
which covers the in-kernel libfdt now that fdt_setprop() and
fdt_setprop_placeholder() are no longer inline.

>
> f3451d12532b meson: Only take the version from dtc's own git repository
> 7a1e01792600 libfdt: pass sources as keyword argument to library()
> 8c37c14c95d9 fdtget: Use libfdt iterators instead of open coded loops
> 89c99ce78ac8 pylibfdt: Add add_mem_rsv() and del_mem_rsv()
> 3750493c8b0f pylibfdt: Add address_cells() and size_cells()
> 0748c384fde6 pylibfdt: Grow the FdtSw buffer geometrically
> 5008d1d6a356 pylibfdt: Replace removed SWIG Python 2 compatibility macros
> 66e1201c3775 libfdt: fdt_check_full: Add can_assume(PERFECT) check
> 214372a27398 tests: Replace trees.S/dumptrees with treegen for making test dtbs
> 4df9ca4c8ddb tests: Add treegen, a pure C replacement for trees.S + dumptrees
> f116f4800edc tests: Dont have test cases link directly against example dtb data
> 9b53b9a4c2f9 tests: Add missing unterminated_memrsv to dumptrees
> 5f919a25d71b ci: Merge make and meson jobs using build matrix
> 6c1426dfa963 ci: Add macOS support to install-deps.sh
> 23fd89bc8ed8 ci: Move FreeBSD CI from Cirrus CI to GitHub Actions
> 3ad5ebbdd9d5 ci: Upgrade actions/checkout v4 to v6 for Node.js 24 support
> [...]
>
>  scripts/dtc/checks.c        |   2 +-
>  scripts/dtc/fdtget.c        | 207 ++++++++++++++++----------------
>  scripts/dtc/fdtput.c        | 280 +++++++++++++++++++++++++++++++++-----------
>  scripts/dtc/libfdt/fdt_ro.c |   2 +
>  scripts/dtc/libfdt/fdt_rw.c |  41 +++++--
>  scripts/dtc/libfdt/fdt_sw.c |   3 +-
>  scripts/dtc/libfdt/libfdt.h |  70 ++++++-----
>  scripts/dtc/livetree.c      |   2 +-
>  scripts/dtc/version_gen.h   |   2 +-
>  9 files changed, 391 insertions(+), 218 deletions(-)

Regards,
Simon
