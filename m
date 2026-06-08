Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9909537F8C3
	for <linux-kbuild@vger.kernel.org>; Mon,  8 Jun 2026 15:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780933217; cv=pass; b=RPwirET59f1e1XCs7PL0SzClH381AWjAMspKp3dLxAhQdKEAhaMVqTEG+KnjVJVLROhBL3zrg4GMzIdjcnOhiK/izdSeJcFroJZ18fjerReM8Bsqd23W6hEDKbKWGJSlBJWHxNaNOWe2s9IdBNu0nWNwFfXnyy0bTK12WX23UuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780933217; c=relaxed/simple;
	bh=GXuj61UkEy/xhyiQJ6Xp8wvoyVElDlg+WL0SOn6KuyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nw6cnoa39aey+RNP/mVijp16VRVKy4tlPDWPKoE9ZqdOn+f6B3fnRM+eOV0vfcuyNBPEs3WI1CsbXsCWTqDTUYE/Z2I9ANT5L0I9p+xphO0p+6/FZw32loMFpdLo2yatN9K0/SUL0DaJWpVgUI0hqUz6dZx2nJKmBnkJ+g9jjP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZ5Ec2+/; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZ5Ec2+/"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-304da3b4508so455088eec.2
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Jun 2026 08:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780933216; cv=none;
        d=google.com; s=arc-20240605;
        b=eEdGEOb8gXzX72NMD+NifmJLfkOduoGaWpCkE4biIuYNTlH5iE+ntG9WZHtYKsWBLy
         zEZugE0iQkmWUi30e5Zs5s3TorTAftSQvV8ga4djmEVIcghd1p23Y26GmKypKZ24f8Ib
         LuzYE2/v1GVNjDNReCwbrlftkWI2l8BGzXwZg7YJIttBGKNBgvJEc5XezPx7MFUk0Act
         /ZolHa2A+nsFXju455wH2bYkVE3obvBZJQVqHJz4XIWsZHyV/34TsNlidZgu1DMktJxw
         1pKfROOsNPTEFUHGwjTplO0Fn0pVJxVS8TQ45YPHT3G0bD/cf/m2KUr2927vbgzohO+H
         gn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fbtjgTASVB8n0Zj704ExR3kHsKh640ZRgGdQxOt+blE=;
        fh=r5sD99Wx8tzkOJSvGI0AngnZV2LNilvuJcXV83Qu3AQ=;
        b=Z8Rdudd8wi3Owxkh7iDV6nPtHMAUXlpSvUAcpVJIQlPiAmZFBKMee5MHop4lNW6vDE
         6B1NYd7nPPwni13tb3gJpoeSWf9qdPzuKzOLK+nTTraww453wfxQphywfMrg2n7EeV4N
         TO39OXsAPbFoe+XmQMqR3Y5672RAcWr1VZJOjKMkNXw+4Bl4NDsDuY8kdAiYuZrMbXkt
         EaVcAPDNwqpI3+fCkhMTGFTMX+6TXPAcXFfyQR/oCIovWVBvrd2jytaz0ISPyjPV6gXT
         Kqx2F6Zr0Hlx0e2Lcs/bwrFX7IlNlQQkcLhY0c+/ObgTUctUyHPhx/r3pKf8Wp5vdvvz
         4nfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780933216; x=1781538016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbtjgTASVB8n0Zj704ExR3kHsKh640ZRgGdQxOt+blE=;
        b=XZ5Ec2+/iXoB36M6RsYvI8e6tl4Cy/0uBvQME0gCf6jOq3RehRv7xqmY1qFFSlwR2q
         FNjLfA87y8KpsVs+fBBNrdLzDrXsLurzaENMgrSHYQq6F1uTqubZ6N6+aHI2hSzbEWZw
         /UbSJt4Z9QiP4ipSLSEN6Bo4r10ANnQiifJ9i4mgJLyfcHgOL+LNSOf99f9852wZymkQ
         8/pEOdvnUyf3SYwrMsUgL5knZ8JBIsQWGqDpLoTZUHqJWyDRlevMiOdOwSvgD5thJr/j
         QVk7fyuxPJY2FwrWVcv6z1+n5sHvwSlXj0EN0wpuRaOAFPRfJLibPR62HyS7s9/noVDA
         TACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780933216; x=1781538016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fbtjgTASVB8n0Zj704ExR3kHsKh640ZRgGdQxOt+blE=;
        b=D1ZP0v2P30wF4npobiID7HznanjWbQZVAlYNoGGisPAwzZ3ekOrOGpZKU110g613WW
         Hr/QPR+nTgJk4DQ3itoMG+/ihZ9JaNBhp5kBYu2nuJU11Qi2asc1CMOpiFQt8wLGq58m
         1EdgqFM2h3c4ijQquOpfcBG6C7vvDxQ7aXufiDTEx8q7MxbFxgbL3YCn84x/OnMjHEB2
         Trf0P9B4r/y/pWrJACJlJdaYXXpexN4YAWWn1H8+s6YvJ+T92shY/jJaGkrP+uZFF+xx
         L5+q9QNE8iZPYCc8kJcgD5gZX38F+GN6sEx+CdGt10r7L1HPMdP08HmrQvN8hwDvyz+D
         +DmQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZppUTidsrhHTotwb0hHZ97wxHfygWEc5Tb7D7slwjO8cvysd04j/+n1neut4i97fSRyI2oOJWVbvs7yI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEn4DaQepMwtNNDtp769IVKHelYWLn8WdItVVWxU19uv5y9TMg
	yyAZcm9uSUmHs5yCmk2CbX5i7cFM4N9VH0sAn+HytWMb0/bQ8StwTv+iQmd+Sv3qlL7Q3b64tkv
	TEsyNlz+wtnHY9Tr/G3/9+0aCXSh7Wyg=
X-Gm-Gg: Acq92OF7ZtI2g7F4sKMoTTj7+3id/WiLU1lhkg9nAiftGLPTogVa90zQmWSMCWPEPIF
	TJUyydzjNngeEHUEFKHa1mbD2dwN/tqAEhCgcASnTYcrvLzJKRTdcGFjZ4Szqw+CGo2TFy6IZy4
	jIlrMijeJJVpM0fUAhYT5h3J2oNpOCnaghgfm03LMqfrupSPE+GHYxP0zmDpxAdRFKu8f4SJuzK
	BGs+AeUYC7hqNe+fdJTBVcOdC3FpTMkLg4enyOiEKzMbPkS2p9Tz+0MNh+xiFEIlKu+9kUobspF
	kSwc+LZZagU2RnnuDsDJvofqkNh+uB7b3LsfAjQlZxYcatGL9snJ9QcJbb53kr+BDZDK4Rbv0wn
	8tQNdtOqMAy4K4JtpcEpBs3UKlFmGMAdkmA==
X-Received: by 2002:a05:7300:5723:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-3077af4a612mr4123251eec.2.1780933215524; Mon, 08 Jun 2026
 08:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602172920.30342-1-ojeda@kernel.org> <20260602172920.30342-6-ojeda@kernel.org>
 <aibUgUSlz-p2oxvX@derry.ads.avm.de>
In-Reply-To: <aibUgUSlz-p2oxvX@derry.ads.avm.de>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 17:40:02 +0200
X-Gm-Features: AVVi8CeA6U7lKrl1L7lilSL1NyjsoddOewvCmiGSVBHJ2r8bcZWQDk54VJo28uc
Message-ID: <CANiq72nWBSTXz8VBkMuf_Bcs2MgZ31nocL3o_s7HYv=HbVK_-g@mail.gmail.com>
Subject: Re: [PATCH 05/18] rust: kbuild: define `procmacro-extension` variable
To: Nicolas Schier <nsc@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 5:10=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wrot=
e:
>
> Where does the 'libname.%' pattern come from?  Looking at the current
> users of cmd_rustc_procmacro I'd expect a 'lib%' pattern instead.

Here, we want to extract the extension the operating system uses --
this was originally added for macOS build support (Cc Tamir), and is
`.so` in Linux but `.dylib` there (and if I recall correctly, we
couldn't force `rustc` in macOS to use a file with `.so` as the
extension, sadly).

In the commands, however, what we are trying to extract is the name of
the crate instead. So that is why one is `lib%` and the other
`libname.%` (a dummy library name).

Or do you mean something else?

Thanks a lot for the reviews! By the way, I sent a bit ago v2 (it
doesn't change much, so I will pick your tags from here :)

Cheers,
Miguel
