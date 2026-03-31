Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FCF44102C
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 21:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774994024; cv=pass; b=RpxvOcGc2iCVPFvraEwokdeS3NWWKzylCdRSDsJIZvHre+5EICmTXvX8FlE0rRLNI2YIrCWkhnrsaioCAN+iPfkUHZbxRL+g/iS3dyYHg47g3GdfkE7Qbh6Rvm6E77Gnp0C6CX6cHFxVZdonoDhiXMKRLiiNHcnnQHSrMdtWdXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774994024; c=relaxed/simple;
	bh=b/ArxbDOSErJ7EhodougJMCKbAuLfhBhgl8KvGgp1Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1HK1ocw8YprzrAS/YWLtfrbJlyebYSxgAQgM5L0sQ0e8d3+cLlzrzebQColfNrfLH5E/NIoZLjc2KgJ3GY9KPtBg3iIyPGsk7lTJXJeeQquaqBqDkUaBRB6u2dPiNmIfVQxNPwsAo4NoQK/xDNQ/poqjjHF7uSnhV4dTskSg9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hI+ZU316; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hI+ZU316"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12a6b260693so683033c88.2
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 14:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774994023; cv=none;
        d=google.com; s=arc-20240605;
        b=ay3kvY5ktgRG5RndFchcXyk/tptt51/P+PcK7sgDOepX37OgbN4V0SZt157STtBtk5
         r9vUsplE31J0K/mNFIWozQGltYXLsHtCegnZqsHOmAc10ei2g+PRTNJ9hC3RdNtG2ysx
         EYBeosPbbqLriQcEeaF9CmmyNP119xciwmksCNLoVlEty9tTVnf/pEwQKYxvbBl4vJK+
         NbTGMlz+tBe86h94yntwHXXUK5/xIOC7j2PqqCLD+lUwoWxaGjwKPjB98+VcxuPOKL4Z
         w47vIjwzq2FsZ5h+rMXe5cV9aJ8f05+Wg0kkqzn4qOH0lT7bfH+itSUiT6AGa392F+aC
         Zw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b/ArxbDOSErJ7EhodougJMCKbAuLfhBhgl8KvGgp1Vg=;
        fh=e09ccCBaComt7cPHnpeVQCcbG/v4Pag8T0RG5hcj9RU=;
        b=RAe1q2h+z9RVeFF0xludLiTDpRjJ2GnkuMoUyYLAgfukcUlglN1rgffkpEBzUihMLd
         9Pta79WZ9/dpoc9FevF8c5w88GGFtYqLRqnKj7kzFR9byO4ePPA9IFY9yhH28y1OucrN
         tKomd30/oaLPqSbwFnCW1jnZQGPFLi7Zic2aqNEoaMSmwEsP2UlMcu3h1Mwgt+XNxJNI
         4v63MO/l/P9DSsh5Xx3ekYHlx5NXSpajXRGA0iNAc8vuc/NTINR07wzTGOKSgeQnuSX1
         cYa2Ap+qeNdOkgvJHgT7Cjaqup8gBXZvMrjIzwUHMy22x0BajbOMe3uO1xVBcxE+eaF+
         biLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774994023; x=1775598823; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/ArxbDOSErJ7EhodougJMCKbAuLfhBhgl8KvGgp1Vg=;
        b=hI+ZU316rzrg7e7Aifygasa404WPmfjmKJN0XKVyVRATCGwnsGXkM/URl7vqLwObXD
         q2x8nMzVT9xaJYJRr3NucWs0ZjcXhIx3d+UMKamrzxfc990kUClNRKDaObTG3NX0rb6b
         RFfMu9Y21lR9nTm0WZkhAIPY8bGqf9neHxUe+tepxvVzWHhYYz5HBoJmT5VWOzOFB9PU
         1SScrw32lJwxRYfmn+6bvZQ3uTGC37p2tgNQSdyhJ3V6hyT8W5P78mZl3gOFx3S0AxOk
         00dcimD5ozJd2QpbZzCPcW9wWLuaripl+vhtzovrK860zA4z0EIcogXjJRhHuZMlvg/B
         hfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774994023; x=1775598823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b/ArxbDOSErJ7EhodougJMCKbAuLfhBhgl8KvGgp1Vg=;
        b=iagHps5xgZeOgVwuFLrNcOHlnydpWE4ckqjfpPTnCJ2B+L9My+Z7oV3M+YSpcaJ/uP
         K0XkDN1+OYIdPlsgkot02oKQIAAC6dmP1GCYxg7HYQZWq0qysgIg22mXKUburrm8QosM
         XbmgcHN58kAnoR8JwavhRjfn0lH4+dU0Jrxsypq9/SX93jqLCFy5E8tNDmSVGVnYzLj6
         U+0asNBeSQtqcFdHOmI32yd0oApWMJE5vJ+7JDPQt/q8d+E8oe+Tom+xq+gF2w1fdTAK
         ZoRxqrub4H+yldI3TH4QbwXI++PxOLBwEdUag+wSsO0K1FlJajahdhmknMVG4Ji2CehM
         Th/g==
X-Forwarded-Encrypted: i=1; AJvYcCUWVRtRQeC07huqfIzRGVs0KHYucYKNIymc81ArHuOYvTfr2Md3hFWdv/bxcnuC9IT1K9LTAJGdSJD/P1k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6uM5kiFP2dOil8dSSCwx8w8e6hg8M7AxGQSEUvAh+lBBNxFoN
	ull97Jo4OFU2HODkxGTkTtLXAJ2xYTi4AAdCjhvZzH5SDrQVSh8J+NjIbq4BeGIUzOhlfkQ5ogB
	HVgl3hM/VnEzPJTB7tUVBWUI2tFZDHlY=
X-Gm-Gg: ATEYQzwrb8YnZBj0kBt7ELf22rM0zpEL4+nNZFTaPLDl+/5SVEwDXvfrVEcAjRESsIM
	s1Gf/t7ImwdQTY/Vhl7SiEDCYwCkllq6fCM9I+lAS34F4xYRfYfceWxL5E8P8fG848BERaagzVR
	MDhAxt5ny1catQKexFh9z+0Ca4TfJTh4RGA61VRhRQdJ2RZwBBviOBX2MomO5lKDmmUmbfcM34u
	3+1oqbmEzNKbgn3mlwfk4nALn4Xglp/C2ulKKYUAwwnCsmmI7siwn76c3UMa07tNycoEEoIJSjH
	UH5K2/cv49kNLGKtU8G0CMh1ASr07GTcfnduSHuHcadl0CvKOMngJg8A10fYAJACy2WJ6pFaGL7
	aqTrGd6BwXJNMfyUUzW/32EKPR39pE5/YIA==
X-Received: by 2002:a05:7300:1491:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2c932cbf06emr281953eec.5.1774994022517; Tue, 31 Mar 2026
 14:53:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org> <DHH9VRFULJST.383BKVSWUTZ3E@garyguo.net>
 <CANiq72=wsdJf1_qwAADhmKA2i7y9U+3WOm+9utE2rv52_eqnpQ@mail.gmail.com> <DHHANEJI7LQ0.3PGBQH34QK0DJ@garyguo.net>
In-Reply-To: <DHHANEJI7LQ0.3PGBQH34QK0DJ@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 23:53:28 +0200
X-Gm-Features: AQROBzC47UfLtt9SgfAHiHNm4GsMBgtssH0puTNrVE3JRvF8RcuXvNsGPOJ1MSY
Message-ID: <CANiq72=8d03wo3_28Q91DpHs=LF8D5N3pmuZtAsr8gLuco5hKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 11:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I mean the lint is kinda useful, and I don't want to disable it just beca=
use
> it doesn't exist in older versions of rustc.

Yeah, personally I like the inlined way, i.e. I use it myself, so I
don't mind enabling it everywhere if people is happy that it only
applies to some cases.

Another consideration is that the issue linked mentions that they
don't want to mix inline and not (for field access cases), so that
could be annoying for some, which is why they moved it back.

Either way sounds fine for me.

Anyway, if we enable it, I should apply the other suggestion too, put
the Cc: stable@ on them, and switch to `-W` here and remove the Cc:
stable@.

Thanks for taking a look!

Cheers,
Miguel
