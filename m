Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753E1370D63
	for <linux-kbuild@vger.kernel.org>; Thu,  2 Apr 2026 07:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775113958; cv=pass; b=XHSSScJveh9jszXK+MvKBnnykRJ2bYhAjz0oCHWYkbg3BROIER5XdXPk47jfxFIONPFpPu3m5rIDt3On6DR5gsFRMZrxmBmqqWCdsHVk4GLe+mFAn1tY82KRTEQDB6rsVX8CMHxeip2qWisCIcOALZ/U6iXyc7eDIu0GdooQ/GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775113958; c=relaxed/simple;
	bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMRfSnOdn2OKRxI5OtGVxAN+PXnL3Jj8PzjKvPrbRmn3F87/6MTY5rcMKN91RWCrg429xNwugLqRnnr3i/Gcdxc+qqyf93d1D9QxSfltLaVTYplNuyn0QaoiQTvUAgqz3Iym0K4PW6uTjX6UnXV4/VpSNSSdFCfJ2sMDKLdMd8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rctgc0sm; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rctgc0sm"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c44547f6d5so19101eec.2
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Apr 2026 00:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775113957; cv=none;
        d=google.com; s=arc-20240605;
        b=OC00qIfFkr9Yjd7yB0cW1dSRfUM0AGUMM0sCvtTzWlkW2EpkL/uhMDDeDSOSumihh8
         zrlUac++7mFToMIWwwlGnM7fnsbRVf6jFyIJ3cGP9xANOJR5Ry48l2z1+rjlrrUTXJBP
         bXMtkCP+bZvcOC13njfTtmFk6diwy3Y4rtmcgQIX6bv+xIKLkyL4Vj5vvxwTMQq3bJkq
         7CZefctHwfbVbX9dpXrlgQ0zcWe5R1D1dVKUVP0dep373M0U3jXTb8Th8CcwmfKdlywr
         7PjI5GtQVa4pI7b2unwhjX9kPPeLZBd3JAz++dSe6g0dAGWrqzuGDzuc98qJXgieTDEC
         oujA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        fh=I2Dk3FxKMo7jsXkrHSyf2U7kTjI+YBmcxzUwKCnR7Wg=;
        b=gd//2/8MJ+5zl5V29jcMHgQL9Nc0zDf1VEIhIae5mD9IDYhFFJPEtnHeStPCp8SVuB
         qLFLsdm+kgSr28a7SzQfllN/YUWcUGgIJPexMyAUrxGqphE3n+sWdb0JXfrmurfzJ0b4
         5xh8VdDecoLQkGXznxV3KHIRG6gC8J2JS0SUNOOSlg3/Q451fEqn2366joXi1T3PzaD6
         RWH0/qmsy9eFjbRNWMMZmYCTjTJ5R5EAcOJdUPhS3POjHC5XzmfNVxGpfpD2r2vRvMbL
         gZeThTeVgkbzMDH4FdRc7o7g6KVffcYlmqaOCIcAov3Kts9ztePCrg+52thdeOQCkepv
         3vcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775113957; x=1775718757; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=Rctgc0smJaz1L/DzT0w31Pkz2ioXDTbLbdLHju8I+MYH+TZcUE3kHlF1I3EWm1SyCh
         eQiNL6PiFdoKan04df3xcrWzktvgLtMghA82LhAy1WM8mvZxgLz1GSwI8XqGOCnMQ7YT
         2D1lyJ0uq3ZCMkSjEpGiGkD4H86zNRjQKPGPw6RpZfq6HwjQJWO20WsfP29oaR3kWllo
         UTeti7cU9wsmV9EetTySmlcHgqjE7xKikJY34Of/cFLLlkcsUWK4X7Vkycacqi4xDHHa
         3JLgo68Gh6qywE0saN37PiY4ogF+/E6JrqwZSKSReopxi6fjf65hPIDqvZnM7SCkNmQJ
         AROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113957; x=1775718757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=J9Y9FnDqpZRyrf5TSW7JZCyqBDWoo6xbQ8vpPuK7eEiZK779nvtX85d8GO6x7BJ2T8
         JO1K8uSsnjCyvOl2wjDYuyMFYaA1jiN2f6FUqImMRYBsIGPB6MlgAOtm116oX05kG6Rp
         /4o1PZn7Ci733XkuwzAU5lw/2qY7EyOTLQVMdt+YB8Cyl6xS4AWG8cMK50qvc7e8Grfv
         TwUcVSBVnG3CsCSqnoQMpox3lbhdawX4C2M2fXu0Wv9hJa9IMBzkvagG0rFDDdC1cls4
         F2mZ0+SUooDzgPJRdvDP5dEEVaLWRufXDA4SRtYY4uAr5e40RslbSfc+BbbcGDWO9Q3v
         Blog==
X-Forwarded-Encrypted: i=1; AJvYcCWn77iChaA1uQCFs66FdzqOrfcKodctVQKQXEeUSiUSD6Y/lfeikNtbs4d/UihyZNZklPJ9jn/q9FQWjz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRf0RrxryxwjKt4mbRjsH+m5gc0OZWnlgYrn4KOnM6BES2kZCT
	QhVZfHGI3HBM2UXIcSPskCaE0xJluakqRezx7X4Bw1plJT+I9xFRubbvK7jyj87AE+J11eMRW22
	xXx59asl0VE/EDbHgZxO0SW7EXP+Jlhk=
X-Gm-Gg: ATEYQzwByZGHNfjQvzKa6puZDFcZnU2VP6GJ/NA5IIYzqrFda71TKXISoGEDrv16DaO
	3ctpIPlnfEJmigAFNE9+QlmQzon1+nJQetaQo9WPcRgRTyMyvCpIvhFz0yuAMuTtugTwfE4kMNj
	DQwpiGTzSkiPL4yuV+I8UV23ThJAy/E/AG6P3v1nGTpBmDdMohwurRMDv4D/xLYPGKlVPkM0xdi
	xUgwRQaZqyomR7x4l43EsWi5/x9BnvVPEWDIXtLezvDH9EyJ30O8DyLF98olE+LAbAVu+WcI0DT
	Yc1BQYPw89D+KE/0XtYcwrOESYfEW0VRkWKKpNn6tuFxc7mNhzio+2ryKj7Vr+Qe52aa7fnJS+c
	wIUuQ1NBBsLS/qzpILjlHYw4=
X-Received: by 2002:a05:7301:6790:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c9321b7bf4mr1634311eec.4.1775113956496; Thu, 02 Apr 2026
 00:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-16-ojeda@kernel.org>
 <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
In-Reply-To: <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Apr 2026 09:12:22 +0200
X-Gm-Features: AQROBzDaEWueCbjTzytnJo43NDIAkvyWYngeEqQLnAsLh-4PZJOJIJpad43tD2c
Message-ID: <CANiq72n4sCU=2m4Uee8Wpsv3mjkw_BuT8Sg54Gu0U68j7qAM5A@mail.gmail.com>
Subject: Re: [PATCH 15/33] rust: rust_is_available: remove warning for
 0.66.[01] buggy versions
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 4:58=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> The scripts/rust_is_available.sh change looks correct to me, although I c=
ouldn't
> get scripts/rust_is_available_test.py to run on NixOS.
>
> Looks like it filtered out PATH but uses /usr/bin/env to find python bina=
ry? For
> obvious reasons that will only work if python is located /usr/bin/python.

Yeah, the script has some assumptions on it (e.g. it also assumes
`dash` behavior vs. `bash` in a couple tests which I should relax
too). Happy to change that.

Thanks for testing it :)

Cheers,
Miguel
