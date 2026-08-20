Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45E7381B0E
	for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2026 23:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787269407; cv=pass; b=PixZXy0g/14YCe3hhUMQwthXoQEqGkdQ5LaDAXG9LbfI1LvBnjDfKsmvv32/LDy2qjNogHERwXeydbdDWASZ1ulc1Vt5PdqMpzeTVjMYxMjnZL096rNFt0HOMR+5rnbMTQKkIOLwpxYY68IYvMJ9/AxC7J29bOXP/KhBXfzEsQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787269407; c=relaxed/simple;
	bh=+6/iD9uitv2o8+BkquhyWkx4ZTHDQ/4DAVwS8twCjao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqaOUs9WXssWOy1uBQe7NV+gNjTNMofuFlEMIEqC2YhZCqVU761YxoH4EtKSgI23w49hX1vIBI66U9Doly3dwGrMPlPr9QySpR1o3asNCunToOWlAMRtBIdQqTi1zr+X44538ZQgogbOTY+kL5MJa+ffhZmlR2swwKEfP9QC2KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hcSzIvL8; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hcSzIvL8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499b1409a75so6565e9.1
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Aug 2026 16:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787269404; cv=none;
        d=google.com; s=arc-20260327;
        b=aAzegL2gmMHHucuEG3MmjP81ylAE5ySqnws4WjL40UywopXfLndH0tIpzwcq4RsBOT
         N87r6qxh2+2BpTxKDVEhoXCYP+xQkZA3u9U8pIheL/hswfo1IWI6b6YgiGgcFBdxL5q/
         tiy0/cQY5owHjtRXIBoXAns6qt/IJb13vvmMS7M0h96TJ6BLrr9s5IFS93yRzAgXhFxq
         yYIb/3iKmJzliDM7P+6XcTRlDRfl+ASMb0prjFBfryc5D+Fs2LHUOwtniMAVsPWOZkL/
         7306vUbafpMfSsZB9okQlCUU5ELcY/9r1SleubVsEM+vsk8XUykRDLtyskMVL40V21X5
         GlOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+6/iD9uitv2o8+BkquhyWkx4ZTHDQ/4DAVwS8twCjao=;
        fh=J1ZhK62nT4d6loxpWd4PHW7LaG0U3R3zJ3IVTGFDwjs=;
        b=LrgdNaF4UwhqAOP7JtciDNV3G199f2676L/EL4Nt0q8zFfc/4OYSMXao01IqM+Q1qT
         HgqJy99FOxlfyervl07LEPpQgTbU2hs/deqkWiBwRHXdBwx52ougFZtXUrNXv1wHVPxH
         1LknWE/nutUOi4HuboyyatpXFkeLruQCeXZHV2qVnHaWIkdDTDCehsj0yMf1p0/224pw
         zRzM6FTYm5Bs0bj9i9KnsL9mpakkVeOuh4ecrDI/vGkiYX4hdPdqAXNQs7ox98A3/Ow9
         kRnz2XFOl8sI0a0u6CSdcKrh6nQeH+jaYtxoEsVqhJGfB9hgpYEX3RAckVliHZSwvkrP
         7xgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787269404; x=1787874204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+6/iD9uitv2o8+BkquhyWkx4ZTHDQ/4DAVwS8twCjao=;
        b=hcSzIvL8HJOp5DFbBG0CGbsHTQtGs1e1c1P+B6MQ36RM3md2ZE9+Z1R42U5NLSCH6c
         XdGoaVofnef4u1QbXsJDOcO7rTqpwOlCHExztpxvV5TsmKsLMIp8r/IRNBqGBLYilr0n
         y2ijE8EKOB024mxc2RvtChy9Fuec51VdHWXTW+LfJH1JApeZy5OHe9z+vccj3ebBsGVP
         YWvGc7SvdQOpNRJCKXvuifG+MOuvfTfVNlsDob1F8iWUHAcsmWk0Z+xNN16Nl32lMbh6
         xug3LhH7jtalTneULFz6p8YYA9iJJfXcMYycPq2XJslBn357Tl8DQc+JBlMPwHPtb6YH
         0jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787269404; x=1787874204;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6/iD9uitv2o8+BkquhyWkx4ZTHDQ/4DAVwS8twCjao=;
        b=msc4XALeiVHfI64Gueds7cTUetvqa84yEcjfXjcVXVCZjuG8MIusE0002KCXboLLta
         WnbvzytvlUAlfFCd2DGGnIeJsAWTPSwAM4EStDlhJnmSEBigpT9gNG+JsHhdE2GsMG77
         Q9xj5PLk8zbZEsKHBlegWcYsAuTD6EeoOVWhqPtvQG2pPeiji/gpaxCwwGEdJTWVV1GD
         6B7m0aRPfW+yVy8jBzFGqZ1OppPRs/c/M0UGmXVaO4P3B3aTxSGi0J0Y5abo2mTvwVET
         Q2tDiP+3bs1FUIHCn24V/dplFmxiPkbuXvFihx/hfyJY7OXc3UzgHix/LBdQK41Odf99
         qayw==
X-Forwarded-Encrypted: i=1; AHgh+RpGAkgdEigChtRAarDE/Xu/HUDsFyDkljgBF1+HF+wlG/TQhKYHW32h84g5WUCcF427+Jb5ApYN7XffJls=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf3xCH+eHXgqy17PIsAeyW7T00OHvdedHQEOMRUlVTzcT+eI17
	SuG8rWwEwyKviWaQxetOat1NUyiDh0yeeHDIH4IOsK12iud/zoQ0itBGLKSc/bpiC6UuvkRRp3j
	4lDEzeX2jPAzWQ++IpCMCSRTTyb+MOBKKAY6KpTv4
X-Gm-Gg: AR+sD11SEokgvsYUqB5yBbvwfVOPmY5SccI0cfz210A96edQ9JptQTrIUeFBUKS+iIz
	DEtMvuodyyyTOHyRXi/yfBmOsDNqqc7ITtIxaPW8IzEkIZNF16k83z3U7F2wG419zHRwi4x6MV3
	OjG5fkBsiQ6Kqyro3v3F7CBNKiOEQNIosZzVtkGyHXGdJbgdT+CJ2qDPJ+Uipkf7BT0sj2yZ0qD
	ak5edk67d8hCqcmLZof7zEJmDhbmZjmnu4PZdoegj3+8jApnfS/Nr1xCWfYqcsz/xczygjqL1k2
	zv1geVOUbgMcaVyaZNU9jEJAzOdgkISkL1nM81qD9bDx07Zzi3JG8j4CSGNtR0Ofmybhfl9y2gr
	gVdPz4JLp
X-Received: by 2002:a05:600d:8498:10b0:495:3ffd:5e39 with SMTP id
 5b1f17b1804b1-499b96bb829mr206755e9.3.1787269403807; Thu, 20 Aug 2026
 16:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
In-Reply-To: <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 20 Aug 2026 16:42:46 -0700
X-Gm-Features: AcwNN1Udef14G2LArp7Ykr4UYTpyjp3Xzj1gv8pPpjTIgCKojktSd_xlqRtrfuM
Message-ID: <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Thu, Aug 20, 2026 at 9:06=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Aug 20, 2026 at 2:57 PM BST, Gary Guo wrote:
> > From: Gary Guo <gary@garyguo.net>
> >
> > In Rust doc tests, there is a dummy `__module_firmware_test_init` funct=
ion
> > generated by the example in `module_firmware!`'s documentation, which j=
ust
> > returns zero. Many other documentation generates function that produces
> > zero. LKP test robot reports a `Flags::zeroed` instance; my local
> > reproduction has a `Bounded::new::<0>`.
> >
> > LLVM's MergeFunctionsPass incorrectly merge functions with the same KCF=
I
>
> This should read "with different KCFI type" (obviously).

Also the comment in the Makefile. With both instances fixed:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

The LLVM fix itself is trivial, and it looks like a pull request for
it already exists. I assume we'll want to drop this flag for fixed
LLVM versions when they're available.

Sami
