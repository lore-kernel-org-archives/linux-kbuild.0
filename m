Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793963064;
	b=ci+i5ALPcX+BBAAguJBhdF2rv9zE/MZImQvtrcw9sYl823yNmjImbhTQV1m4b8D5pOBm
	 wElwfn9wZKT0wdaqJCXgygRfgltFpj856CN1T9IhMwgT1Oup5W3XHttzObAKEFU88gqgi
	 h9526JecR/YPmyDy/zcQ+clUTnf+lyqsV5ht2GIAQsgjflVv6MRzqMzcuyIvL8v5trPDr
	 tFHcog3AmTcoP+Dl+BFmKxledLlWhTf+4DhSwgJG+3ccXwW72/2XS5fjwQWniICd0H/th
	 08GOaga03obYegY0pWFlrGh+8iCGptn7U400Erze3ii4ZT8dFcEwKkLmzdR2z6Zg29A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xX6kbsH2ACpFzEA8FaBzvuQCY5451nglFyNk9c6crjY=;
	b=aGUjmKwwwgy+zNSPanyEExvGx6sAGqgqe8e47gs/0nBnIkndAL5rTXwyLuoqHCNdjZfp
	 4h1iOzU0Fz42ZxIostcTlzN6nk4LV1e7g01yfYSV5Pz9TzD+rJnIQzJo8Q9zOetgIN48H
	 fe0MrOyNC9BnqBFsZQS4sgbc1qF0y9uwdDZNk0obBdV88wO+laG0/UzR7xS1gM7VmBUod
	 Ix1DoRUPSXc8LhEljKE3xV2l8gJPP9AJGkK1HfE8lfFqbDsOzTeZvk2LTj2TCxdJ3gT4m
	 M7zGnxiy+y0JQ4J6hAyZ0SdKqCvvILnw05rW1RerymTRf0P9gQHCc9GH7EwpW3V9QuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXX978+8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253B2606A329
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2026 11:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 253B2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jXX978+8
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33c10faf6easo66897eec.0
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2026 03:04:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793963063; cv=none;
        d=google.com; s=arc-20260327;
        b=kcGRnm2W4lmubQwXqKfSctiX9AgCWCBVsiHH0eWF1UOhm55TR1v+a8BHkbx/4YtkUb
         It5YQlxu5nitiaDiu4+m+Olcqn46MF2wgVaYk2BO2pcL0eMAkTwB8X86wqgE58awr+gp
         Y75JIbH46Ofwt1v7h1ynb0VluaeAzZiKSWZgLPbWf4szBW0NTt1gvb7xw0tpcvaGz1BU
         eyb5KlKJxiLGBrmEhRe6LxwI9JyS0h9q3MkHu5ke4PvRLQpB/xPIi8db6bflBqsamy7A
         kiulsmMAzpYdRf6fCaaAil7AfqhAz0Vc4OoMHaQi8FxjC5ZbWr70Ko6I3FSnz/ODJ9uc
         xgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xX6kbsH2ACpFzEA8FaBzvuQCY5451nglFyNk9c6crjY=;
        fh=UWglX1PWoTwOCkxVWVFVbYSd6CHU5eni3DhLQz7l3go=;
        b=jyHx4TxyP/dthzVHUHNU1jg6JUmPHT5los/Vz68h7MkdegugsW5GZKS68kaCUsmD1j
         NHNuVYYObHE8Kp7cgUfAXZoRp19LwxYCO4DQp0jtbzqZxLPIB8VwtoRXPea6bCTmDBsl
         l3hwvHGQJ1aDh8U9eLpmv9QwzeVBeZtcs6JbRpAq/lHQ2J3tNpDPirQL2M0Nc5MRhmOa
         f0rvY/7bQWG9rr2qXb+mO3Dm5bMBUlxg53ETZ6dljecyPVkeOU0xY6PfllNaywo6GEvC
         2Zcs7QRVQKoyn2KGYAra2KL7NArs8Qdroqz5/NB19qeyEfV9Wxhi2mGi+JtCztNDtO1u
         tngA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793963063; x=1794567863; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xX6kbsH2ACpFzEA8FaBzvuQCY5451nglFyNk9c6crjY=;
        b=jXX978+8EoBAMGAwT1dGsoJc/TpeWkrvRfDiemGcXY438LSbQ1w0STurN0gDfgi1Wa
         kPEfJg5bDfLiCK8aGgbQsZIDMIwuqsy+H9zxgLT5Do4RAG9ZUMYhfDbTBlzd7AOnAWjf
         3SIMNBpbDRb6RFIcwXGtzDpXcsZLr+L0xJ2HbkEk6JF1qjsCCsMHodj9nHPes49sigtG
         D19BJAZi2WvcPAtgm978S60X1qFtpM6vBd58r/t0jCcTt+aEPQZf6O5OpGvwWv4I1eyD
         mRdYCsSnbe0MCXdC4xPYNOwo62sG/DUO7FJo4ar3lwlZeLI6gPN0w03IA9XLfxGG2eYZ
         ppzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793963063; x=1794567863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xX6kbsH2ACpFzEA8FaBzvuQCY5451nglFyNk9c6crjY=;
        b=j6IQLJ/O/byiC3bC0ECVpHTMWTNTB7lE49ymVgWiQi5JC9soVdF/RnXoCUm21U7i1c
         ld13ecr5fBMZWUryWhOusSALAKgRLroNwWJSueiwBmqzX9p8SLw3JMm3kAahIXjAiV2f
         u+f9P84DN89flABbwLnr619bdWVdZqLt/ZCgzYh4C9S+moto+q9+3cBCpybkK8KAei6N
         4H4Yab9O55Kwv3PaAIPPOYaW76E6uaCRbr5zjk/W3shxcgHmvMnmy+FwmXqjkne2bktX
         xraCX1OE5KuOrqGmHHz5NrjmO9cmdJG1QKHgRRKdFMZOlp7e/m+oEBRcbY5c52XJVDg2
         XB0A==
X-Forwarded-Encrypted: i=1; AL+hErFqjhplnElA9o9GbzNGYnTzujJm6AOlFv+D0A6F1v6SFi7N+M34igg1lWvY9R+4GIoqp/0xbf3KUrQpc/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aeBusHHSg4dS7cVvhzWZ7MoftAo1kqVMGgFpNbDNBMKo2a1iK
	tHtrWhUAOBtxDgoe7jprY36vnfNKz6YG7MlC1BtQ0md2c6vgg+oWuV9kJ6FW9MjVG8+P088aDru
	znD7Yz3Sx3iEXVWOMpQC4QoSP7uyZIUZz1d1ZP6Y=
X-Gm-Gg: AYBFou2B5OwBSOJnqhV48rkCoYws6Jhs7dv03WQg88+B/VXa5GFtrMv8jDQhwrxpdhA
	Jf5OluKsqJ+np4fTFczpVugAXLOhDCuiD3SWzn90KD+6OyaunVCjAqfeuWOGbZk+NOh8OvCJs+3
	Tra84ZCaBqQedPgZNrAfQW+0251wPnbDUkmAeL+2RHj+pxH6rHhPNyPjlEEPUBr5hbozbCU/ZS4
	9Cr5+xn0FB1ZDJRxEQdWqCCVb9ZaF9rkq4FpXFmumwBQdPyKokWSYPReB1BAqA0OIQqhf3Mu53e
	pGPVAqNRGhPA3uqwqbsymaP1bCGQyLu6zr60hvaQwGWuh1E8pOYgdhD85rABiOxB0pXKwY57W0J
	0oqlJioyZJEG8u6V9xSuw9isb/EeXMaoGbY+Ob2aTR/GgoSaIW/3PV5ifaxbe8+F3lnm3h+plPy
	Bq8drlV6Vi0q3z5nPymTI1wX9jdzQaaY6X1v+N4rWrBtZZak78t4kNq77HX2+9agQnA1zzbpZfl
	wGFhNLQ/uvhj3tSmT45V/QT4WiSm5sALyLQtw==
X-Received: by 2002:a05:7301:da07:b0:36d:cd5d:d809 with SMTP id
 5a478bee46e88-36f75831c52mr3957219eec.1.1793963062999; Fri, 06 Nov 2026
 03:04:22 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106073528.93371-1-ojeda@kernel.org> <20261106104546.2297584-1-aliceryhl@google.com>
In-Reply-To: <20261106104546.2297584-1-aliceryhl@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Nov 2026 12:04:08 +0100
X-Gm-Features: AclHuK8jyqAZ1F8XeuMU6UiUwoMLOdeHY_OERfr8_KSaOVX2nI10vYWcW6OLODI
Message-ID: <CANiq72kSG61mTC3_0pPokoLbbE87oFrKHcNUZhxhbxpg24USYw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: rust: support stabilized flag `-Cprofile-sample-use`
 for Rust >= 1.100
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 11:45=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Could we check for `-Cprofile-sample-use` directly using `rustc-option`
> instead of checking the rustc version (e.g. testing
> `-Cprofile-sample-use=3D/dev/null` or using `$(call rustc-option,...)`)?
> That way toolchains that cherry-pick the stabilization (or older 1.100
> nightlies from before the flag was stabilized) are also handled
> properly.

It is definitely an option, as usual, but this file uses the version
elsewhere, and we have preferred so far the version one where
possible, because it is way simpler and spawns fewer processes
(especially so in newer Make), which Kbuild has usually appreciated.

Regarding old nightlies, those are not supported by upstream nor by
us, and we intentionally never attempted to make flags work for
particular binaries out there. I think the fact that we support even
nightlies from Rust is already quite a success :)

Same for custom `rustc` forks, if you mean "cherry-picking the
stabilization". We can't really test those, and if someone really
needs that properly working and can make a case, then we would need to
take a look at all the version tests we do (and not just for Rust).
Perhaps some folks only customize 1 or 2 flags and thus only care
about those working, but we wouldn't know which ones.

Thanks for the review!

Cheers,
Miguel
