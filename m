Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3C732B11C
	for <linux-kbuild@vger.kernel.org>; Sun, 23 Aug 2026 19:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787515024; cv=pass; b=KZUqTg6V1MbFCNaDH3r5p5I95VEFyP5QX34ite5dGQFB4HRGpi0U5rmBmaGkMPLDP3IBAfaRtKH8cjFyVCayhB0tOBUWhY7r5kC7jlT9swvSyJ+im5rm1Wla3IZ5NXcBqmLrHC+3g4fvi8nLGpJsNR5KW9MlhxkhDJHvFVNNnz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787515024; c=relaxed/simple;
	bh=e2YoJilRz/kvEUdFVBsJmCEXRlY5jUYdOLcC6Jc4EhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBYdd34HL4z9Tyfe1964hWWZkwri3/NDUSUptYxksSVXQk3RRewYxYFisqBckmK8k7YbMsezzY/mLEJK2k66PAhNIQOfM9z4pjBrcZUmQXGWD9FQFSRWlMpA2hhvBB6oYtItELV3F3Ybs61u6zREqn0nsXhZdxr2bUN9MsyN7zA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=busaXdU1; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="busaXdU1"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-384caf7b168so243404a91.1
        for <linux-kbuild@vger.kernel.org>; Sun, 23 Aug 2026 12:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787515022; cv=none;
        d=google.com; s=arc-20260327;
        b=e/w+gPMJM7X7Dmvo4vpNiukMVkFV33gRSwCMak6fK7EoaxjGgOliFgd1o+pqKU4vqb
         pPIcwJkTXCC1FyrE4WHWGIiffR2alu7c/gV9pY2qo34lDPUf//o4AuOYa5D+DPH3lmW5
         1xjebLY5uuvSd4YzqqjGuT/og7+wxdyfeRvF/rInbH6lTjjtzp4AwWDY3I8yTSrAdVvv
         8BDb9B7rKDLNnspPuHpxRbLa62z/w3xehBWzgykj2OxGYij7JZX4xn3Vd6cg0hcfFf7v
         R5neB5Z1aXFnoT/k4B4bwi+0VVQjd51TuWGH0wkLqOjFZzZIzmxyo93mFOjTYK5twFmT
         fwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ii9pPTvyH4snmu+QWWQwVRnHwnpxENjOJQSzf5Bngrs=;
        fh=o34gJUluHuzpAWl8feiJInBz4FLW7G14xhAM42ROoTg=;
        b=P7/H5+wlGI9z5JIhiO4LZI/8QQ5DcStNK4dYXcZKsLw/zKK6ZQootp6hBzNsv+camt
         i5mm1eC9O2gKUjvlW7pbNBKVxxE0Z6n1lbXgSNHpeIoI4j1Xvm8JFWIU5R3S3beBeXkr
         y8/yNoWLXPzMK03mrJi3+HsuVxbC0eZ5xvdCiWs/QqZzcYQKN9DyPNiBQJMSSy6ouwYg
         xalNApgJ4ajZ0C83o3Ef0HX/GR3tXvbDC14p/FUF0VRh5XU6i+9TYSqYWuBEhPzTKuj7
         H76gUFS+6xVWklDATq+wY+JjaXXMD2ujeJFSxy+5X7O8wqyJHWRQwIj4Wl3Wn4vcaj5W
         j/vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787515022; x=1788119822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ii9pPTvyH4snmu+QWWQwVRnHwnpxENjOJQSzf5Bngrs=;
        b=busaXdU12amokEa1z7GPjwEqrrGJg3WCxP2rmsrTsQcvYwLDWvOWXXoLGldLwnXkbu
         tztqr2z06nhpXzhKgYWiGi/hqWJGtLcoRDssp9hnqzpkMht78DrGrPqd2k5IB7BSOVG7
         Xu8J8KlFGg5/Pj0x1Ti7Pd58vhxrqNavEhUhETD1wx2fqqHPOdKOiMvKjUSH3XLthcf6
         xSRIhAa/pr8MZ0LZGSkqiB/z3DGvp8slLEjkEXpxel5a1Qt0nLXDslXdWXF/IF/9rVdM
         stYrg8+4xsmdZwJaAIeHYj5VtHpnTb345bS7XJVKZX2ccN20lM/JVwNhxiSARtuzO47l
         HwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787515022; x=1788119822;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ii9pPTvyH4snmu+QWWQwVRnHwnpxENjOJQSzf5Bngrs=;
        b=gxmgeUeo+zjC6PRqg1L1BZBkKH/KaL8un4MSiIEJk6lTR9c2+NxSApBZDqNO/IYTvV
         9k5JdecWGgpz/JrBwJLPTsEE/iyEu1g0Pr+xFiT9J4W3P0Z1gnN2f2d6sMoOzTZH88RC
         Mwa1lZ3mdedSfTE/vNzXTWdMe8+IoFjA95B2D9nhEtHp28pr9kI4qTdYfm41gPC6bEcx
         BEpgBG9BbXHJSFwrfQjg+6JRhtHko8gMOtivwr5YDs0kh7qmFA4Tte+xemeO8LY6QK3Z
         5vPX4UzJXU3iqKLJu0njxxTU5tCG/IG0UliTkfu3kO8WMvVCmK8ZWDawxg3LJt42eCu0
         W2ZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrO406irLB4gRPSvpRHyOhmBxFQ1mkjufxE/HIxSJmMTEWH8BoOfuaD0wPE0PZdydJw8NXZUPrzc6cV0gE=@vger.kernel.org
X-Gm-Message-State: AFuF++mgDxF541jzxofSxOx4vukN96va5hxWt2vb1alu5HzFauHG4u07
	xKD+sQZu9smKIV3UJ7zcmCMbcZ2JIjc+LCKnkrDLGye1N3CKZ9Adb1zGBnMoEkGEW7mtlDwTo3T
	XgxitRtwtDMLCU3PUXcnj7zIMlXPlg8I=
X-Gm-Gg: AR+sD11vGaAMxTzKd0eOCiiqlCQq8r4ETcHg0jSMS6NNaw40vVQw6ihwQBzIdQIYJ1G
	sXJyk17HprbvZKQT/Ods8MVzivYovGSkKwTrycZiKEAQ1yNqrIwcRuBdZqJf1DDoNSG1tF/cqH5
	QTACSAzBHsqMkv4F/3wKdYs7Le9oV1angZSSVn+gKQd092s7XY9Zh1zhqObR3eWXzP8ddYNGZUr
	bQo2HN3rXkJZqem9aTJh/A2zk9+Ml5vrbLgbs/iUZwsgTcOFmGY0GGoOCh7fRkDY/VC/jq3tMA6
	Sad3TapOL2LnelL+UDX3J2PZeNNQvV2JoZDTdM7NS9UpVYpPps+YVVnWIJlgXhPe/xf53byynRH
	NlDB+/ypyYh9Ir+OsFUDtk+JEinY0RAAiHEX3NqbEr94FqGRX9i3aGQw+UxZIR7PUYgnsotDS
X-Received: by 2002:a17:90b:4a08:b0:38f:57f0:1f51 with SMTP id
 98e67ed59e1d1-395c2f26693mr17048624a91.0.1787515022455; Sun, 23 Aug 2026
 12:57:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823193529.156066-1-ojeda@kernel.org>
In-Reply-To: <20260823193529.156066-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 23 Aug 2026 21:56:49 +0200
X-Gm-Features: AcwNN1V-x1COeybQxjem4PQWjBSL_WsHxSqMe08yuK5ZTBwEtWVtjAsz2JYB8h4
Message-ID: <CANiq72mj854XkMk_urvfcJtuiktMTHMU4kYiE=suF3YKM94_gg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: disambiguate `zerocopy_derive` for `rusttest`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Antoni Boucher <bouanto@zoho.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 9:35=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> +    --extern zerocopy_derive=3D$(objtree)/$(obj)/test/libzerocopy_derive=
.so

This should be:

    ... test/$(libzerocopy_derive_name)

as Sashiko mentions, for the macOS support, of course.

Cheers,
Miguel
