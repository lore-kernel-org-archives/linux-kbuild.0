Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEEB246BCD
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Aug 2026 01:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787534126; cv=pass; b=lfEIxLhLVVVH63b9R1bXx6EGx3AdoynppSiqD+Iz0t9Lzo0A65c3ggYX1AHtTG7d+dZPDWqeO4VNrnSjeLz02s5kgp4toxZXwpdZBEW6t4gKd75F6555UN67x3mxcHBRPWqlyEppYkMtnRae41e45olwSI1JbktF9Qs4fe95ChU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787534126; c=relaxed/simple;
	bh=Wac+pf0DsXlahTayTTxHtjZ+4vjz4sfCHeWQqn9W9gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpFVZqysbTomzu5vETy6mPXYsROHA8oRmmGQE8C7m1QlOrnWdMKk/lnackA/orLGS/SvYMfFHOBRp/8cuCVotCygv+FtUSPYGSH+fk4BK0E2AjtGFFBQyXcilLDET18DkVKl5xcWIRVAaODcg+SKVvk7nHSfOV8YT/LhO9xxIZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lVozVddr; arc=pass smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lVozVddr"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cbe4592c193so244856a12.3
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Aug 2026 18:15:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787534125; cv=none;
        d=google.com; s=arc-20260327;
        b=c5SufAjP8rxSyV4ceGB2xrDEag1XV3MIlaZeBZfOJUOG7NKOeZ6K2QnGP34mBSc5nS
         38KnlXQZCUMmt5Qj1b6yGHcFoJU9zsimG0blMfZhjgm01Mf/3eHXMi4PIGMRiNta1vTI
         tYY7U4G9Arjif0yw41XKwpYUbopv0RDawKEkSkCGyFOkrAU50WvfP8KynQ+MXrbA4HGE
         9u0mTDLgy80sCtiCtZI5pIGnyWKYxQXvQUE9Hddwyr71N0S2yBiAg5Jsalqod5oNJQDd
         b2Ua7fH+irmNoyESsC5DOt9dWY0lJNCRzyu5mmC+RJYwqVlG1HIujxcbCxpiYcqa7qyI
         QLpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vGMvIaOFIbBkf0XrXpqeWleC5i415rguPHvnUqjmn7c=;
        fh=GFhmnCq14433Xwc5C/rggXq6vjOMpGtdabcfVzy198A=;
        b=ASMGWXhQf1gBx6IUZXFJn0XDKZaz0EjAHi1KdErDpJtWJjrNT0CkY6YeDj7US+hwlX
         6TP3fYKg3B2xLH0MfLYBIpR5EcszXcBN1eGxqVbJncjS822eO5n2U4DT6Up1ECwkLsuv
         QWHJddh53Ll9xPg21nSGMmCWytw3uqPofU1pTZecS3C51SX+SjAZOghrCWTv4TH/+73B
         pj7LuDYvnPDgDHoUTpsuegbOEOs+K3CLe60jCLCUJOH/7QLk7N5vdJ1uF15z7NvLNL89
         jPqGTKPufILjs9dawraT47MP0Nrkk6nUUc3QRzEdS2i/qMZvKezrP9+sWM4gCOTo2KOI
         PnAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787534125; x=1788138925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGMvIaOFIbBkf0XrXpqeWleC5i415rguPHvnUqjmn7c=;
        b=lVozVddrwveh9RYPQj+CvqDsGC1Ji7CNqy60SL6ouwK4UQ/Uek66mBSz3K2DQ6HciC
         pRKOYoZ2HyaR4jGjlfd2xE/J5F1GL0iVw26dLHp2JotyYjN0yqd40yppG1vRnj/+8Udk
         +qaMP4M3lW+x5NZZ41IrSQ7wIaywOV9qUmoLulLLedv1gFh7rIlMOiXKj9x+xPUwm4FT
         CK4P2epy3tZul+qe2vQHD/gHIrVN7mWCdY0VDtmW6LI93D3CA0B3NQlABsbghGnnqZcc
         xq/+jfmoZTB4wl41/hCQbTqNXytX9iWBwzD5lqq41hk3m/thKZ53zIvBfVe7mjHRknjp
         n4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787534125; x=1788138925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGMvIaOFIbBkf0XrXpqeWleC5i415rguPHvnUqjmn7c=;
        b=MbRXbUmW9Lu7wnJYA1FqVDNxlDbvFyS5cHzcHd6TQgkS0ldNqdz04eEJRq/DGGOeGq
         yO+ZNhNjjorkS507ISp7F5clJZHCWYjGAW7enY941+g/FyJj7WqUDzL97IRiwfgCIKCH
         wXCA87U9pSaY5tPcQ4M2QYbOTkZUNUKnJEwc/ozqt8HgCuydZQBHgvNY9MiIHAjd6Hvs
         wsz0Q7ju4v1W64FqJby3MkMa+148PXo+7QFIHIXkiciCMEgmuwKL7MSv37sT8z22bbod
         7V87DXXYeFffDCKZjSgXcvoJAjEnF81AZLeSox4FiVcXx03a6DTaAi8bIhCW17WZ42cs
         iS8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqkgaahTCMn6dYnWOpazADe4x3yaUotzoRG4y7bF7V82zQaaLX5ouBpnEkzePG0ejB4ZoUknhjgk9glNEk=@vger.kernel.org
X-Gm-Message-State: AFuF++mx2Gx/PEDwAN+JH/rMa3Nub2BDyR6MwqfBeEBBD6xRcK0picDA
	zzJ2VhM57vw0rtQQVHXvGCS1UUe4TnEaAfEfWFqECeyPVn9JYY08UmLrZSAFXIM1icK5czNWc89
	vt6XuKc08yCvnBR4L+TIw4CqyLc2KcG8=
X-Gm-Gg: AR+sD13yXS384UlmgcVuTKdbObVczylVuottFN2HCN4BU0YbPLPjt4kxwE0P4VNzmu2
	NeRqcG1iMNK2Z9l1gI/DYKjWKjZ8RIKo+Eq5tiVjf5LKcKZtw6E2sZrvte9euRsOSlLfNBljMZq
	NW28/+jzhjNV+IyDuP/R/dq00P8H9sUlARE108Pi0gDUvInazOJwbA78xT1C6V8Djr5rVk0WX63
	4U1CJ3oF0BvX0ZoKkObWSX7HveoW8uOwyiqX22t8tMNpDqT4l4d23EJuhZPpAcB+Tn4VmCozR0M
	LiPvpd0Qn0oShoqvm6/VRPrY2im/qLuM47nAWyDKUNtIpRtNoHRQJ+s2AofmUJeVzFLOnZS/Esp
	9iK2JjsSoRMi8rk+XnvdVzjd+azpSQTjMlmtM3sT1nN63efN6BpOl6rM0UNtx
X-Received: by 2002:a17:903:1447:b0:2ca:ecf6:9115 with SMTP id
 d9443c01a7336-2d64b009f3fmr217086915ad.2.1787534124733; Sun, 23 Aug 2026
 18:15:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org>
In-Reply-To: <20260820135733.37121-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Aug 2026 03:15:11 +0200
X-Gm-Features: AcwNN1UtjcFt1AZ5tdG-mZdaQzytXvl_AMwSBSeb5Dd5Blo5Jox-8q4zsp724Yo
Message-ID: <CANiq72=SL4A-UQbOxngRy8-6Q-qHKyGbqOTvqo=uJNyhr5nTzw@mail.gmail.com>
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

On Thu, Aug 20, 2026 at 3:57=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> In Rust doc tests, there is a dummy `__module_firmware_test_init` functio=
n
> generated by the example in `module_firmware!`'s documentation, which jus=
t
> returns zero. Many other documentation generates function that produces
> zero. LKP test robot reports a `Flags::zeroed` instance; my local
> reproduction has a `Bounded::new::<0>`.
>
> LLVM's MergeFunctionsPass incorrectly merge functions with the same KCFI
> type, causing `__module_firmware_test_init` being merged into one of the
> zero-returning function. As module init is invoked via indirect function
> call, KCFI is checked and this produces a KCFI failure.
>
> I've reported this bug to upstream LLVM [1]; in the mean time, disable
> function merging if CFI is enabled. No separate treatment is needed for
> CONFIG_RUST_INLINE_HELPERS, as Clang does not enable function merging by
> default.
>
> Reported-by: kernel test robot <yi1.lai@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202608201017.100a4511-lkp@intel.co=
m
> Link: https://github.com/llvm/llvm-project/issues/217629 [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>

    [ LLVM already has a pending PR:

        https://github.com/llvm/llvm-project/pull/217665

      which solves the issue. In addition, I asked upstream Rust if the
      unstable `-Zmerge-functions=3Ddisabled` flag will remain around:

        https://rust-lang.zulipchat.com/#narrow/channel/425075-rust-for-lin=
ux/topic/.60-Zmerge-functions.3Ddisabled.60/

      and it does indeed look like that will be the case. - Miguel ]

    [ Fixed typos as discussed. Reworded slightly for other typos. - Miguel=
 ]

    Link: https://github.com/llvm/llvm-project/issues/217629 [2]

    Cc: stable@vger.kernel.org
    Fixes: ca627e636551 ("rust: cfi: add support for CFI_CLANG with Rust")

Cheers,
Miguel
