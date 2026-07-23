Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E5841D211;
	Thu, 23 Jul 2026 13:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814138; cv=none; b=ftza2yYWMjkby6OpzeBS02lp+82LZU6uXUl8DG24uD18PottBwjPV527kkw03+/7Ig1qa73cCdP9YXFSI77NB2um3epOcDhcFPDVmxKd8M+maRhVVJ/nuDoTd08X/sl6Fs2w6dWmZdTNua1VA/ca7Rym8jXeXSalCYRT2uzHFyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814138; c=relaxed/simple;
	bh=b43eFT3eXGGYBZH2Q0w6gJajGP34ubdmCTmbzZNbwu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pJI+mjW4rZmoRSdUc5nP5vKbEHRMbo04G1llHdL9gmt96EHEIXXrv0Lx1arnWoZf0Bc5+Ei+rbOct+2GXeSxRbcwI90sbPFu0v2BvypbUV6+VnKImE6p9NZ6WCah0ii2C9Ao4pknYo2JaK856Lw6QTqZYE2y/u6b0ndB3Nk6SaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=sHt2JkOx; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="sHt2JkOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1784814133; x=1785073333;
	bh=toBepMcayUwqfYeZWVN/Kud+9kAXzX+YXz5CcQKLlV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=sHt2JkOxfIRCC+kkU0o3dErxeHbWjYhvA8QddIVzxYmzWfJnJMOeM8VrojFNta6TY
	 z4TdrtW/SeRsSGxJkZINVCs4IwoFOFb6nTo+X51vf24hkR++bG5Wff71z7xQ7qTqov
	 fpV9nHEIG5ch5ecJ2FB5SdiOecvLvWtuovrtN2MvLenG8WCQYJoCXANEzZD5u3iCOq
	 ZHK1kdeTGFDdn66QQKpjvU0oi5gmUHN40sNnCYloZEw4QFMaC84KmbXLEmf2Kn3dDE
	 g07AZPuRPlubbwCo8rTluKIY9pn9YVIccRi/hsj/uOjQxGWNhRmYDT++YkQLj7Cc6Z
	 5CtORbagtQFWQ==
X-Pm-Submission-Id: 4h5XNf2D6yz1DDp7
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH] rust: rust_is_available: support testing with `bash` as `/bin/sh`
Date: Thu, 23 Jul 2026 16:42:05 +0300
Message-ID: <20260723134208.55300-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260719130723.162899-1-ojeda@kernel.org>
References: <20260719130723.162899-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 19 Jul 2026 15:07:23 +0200=0D
Miguel Ojeda <ojeda@kernel.org> wrote:=0D
=0D
> `command -v` behaves differently on `dash` vs. `bash` when faced with=0D
> a file without the execute bit.=0D
> =0D
> Thus, for the non-executable `rustc` and `bindgen` tests, support both=0D
> possible outputs that the script currently gives.=0D
> =0D
> This makes the test script clean on distributions like Fedora.=0D
> =0D
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>=0D
> ---=0D
> Independently, we could add a custom check for the non-exec case in the=0D
> actual shell script, but back then it was decided with Kbuild to avoid=0D
> overcomplicating it for rare cases (which anyway give an error).=0D
> =0D
>  scripts/rust_is_available_test.py | 14 ++++++++++++--=0D
>  1 file changed, 12 insertions(+), 2 deletions(-)=0D
> =0D
> diff --git a/scripts/rust_is_available_test.py b/scripts/rust_is_availabl=
e_test.py=0D
> index d6d54b7ea42a..752c59d5f55f 100755=0D
> --- a/scripts/rust_is_available_test.py=0D
> +++ b/scripts/rust_is_available_test.py=0D
> @@ -177,7 +177,12 @@ else:=0D
> =0D
>      def test_rustc_nonexecutable(self):=0D
>          result =3D self.run_script(self.Expected.FAILURE, { "RUSTC": sel=
f.nonexecutable })=0D
> -        self.assertIn(f"Running '{self.nonexecutable}' to check the Rust=
 compiler version failed with", result.stderr)=0D
> +        self.assertTrue(=0D
> +            # `dash`.=0D
> +            f"Running '{self.nonexecutable}' to check the Rust compiler =
version failed with" in result.stderr or=0D
> +            # `bash`.=0D
> +            f"Rust compiler '{self.nonexecutable}' could not be found." =
in result.stderr=0D
> +        )=0D
> =0D
>      def test_rustc_unexpected_binary(self):=0D
>          result =3D self.run_script(self.Expected.FAILURE, { "RUSTC": sel=
f.unexpected_binary })=0D
> @@ -205,7 +210,12 @@ else:=0D
> =0D
>      def test_bindgen_nonexecutable(self):=0D
>          result =3D self.run_script(self.Expected.FAILURE, { "BINDGEN": s=
elf.nonexecutable })=0D
> -        self.assertIn(f"Running '{self.nonexecutable}' to check the Rust=
 bindings generator version failed with", result.stderr)=0D
> +        self.assertTrue(=0D
> +            # `dash`.=0D
> +            f"Running '{self.nonexecutable}' to check the Rust bindings =
generator version failed with" in result.stderr or=0D
> +            # `bash`.=0D
> +            f"Rust bindings generator '{self.nonexecutable}' could not b=
e found." in result.stderr=0D
> +        )=0D
> =0D
>      def test_bindgen_unexpected_binary(self):=0D
>          result =3D self.run_script(self.Expected.FAILURE, { "BINDGEN": s=
elf.unexpected_binary })=0D
> =0D
> base-commit: 880c43b185ca52239e75bc546cc4f4d9154d0fed=0D
> --=0D
> 2.55.0=0D
=0D
Nit: You can add some useful failure message, something like "$binary could=
 not=0D
found in the system". The default failure message for assertTrue is somethi=
ng=0D
like "False is not True", which is not helpful. But the failed lines will a=
lso=0D
be printed so it's not entirely unclear as well.=0D
=0D
With/without that:=0D
=0D
Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
