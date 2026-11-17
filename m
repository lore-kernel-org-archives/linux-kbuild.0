Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949112;
	b=SpBkDAdtk37RdyavIlvSaWikdL6WqBdk5uriDJzN3615XFEh8Qf8n/XjFL5JZFZVfZgM
	 m7esBYiw5465sfddQoH1OOBFSr6dK22zPnL1z5Etay2pRE0UKvIse75GarDxmIHd2glkf
	 9c5MJ02FTNKbMdMGWfmQGCAPbeK69a66WPmQEUoe+8gAyEXLBxNIL1dVy9pH47BWV0up1
	 4Bwq2DPyDZVt+tz2+4c13fGc/dYeWRBRW9a3jYHzmVk6kGFdZ1ovvqex7564mLUqUDcaY
	 ZxEwcKZTq0kFeaadgXssL0Nb5j67Z2oUiAcR2L0Cqq2p8nNhigBn5VbMY9M4c/Yl1xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=IQjnSpWNmOsfjWunLKeggnYLNfDLqDBiq6etlWznrnc=;
	b=sxiAmRTD4gL2T7loXn4EF8wWfDTJtYT9Iv8OfQ8GHgIof/T7OQQ8kg7YPDpNLf7TEkWq
	 y++L1aY5PNbtdBbEa6jXQXEhnLFAGW8+PGsLyzXbV9RFM2U+ftzFYxG8Hgzz5fHrGqrCa
	 xIRkp0i8U0KaJFaQ6RBQiDaNIlLOWHLqqzMUz+WySyujeI9zM6vEo3bnG73XttxNd7k0N
	 TwmBtry9+wgGizW1EQ81pGzHhuUO0HtcSs4yIYLwmehti7NPYdUuAXjmnI2iM8srHF5BN
	 285ARERVZM4JCpKO9hxlNl/Y20q3U3e9zUftldxkRBvsed8Wg7hibNsFNd0xsLPnedA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BEoG3bbe;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B510606A32F
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 20:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B510606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BEoG3bbe
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-499ca65ae87so58438f8f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 12:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794949110; x=1795553910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IQjnSpWNmOsfjWunLKeggnYLNfDLqDBiq6etlWznrnc=;
        b=BEoG3bbe+X44bTop85+JzGGwfeJez2VhBfP3wsedmgzc9Pq3AU7HvUtvfqz6q5ng7R
         vgXiokxG1NRobsTwMDn/FBLpEwCXDkFf5N0UzWcqum0rRdnPstluxWLUDGDK89O5r27/
         /AnPPVXhnzJbdaxuYmkpwnVB1SUkOiT6hS5cgzU0sp9WzvzQwaxfrcWKhixpJKKF6TCO
         QgtehKvx6RFHC35+VTRAqleyCLh/dCYMJqwtx18o35SUKQ4+K286LfykVDYMpXSVgzDt
         GeLCfwr9HmhEOeDf0Ynovdj/MHacld6x6QomeRn3xAQ94SDVf8MqKsQxlP2qpJtYWuvv
         V1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949110; x=1795553910;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQjnSpWNmOsfjWunLKeggnYLNfDLqDBiq6etlWznrnc=;
        b=DEx10jsBcu+/EwhtGAehwoqsixj0tnOmgcfEZdCv34sKOUXacBU+1Yqdv/kC7XXqEQ
         66lw+XYZXaTaYgbVKlKjvluwDzrRS9kqVksRvPEK3zCd+efpQcchih86051PKr7Qx3Uh
         yRPjNF52SzjTqR18fr998dZvkFZvfwNlq/p+5H827z7ToU51wopzcBX8CXP7pFm85jf7
         6a0Xf1sFaRIQ5tK8N0kejCtmjQH6oWsHazUkzC9J67ov/I3d+/4YHJvN4QEnDmiTOjTG
         KjQtoWO5QTqH/YpnpXgC2tnhIWDQ0HFTOiS2NNqq48X+Nx4tPauGdrYIC4lrKaHHcJzl
         tOMg==
X-Forwarded-Encrypted: i=1; AL+hErFCTSHYDiaLwnrcd9LngnmSWYbdK4cvPyo3AYQAa406nj+L2vW+XH3ihJjXEMGzNRw/3HslMxRqLEJHp2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eKsoMsKj17giTyTH0iws6R1t77tVfGStjQWHcRkc0yhOlRqo3
	edFJzWvhPijKyqs9Kyv+/yFn2SanA7cwT5ILgDH+XIXJn+AR9XVcIwaMWSiBD5rG/vZImsv6ay0
	oF0hgjZEtFm2DEKoIaw==
X-Received: from wrcz19.prod.google.com ([2002:a05:6000:4553:b0:497:e67e:6f53])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4a01:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-4a36c30c79bmr8397843f8f.1.1794949110053;
 Tue, 17 Nov 2026 12:58:30 -0800 (PST)
Date: Tue, 17 Nov 2026 20:58:29 +0000
In-Reply-To: <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com> <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
Message-ID: <avy_9SPRaPSKD8b4@google.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 11:20:18AM +0200, Miguel Ojeda wrote:
> On Fri, Aug 21, 2026 at 1:43=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > The LLVM fix itself is trivial, and it looks like a pull request for
> > it already exists. I assume we'll want to drop this flag for fixed
> > LLVM versions when they're available.
>=20
> I will link it in the commit message when I pick it up soon -- already
> did in https://github.com/Rust-for-Linux/linux/issues/1132.
>=20
> I also added the `-Z` flag to https://github.com/Rust-for-Linux/linux/iss=
ues/2.
>=20
> The `-Zmerge-functions` flag is internal but has been there since Rust
> 1.34.0 in upstream commit:
>=20
>   b91d211b4030 ("Add a target option "merge-functions" taking values
> in ("disabled", "trampolines", or "aliases (the default)) to allow
> targets to opt out of the MergeFunctions LLVM pass. Also add a
> corresponding -Z option with the same name and values.")
>=20
> so that should be fine, but I will ping upstream Rust so that they are
> aware we are using it.
>=20
> And, yeah, agreed, we probably should remove the flag conditionally
> later on, to confirm the bug is gone etc.

Function merging should also be disabled with gendwarfksyms. It causes
faux::Registration::as_raw() and Page::as_ptr() to get merged, which
incorrectly causes the former to get the CRC of the latter.

Alice
