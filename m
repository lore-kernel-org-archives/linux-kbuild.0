Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFDA47D940
	for <linux-kbuild@vger.kernel.org>; Wed,  1 Apr 2026 17:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065188; cv=pass; b=TKnOZFZAb8/DqTwIvp0/2LVhKkzv852pTA8wAvhnxAhPW1irY4Mkug6uX4YowUaRjqPvpGdqQMTppfLfHlG0o2c0ZINeTdeGMHVPsHBK0NO4VwaDWEeb5XvgPIF5g5PIfcEzfWxac99+P3FJngmq2gOacafO2U9b20bPthosAJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065188; c=relaxed/simple;
	bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckSn63ovgKAFIVhTBdBU5dgAdTM6BuppDVlUBoZ4Z13PmiFcW1dsKyq4eNOcg2bgaCb6G7NYVVRilFpmfX2y0vz+8yQYFeU5X4xCs2RX/2AaHxUSWCwIVHhx09P73dxKcjwElq5UDd8IrQBdVwe7TsEAZWKCxPuTDlYVbpNTgjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHWieLuM; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHWieLuM"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bda3b4318dso4973eec.1
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Apr 2026 10:39:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065186; cv=none;
        d=google.com; s=arc-20240605;
        b=UC0Yp2zssIKBZYuEp5dzVpk7EsSzLi3oX3M2uBGXc3olt95KgwKPvX7HamxFUDuEzK
         gLNBTMqo+8m4XW+qRvKGjK9z0vrVEpB/bwhFDK4g1Bxigmk5DkREO9X8hsypXTM3M1IX
         I82Cq9eIOGiOLfnrQ6VlzYmiB3dY1qx/vBBAgCuzWMZRFZjUEYG0Bj5XgeJwdTOMpucC
         Im51TAEpsYPU5RpSig0WhJprlzM+5DbTkPvor/eGwvy2bbaPH4XFr0IUdbQWQVMuuoRp
         GxwwbIdScRnj+vGj38cXv3zn1D50UA2uqNThQ7H1J28fEa49ba0TalBQUQwwdyZf8osz
         0n6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        fh=p+nBdSdKC0KyEQ8HO6IMTWDkiCsJT2GHXFnfzqq36+E=;
        b=a3F6Vn9qMFSZsa0z6we3G8jSCa3o0cU32YM96M4Xa1KpB4q9sk5+BVLFgfrwIe7UyX
         qhfeuJ4ZvKQdFwR4dypQL82AKLMk40yzQrMmW5Zjq3yNy3hegmpORU0+/Y3+cUKroM7k
         xxM2u/wHNbbcQHDB42xC/v5mYITmzoMHtqsU53Z1gXoBJqY7UAx8EGQCvzqbxNIi96mk
         ZYw+WSzrOMYR9aAqXWr0s1tk1PjVkZOjAG6BghWeC1rD3XamKIXnOSXJZhENK+tCduri
         7QueyTe/VVMmGB8+tveJjHWQa2eR6ofdUknt1NI8QZTmY2yl3WPf6ZghSDeMYfYe0gOj
         90rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065186; x=1775669986; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=MHWieLuMH/ByIIbgNAqItzRtGa0YCLeZZ3sJoYjxtAmdptV+B0FY01Sa9Zy4qL76Ic
         j82EBQ+pmxUaafDRoehP99t3m/Zv5K1RwSlO0WGJzoVzMbKQ1K2/hN7LiW+j6xe9e2fI
         Qe48XqY1X/x80hXa7HqlTVfURdWVK8QQ7CZlpCi8Vl30IN5v//X+jIR6tSvxhNC8V1BX
         G779+LCZiJh4X/19XUjup1EKn4XzI8nKUs442PSZUfpxP5Rq272WIYw2YE3QHQjZAKe1
         nzSWR9d5uMuWppW34ZIMY7LLBWaKUO5J1IO7l/SzzvCWh7Ymqn9OQh9dqDzEk8eAiVVS
         jWyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065186; x=1775669986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYUaVSUk5Sb3SOTuQeoUN5R4tL+13WiT/Hvm7LoUgnk=;
        b=UwxqKjaW9X/+YAOrm4fyonL3qWVX01M+o1ddeuHxUVhDmOy2QzbWJ85lBI9x1ALs31
         VmhVAq8e8zfxZ5H07n2dH2S02EXE7VxWekU+FrAUIF81Hp2OwOsYB+k2dG8r75sc7vAj
         ADHdpS1AfIdf3clpO/yTEirV/h3eZZpA6VFqoNeOw6SvUoiOSJgL4myOVQbzuX3gXy3x
         sP+vEb5lEMgoPsaaQWmc/vlxBx7le1LOw3mKMJTDbgWv0So9xPtEz+P1AeuQrvHFansi
         nP3QknZinaKCUSeCYQ2W1FSECiaKr40WqbbvfeOHFCgWZJbuuphG4WSzpAWujJJW6L/t
         qzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQjTah3cr2vgFN+keCptRmjX/Dv4skj2pIf/8MhQ4nRYwkTE62KmIWTcGVpQEDpy2iTkJ88aJ1iuQxweo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsmzFCoyC+h45VFnB8XlstvafJG/2rAWbNl72LIRstJnVO690b
	WaQJJu78CK8Dgdi3ZDo55FgQlvRgUo+nG6Fn+oh0MR3Q2gknR6Ky4XiAOzP+dYPABMvnfNl+NdL
	Se11d3uRBJ8mLBTCWJOjBs+plKdj2ba0=
X-Gm-Gg: ATEYQzzMtQFuwz79Ba9YvWGL0u6GG7i3i8yLkQSZP0QHnoKaNMcm+5h5DOGSrpt4Jp9
	a7lDKUWoLAmyalhE/+2q/gmZ3TecEeZBZCZBWLxIdSlMaG6bTcBZ0Ylb0r+X9+0UkzLvgBMiUtX
	bb+cu4EVH1MVF4nsC74zHQJLv17zmkxqpJNnWOGkNnGSy+R55YUJzy1P34ltAJ3vlglqZ5bbov/
	4hx3U85/eOYanhA+aY73yP1mM2R5lbqobLXd7DIx0VOG1yn6bcW+rTrjLN7/KPx6a5rGrcY+Poh
	6IwiYmQDXSyK92Agukm8MouUQVnE7Jx3fljDR76ZoJfo7UYowLBBDjuT++iEnUCpILa+Il9Tnjp
	U3jwtmV4IGRsoAlKmROx3fBkRpwbTqOwcsw==
X-Received: by 2002:a05:7301:4586:b0:2c7:2cac:8147 with SMTP id
 5a478bee46e88-2c932cb3abamr970192eec.5.1775065186457; Wed, 01 Apr 2026
 10:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-10-ojeda@kernel.org>
 <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
In-Reply-To: <DHHVLQAOMLWB.3FHHSYKNM5TNP@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:39:33 +0200
X-Gm-Features: AQROBzBO7Aafw_pbzha_JEZl4Ht2QE7dpytXYa0WjnL8RQv-FxGnezpSMqEOLn0
Message-ID: <CANiq72kSYFiS6zN+VLs2URhAeHy8_-aEXki1pyR0qoj7jO-qSQ@mail.gmail.com>
Subject: Re: [PATCH 09/33] rust: kbuild: make `--remap-path-prefix` workaround conditional
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

On Wed, Apr 1, 2026 at 4:08=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Okay, I see what the comments mean now. Perhaps squash this to the previo=
us
> commit?

This one was mostly to ensure the workaround was not needed anymore,
i.e. it is more "optional" than the other.

In fact, we may want to just not have neither of the patches, i.e. we
could just remove the workaround given the timelines of the branches
-- please see my reply on the previous one on this.

Cheers,
Miguel
