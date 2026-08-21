Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C1338CFE4
	for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2026 09:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787304039; cv=pass; b=T8bXCmsts1mDt/G+TNCca9HzlIESHywLcDahTPyKAajA9YDhiYq2e4g9tR9Wh9bToJua9OWfhyHdB41rne9o37VUKRmbFKz2qLVmzKSKDx1P0sBmGETYaYgX5IbGOYOsYW4LM7Bg2T+MT1iolOWZBfyGt4WtBIF5hEF4BcHqmV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787304039; c=relaxed/simple;
	bh=E4zb8nb4cf/tpYQwGQJz33v+VSbtCZjWNTE/nT0ENKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0htOwdIgT3xkrl34I4ohXQO3NyDY75EE9wMWDxeiwfevCBWYRlEpi1yjPL78WSASQwWSbHyH4OtQnyq0CAjWnTQHgCCur7B9ulm+MdFG3+/ix8rlJw5XBvMgTpX2xGHvvDefbOmc8NQCef7ZTFTle1BfV14Wt2fgb+fit0gvEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYc2t2+c; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYc2t2+c"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cad68425a7so909095ad.1
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Aug 2026 02:20:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787304031; cv=none;
        d=google.com; s=arc-20260327;
        b=PCi0BSSs2wAVzREMZ5FkmpDFHjiACORyPj8leFSQRZoWsiv297jr+9o7XwkqFg8I5S
         Mu1VWGq3c6M5YI5Bwxofbxl77K5vBp0s9K85hVegI6XGntHZB3jGA24K9KYiSU+en19B
         0UmEZUSP8NUbFmXGx3M8uhLTOlbPouYr1kZs16aTlIUiqpH9Zw5w2df5UnaTaM5wgNk9
         UYvOjRfZcumtTOGR8cnB3NpHICmYN7Yi2Q4U8rdz2wv0BgAME/XHv3cU7muaBtX43fVY
         KOMor11cE4W9GYSUOyTVJPEsE3lLVpOiCeiDBYQuN6bG/XCmr2k7GSV6eaPKfSX/Ai8t
         mJDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gOGk4r4U6YL2667EvZgd5D7Xq+uTIlLJ4oKbAH3NH8s=;
        fh=8TLYI585QTyIi4TI72fKVYxzwZ01XSwl0lbAx4XKVUg=;
        b=E5sHuwRQWVZrXmVCIQ/HVhw7Fsf5XzKnxRVNe0PrrA9YrrS3lwpLsASmoXTA48qerX
         6sOAcf5AaaCFhrUkj2JcAIyFpB6uh4pDldalCH4dYgP0FfmMddZQhOfSo0XUFuugkkMO
         h/uUhivZTmWKMyh/JV/iaqERio3QIlxb6M9VxiIgjv//MUmZ6UnSZQx74eImxH0fu/dn
         kyMBe8XKSjwQZxPsN+CSOpIIkVkb+Kn7K3V3FZmja1lHraCxEkK92CNrIJjShc37VCpD
         dgaqi8OrDwTM/46+gxI4DOoHHNhh+oOuKdMDDFxM8ufkAnhFRUVP6BDl9VT0rPvBqBfe
         hPKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787304031; x=1787908831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gOGk4r4U6YL2667EvZgd5D7Xq+uTIlLJ4oKbAH3NH8s=;
        b=AYc2t2+cT9l/KBUzZxdX+dWrnDzavcTsk8wlbCBAgFBUbMo7gb3/2vNZmYGtnd/5X7
         g/FrBkVBJ7tYaFubvXFw8POAJUVC13gNgnA1WfH2AnlJbtEjJLps8OGlsUBeQ3e7Nv50
         XAM893yK919QwDEswwS9VCJH/jUpLDK/W2/FmNNX9RsUPD4MCV3Gqc0/FE8KdkKZ+1zJ
         hcJT9iLvGzrO4Chyav3M2a53HZjVCCtymtaVNF1YdjQy5JYJGvizPf3ezZvLLYfuP6d7
         YJWun2o6qBoGi02Hvwi3rzsnYHOg5Bbbq7UZUK1nufS9yI7cWrjSH8ZhqRRJAAFn+fly
         nLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787304031; x=1787908831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gOGk4r4U6YL2667EvZgd5D7Xq+uTIlLJ4oKbAH3NH8s=;
        b=fsybDzJyqSagMJmir9bVt153zCHHNXDeS3FH4S8g74UBF2xf8IGEIqiLYPoa+LTsN8
         kSvZjM6jcZcIf5vMghv1bUiJmw5hDsU7NN3hv85y3hz4M9YS1UioA5GGqGqZB1PfIvTi
         YujR+5yXkn2PVstG12MdMEITICm0upW+mMGw1hVr8cLaE/51eQak/FH4sfMxPJRVzMWQ
         bvq3awlMbSsJN+PER+AD80q5QnXe2OmiubOa0DDvZyeAv8GN0idLKp85/28AKR+hl/Ue
         3dy+N0UaUOFmoWapudcQrdklCFBTuhLwV8GDndPRojlYPud06vMgeBVwuPOwBDmdphGN
         cLYQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVD/5I6GZj4Aa2erceJGJlPDexmqopwPPhleW9JIiBHf3v7wC86j4WkEFBFTshDoFcKGs9Y+CjzQ2QOtM=@vger.kernel.org
X-Gm-Message-State: AFuF++kPCpvFNxL0e3m7Rea1dF7OBpenPJM0YyhDMvpvVtSZJcqHUMr9
	CEeuYRraqFpl6C/nSxPQM7klu4TF+UDttAUMKT7+2UcqsnPM0p8A1+QC/2zcWQeH8f9HrTUxibB
	YwypMR6UiEaLYJqdc+H9Lf0CtnCG/H9o=
X-Gm-Gg: AR+sD10TrMGogJ+KK9a/5+IzcluLbu9Jw/a0k1FQqB137gp6wbGHAlzk5YXrkVbstm8
	oQMONixrXqsXi/VsAtfxV5Id7j2ZM1d3Um3jGuoKrA2DpHfzwycrgycH413HAdYbtjX5B8IJ+LL
	oTcu37cirlEQvPzUVx9UNobxTkmb2iLLNWkpoBhI7vkeRGd+hIe93cg0cs0Fq+phWZJtDtUQ9b8
	GXxEHRxMI8cPiAAP8et7ZOIte+8Qa7NjzvYXN73qVSVAOKsyemQ264RNoaAbmqSUzwCdro7jhkV
	DAkB70TnsYE5WBegYJKwaCNhu8fqiZT1g08Hi+cnVy9T2e/1Y0v4Zg/UKkIVG5nX51B7Cg5NzI7
	NfN8l064rQ6lE4+mnPJGF4MqMEsyQtmLPEetCV42r5YO7mmcNed2gfnF+3VHzsFwwY9/lYO8=
X-Received: by 2002:a17:903:1847:b0:2ca:d803:5c8f with SMTP id
 d9443c01a7336-2d64adc9846mr49568215ad.1.1787304031240; Fri, 21 Aug 2026
 02:20:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
In-Reply-To: <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Aug 2026 11:20:18 +0200
X-Gm-Features: AcwNN1WvsADV8MMuI-iTtWhTbjyEYDjf-9ZfUuCq94WpdMme_2NkgLvAR0YHzPs
Message-ID: <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Gary Guo <gary@garyguo.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 1:43=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> The LLVM fix itself is trivial, and it looks like a pull request for
> it already exists. I assume we'll want to drop this flag for fixed
> LLVM versions when they're available.

I will link it in the commit message when I pick it up soon -- already
did in https://github.com/Rust-for-Linux/linux/issues/1132.

I also added the `-Z` flag to https://github.com/Rust-for-Linux/linux/issue=
s/2.

The `-Zmerge-functions` flag is internal but has been there since Rust
1.34.0 in upstream commit:

  b91d211b4030 ("Add a target option "merge-functions" taking values
in ("disabled", "trampolines", or "aliases (the default)) to allow
targets to opt out of the MergeFunctions LLVM pass. Also add a
corresponding -Z option with the same name and values.")

so that should be fine, but I will ping upstream Rust so that they are
aware we are using it.

And, yeah, agreed, we probably should remove the flag conditionally
later on, to confirm the bug is gone etc.

Cheers,
Miguel
