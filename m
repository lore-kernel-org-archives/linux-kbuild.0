Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FCD3F65EF
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 10:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567637; cv=pass; b=B8xFlLgX7nlieVUgFIsp87ZJhnpKsFofhy8PtzvtqyPmUgyTqjgujbcGn7kGAyLVYdJR0xYa7J6lcVP5miuG//oE7ifq0nfnUaTu/CgN/D/r6c4w592gi55uu6eozsvjWbyhmNMZ3mQI0UtIoJiuTixBdpbnF643lgj70H4AHaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567637; c=relaxed/simple;
	bh=rTsk7zAhD79ApS0/sKWkLliFhDHabfK66J0Rk8Rj+zY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NmHdk5ZGBDhJz8lIxKHOgE/jODpluK0MBv/oxPAlm9zH4A1GFo1dj3uBofq+2aB8YccYKqvy7xoS/Z5yq+X7fwO93H7uz+iCy9jbMSAPrmvsI1iBnGtKUNFhElxvKe080a2V54BrXlM4n2YHt6904MDPkaibUZOQj5aF8IUVcd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QulusW1J; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QulusW1J"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84a6f026675so225728b3a.0
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 03:33:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787567635; cv=none;
        d=google.com; s=arc-20260327;
        b=KyjuTogFeyfhARzGOo2F6u2XYumiPETisCeEQMR1qx2PdLrwozYFldCOhRxwNGvAm1
         yhsCDLjt6/22u/Yei1JQrpIYjpjrubS/Sj0vgzsYHMbt8tcGjQW42FAH/EmJC5i/mdp6
         t1FbInfJ/wqMxPVbBfAPCUdnkTtfGn00kq59aTqiUFHSeU4fND7Gl1bpay+s+Zi6MqUR
         83icMXJ3XefEXpZyvUJV1ZgdV1c8EWVbrmlzdDeXVdFHlmfnvCUMWeQJCq4FBuPTRi21
         RiLMnR5M/HQXG8sd2VoVjSXEnn6rtfdMHwPiEuwyZunq7BspfiWsjklK1S7XYD+KeJlK
         6t4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3Sxqv7JcbCSLDzUPku5fhjtOE0dghfe3mxOBWPzMEpk=;
        fh=5feZuSB0+uCRGWaGvDvab2J+si3OGDd+PoXU4k7t+Y0=;
        b=F+oLoscB1hkJR9LexkounK9BJpbXq6+My04K2xQxdonsC4800Ghhjl40z/361IVx+W
         t8MlENcz7aub5dcnOBXRbWZHang7yM5KS/vvjt/7agigc/CwQvLJienFOR/Tu6wUpyzk
         d6Rc/nGtSsy5Mkmb63ISjVJwFamrY2o76gVKj0L32xUUkteLNGwznxKSUXkq/+Tf44MN
         yElVnIPXahN5bBsEw0kfuxV5fz4MvOqcry5MFkhgdzhytk2Yor3CvzGDfbBAOGih6ilp
         01F6tXEjbVxPNYPF1hXPLtV0B5C3ebDPazC99M5NEjG7TkBGvcrJ6oQL8y5XNLR4R78x
         aPYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787567635; x=1788172435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Sxqv7JcbCSLDzUPku5fhjtOE0dghfe3mxOBWPzMEpk=;
        b=QulusW1JRP++7Bg5FKks8SIRgRBjw05QfmLWOjf86PEGu/25FoRfYgne2kTZh5kjsU
         TtJdA6AxUyf6TJ/to1jFsgX1BMk2ArJA5rqhp0OcUQSA7AtlOes5qOoagnPXu6j8cYJi
         AL4IaDaWBqYs3azjZch6k5F8JOl31M8lwbZn8WfKdW8MzWD/S35YFatxvdwg7Xn6Xa5R
         kia/LAtRP/bijM9+tOEpqAMsGerS2TOfH3072gOA6w0T+HsvBYeIJYV7TisdxuEUHyPI
         MiX237+bE0hiM8Ff7KNtqGTxDCDIjbNVs1WOZ4LSXkYPOIWX+0Xwz3SIR8lCbcZBpsBS
         mhdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787567635; x=1788172435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Sxqv7JcbCSLDzUPku5fhjtOE0dghfe3mxOBWPzMEpk=;
        b=jWLoNTeTBuIlWSIDUsb/wqh0QJ5NHsleClgs+8dnJ1VrQv5Di0XYfpW06SBu835gzY
         40Kr4LUPSof1zeR5Rn5toi8NJkHnyhw3bRNgsxrpDKglM9jZ9+wUQAEzEvgod+G+PQu9
         eDNadab3K2esTOzo1MhQBOPt5GBAma07NQ59fn2cRqhZfvmTqfi1dAnIikBTcOHSQjQK
         iNuT4CWkZeQsJxffTwdCfnEAetsDjZzA56SIerIc5JDbKmMeRjjNXl+wfPN7v7BpuyiK
         sRQcYTdrB6tLL7U0u+VQVrA9NlTL3A8qvNqtY4VTIv/zPLDMM6Wu/VUFIT4W9JHuZ9BH
         djHA==
X-Forwarded-Encrypted: i=1; AHgh+RpGP9hwxW7V8nHsmHB+ialHHaXvT0mvTASCCuCIjfmV3loc46kWLkoJFYUQhtIgj1InkHJgraVfni1K30c=@vger.kernel.org
X-Gm-Message-State: AFuF++n9lXNXuZu5pN5BfWTibOq2akkQtboZdRV/f2DTermbnwTQAeHx
	aPQ5jZDPWQrxnCUrLa0VpZzYC4ShnGqFh/ESXzi6p5tmeELC3uwDC9Np+NVCjPbD9slt0gdsh7Q
	S8cjrsMMzIIqo3grjoUgv9+twTysTGKg=
X-Gm-Gg: AR+sD12ELGilAwXH97AcV8xMVkCftoIPJ7Sf4iNeVpkZYnCPKUQvNIjrlylBMSOHn02
	zGiOVRMuPTBOYCUNz/im/dkWGWlUHCSBGoSHRw3PGVP8qLcwW2RRznN05EvhcbJwmVui/JNT7Mr
	EaV/OxynhDiDYmkXCMOFI3j4lbFlul8Q6FwOzWmkbtorytT5hV5iZz1wzzwiiB+0D1V0b0YRHtx
	bNeAs9bud47aADG+TLXulX+sHxLcuznt+n6X7nVU/l1AmmxTcfP4NR4vPq2WzAbo0AJrZ6rdNiz
	jIbFSw63tZ+/bfXFbo/mTcj4isxred6/vF+uq/+Duec3EBbxj2ttdFGcfov264OM/7zMGXD1TWD
	Yz1mmDF4JkwhGR1nXJZVN4kCr7txDJK9XijklFU63K7sRnGDvBSdpWFzoD09k
X-Received: by 2002:a17:903:b43:b0:2d2:a952:2628 with SMTP id
 d9443c01a7336-2d64b0d7b26mr223449495ad.2.1787567635111; Mon, 24 Aug 2026
 03:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260816133233.197500-1-ojeda@kernel.org> <20260816133233.197500-2-ojeda@kernel.org>
 <20260817181212.GA1249844@ax162>
In-Reply-To: <20260817181212.GA1249844@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 12:33:42 +0200
X-Gm-Features: AcwNN1UQhMeA17Nam-JDCwmn02-8UCEoZ5cc2iWtmyDKrZlCDreN1zPgzdBNxyQ
Message-ID: <CANiq72mAy93vnGZJ+wfwh2epJqSpOhF6XBK7K9XWC6mVEcPT8g@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: rust: keep Rust objects out of Clang LTO with
 inline helpers
To: Nathan Chancellor <nathan@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Matthew Maurer <mmaurer@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kbuild@vger.kernel.org, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 8:12=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I am not sure we can use '-mllvm -trap-unreachable' for C code, as that
> would mess with manually inserted calls to __builtin_unreachable(). It
> has come up before:
>
>   https://lore.kernel.org/CAHk-=3DwgPCbZv0JgqoNWMOO+p=3DN772YW16xYk_pmb1G=
U7aeuPFA@mail.gmail.com/
>
> It is possible the '-no-trap-after-noreturn' avoids that particular
> issue but I still think the "compiler inserted" vs. "user inserted"
> distinction that Linus comments on is likely still potentially relevant.

Thanks Nathan -- yeah, that is the kind of "intended" thing I was
wondering about in my note above... It would be nice if there could be
a distinction between the developer-provided ones and the ones that
get inserted for other reasons.

Ok, I picked these up to fix the immediate issue, since they only
affect the experimental mode and only the Rust side. If there is a
better approach available in the future, then great.

Cheers,
Miguel
