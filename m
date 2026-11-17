Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794953026;
	b=ZNxAaabPZO0vVgURBDzyC1/Wiujn3zyGjTnefr4byFUl5rRUkKBlrCw1MEUT5wMg77pF
	 tsUZTY52USumRi65H+YoWix2yfdlFoLLS8HRsOzDJebZd60dRbaZPv+ftdgMPiJkiqQp6
	 XADxTvLBv5/YiQQLfSWY6GLzEA9QLbee+kuw9dUH7Sbu3vU00JSwjt/5O7L5LDl+DhP/H
	 bIE/ADpdYLuVmoMBy+LLBRo1S09Rd7f/KkxO6E90Caono4IH2UX8rV6JyZ/eBN4IotMKs
	 +uauYdw2twBDx1R5pkiDYkBNQdEQnnyr/1s3ez66tYRYhJKGlJxRN/1yrSjMzIhy5XQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
	b=fmysMv8d9OXUZsGDAWvlsb6QHMTYb+Ilbtot7i7KEYEkMOAElDKco/nSGaCkPXyzE05L
	 XjvTvUsOqunckw3yNBkl/90rqHN5+aKr1TDstJW5Xw0fsbNMa4ThkJ393LrecoLUZ+mDW
	 hCG6O3G+5hExZiLTCjFsCyHixqor8XM72U9MJRERoyNs+GDy7aemH+Hg2VOyFbYIbfl7T
	 eonDlkD7RYLWe5mpZR2KzTGwgifZGjBOZ07F5I8vAlvv1NxlnWIRFxyHP1JKO6LNi3ljS
	 t3oIE73n2p6+ofHrW7H9SUjF6Zqay30aybJD+WlNaL9WQ6COWxhkVLoblNNmJ37jIDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CPP46e7p;
	arc=fail smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A1E606A32F
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 22:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A1E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CPP46e7p
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so5925e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 14:03:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953024; cv=none;
        d=google.com; s=arc-20260327;
        b=H0cAeAwmS+oyVsCPr93DiDjbxc7Rjd4Xa3BCAGWto0DlRHHoI5TooEnkzQnqpAOSCp
         fnqBJYlkgzruoBbbTRh7XEy9Olj8A+UOvxFr/XDWG/+ywGDIj3K8CjmjTeBndDbpPzFM
         3CQgcIr1+tfbsWFLRAMbwoRv+LL8u7lx/fqLe4E0l2kn+DbO5yWsBXSqWfixpgvYz/4H
         AbgveiZVRUr1v3ep/nyhNxKrl3CDfEiYde0lfyr+i1cbWZKlxs9ywBZvQI5UYWqynZP7
         +A2Y4UJms3K9021Ejz+qCCsgGNbU5cD63ZMEG2Ohj2VYGnx43mZI/w3c6Qrg9YU4KjfJ
         I3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
        fh=ajrOjOyhvCuq7035R6uo9rrRlFTfgQ5qkDVGxs9xJjM=;
        b=izXl/Cr+j155xMwjsNyGTSsNpfwaj3DhpMnbZZJ8R7kW4opByxuPoQATJAEBsN/ScE
         IhEu7rZQ7sDpogiXGDn92SPSTMcLWLr5KbsgEh2bw7rmXWqyrGsoyBukehIEVH2FNgB9
         IJC2gJ4X27vk0A8DL20GyxFh2a3jWuZskbmqT+rqNB+tF8QZX1M+HsEhIegsp+r4BTwX
         9fNEswdMjLQ7yHjabW63A9ywLWO7/+uLt1cBfnqLZm0CSuwiKFh+SZ6SzRh5FcWb9AJZ
         AOrUrTSu+H9R5e6j0MonIm6bT440/No2oy8IB8k1WOnjJbBH6DdegeMN8AcN26dI5pGH
         dNyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794953024; x=1795557824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
        b=CPP46e7pW7D2EKCMhL3duB3Ttj1WkwUWH77GlFJWMG3egP2uW2EDozE7j0KlFfbu82
         vmWvZt+shRzbBb568r3W4oZ3kkanu+oVMm5uNOCMvdPl0pWGQkpSULb4Fcx65nx/1E8h
         1tjcRex227rHDsOXrHVd/vxcifMXCkt/PZDBFmmEYoObF6RbquX3XnSuq8jShWRlwaml
         opPHinrD942cE1SfNWFs7pFl0GS8kXIMGFpnwg9N/vQRAsLx4OwT9c085sZMxx2jDVIV
         skQMdpBFaqiPwYTJKe5pDaLkVpzIT8aBefHYN0V0L/pvzClyZrCrFwMIb9nOaeF3TJwg
         mLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953024; x=1795557824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ckejA570RD3D78V/L1UsrizD8mwzoxVTkTj1dMWPzK4=;
        b=N8ubmIvnoXOO6Y6Uu600KjJc+YwxPmzonL9b5wD9DAT39FLD1TSiyqt6sU4Bkn0aG4
         ert6dubQOfnyeuBShaDHNG9fasj4OlrOqg2F3/lpHo5kuNJRoBmuybWSQsw80EsQn0o2
         fNc28jJUjIEQwl7fDR6Mmmap4/xqUK7lfvQhJJbnOj+YI2DQgPHSgMQLyP8AUpsUxl6k
         OLeIXwrIo6BxdYwB5S1WR/12VB8Dl1gRnzV/sfWmmVchYb9vVUqowXhjuAuqwmNjyaVw
         JucoTPYkw16GFV/D1Eze947xGY3bUx6hLKeNJOdyj5G3i06i3qJ4jh3Mz3DmfS34eAq7
         HkYg==
X-Forwarded-Encrypted: i=1; AL+hErF8O12H6nmcvKyyeTXFa4EIfY99ndBOwXaNNqvOxYi2yDupnzDrOabphuJl3QnXyIWbjOazKiasi1bRqaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eSRXa/ad7ihHUlKDO0mD7NgnXAzBUnDAKpR9vDXRTY6nNO1Pe
	T1C4d4/VDfW1dSkZj7Wb8Esh+wprQKK5yk8obpRq119N9m0kE056f7dYJs6DHVPGkz+DRGX+OMJ
	Y7+bCVLVCtkJpFDH3mMhdlqMjJ7TGxfPK1bpXqOm4
X-Gm-Gg: AYBFou3wErP235vdE0TO5yQelaW151uLYaFIRtH67JxPs7eH3o/+8B/wYzvwQTm8n2m
	exWxiTsl/EkMHO5qRG5EH+5/idE/e/Frxjls2X8E+W90AkkTYhnsr3o/wWwKY348LJyIyBUnkzm
	ChFdWJIb1s1kyqaKllSL9CKevHYI7sOmoL8dpbf5rqCjgEXbDB5FPXGVXP4mF3nghJVCRUwpawW
	bGRsvbCaFPcI3Pqr2BJGyg2HE8x/qpdSS3oGZjpL2q/ySXc2874rkFDqipk3PgGVoKwLx3NMgXR
	vc1nqzODnfyGO2Wc7dheISG7nKnJTLeVHZXQe9Lc/MtQ0F5b74zlp/T9I7kVQoukBFQdv0vzN4v
	JEW2o0dE5v6/RyHTvxfDt31lcSuuLSpUH5A==
X-Received: by 2002:a05:600c:8586:b0:4a1:d225:6d7 with SMTP id
 5b1f17b1804b1-4bb7d58b5f2mr160695e9.3.1794953023558; Tue, 17 Nov 2026
 14:03:43 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com>
 <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com> <avy_9SPRaPSKD8b4@google.com>
In-Reply-To: <avy_9SPRaPSKD8b4@google.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 17 Nov 2026 14:03:06 -0800
X-Gm-Features: Aa3M54obldq6YruWajcrqkfkI0bnKtN_pPopxVMwZ7IRPXUGwGNOW9PukA8ODCo
Message-ID: <CABCJKue=wV7gx5D1PuBWOgWnAFC2kzGSFSqshun3=AoLg6b=_w@mail.gmail.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> Function merging should also be disabled with gendwarfksyms. It causes
> faux::Registration::as_raw() and Page::as_ptr() to get merged, which
> incorrectly causes the former to get the CRC of the latter.

Sounds reasonable to me. Although, I assume this is only really a
problem if the functions stop being merged later on, e.g. because
they're no longer ABI compatible?

Sami
