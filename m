Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792829818;
	b=S6G23Qyo+6jFlHV1ojQR90yH3avJQjJIcSnFnp29ZeH3sViNT0gx5JzTR26eaQ+2ggR9
	 iL1kLQ7REkaDm6hP6Ldj8BhIn7LNU7Og4sgANlBTzOW7yDuRzug63vRHWy66B6Ej/bdwm
	 hdjQEu9uI3psBQ5q56Su5pKqRGMAsYmc9o6d18MXa5sjfpd27siSSwFJ9xAmTnZbUzvKj
	 C0oZ4H6+zaZepzolY5NUoiNaAhmtOYugv7kYz0fLdMPnUkbZpgH3Fpc6zUT5fAMMOmv89
	 Kp2vpfYSAPDFmbdzHotsm5HenOOVlYYkmP3gZZQZJ1FRdbxukc34WyVynY8pGcMZjRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792829818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:In-Reply-To:References:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
	b=jZBtMIMfkAYouOjoppn6dbZyS+nb86xhVedYGbGKeTJZtM2tX51kSjjwt4LomIwhcXKJ
	 LKtwSfsKHOFaT9FcTD2z3ZrQce/Gn53MaNSNtafOXs7vBDq67amsLE83pJoltVpoOdYIx
	 Ugmvk0RuYaGCwgM42GuuiU0pQC/LRR/0r9tS6yBdlMknH4P4qNflfa27Sp6sBwtHRu4oR
	 Gqo03myGCH/C7PruaMhmpLyIT7aDu/Nis1Ta9ODvKHOwfB0eeGAIMHnN0o8AGvii4BNny
	 9dSUk4glVv2ZUKvoUbEIx53JpBU4EW3vNfYQpZk41lO8XbUDoc18TlKDawF/Xpi2adg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7SknmwT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C54F606A31B
	for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 08:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C54F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=J7SknmwT
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so226355066b.3
        for <linux-kbuild@vger.kernel.org>; Sat, 24 Oct 2026 01:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792829816; cv=none;
        d=google.com; s=arc-20260327;
        b=RHQ957Bl96uT4viqkS28gb8PUmRR/SbnJWYSbIDanK4eYvtYM23NHzhfHxwJgx1CXe
         tP5/tl0dvlzpydvXaNASG++dg7TFMBCw6N3E2W+jOZQE02YcJ9/ucQ5OozenNK8ZiId9
         h5YjyKq/19cMiTo2hbTUSb3yuICQrDeZUhetHHh1UJW4suATKlCAQRtZcJCGoTOzXfkD
         2NAimAY5rjC64wbNaCElaswr5kFarhgCHm0Qloi9I6qGGMtTNEI5duZfxEeD44UhhCZP
         X6Qrg8GpR8ijsvWYdyrSBMT/R3YMt7+x4miOuB8KyxYs9X5umsQY8SqKm07WGbpvapXO
         nDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        fh=PH/+GNlCYjKVvBkQGWH7RQf2AyIfNvaktfZObezP97Q=;
        b=j8ksh2xV/YqzhNSX+IG7m3GeC5rcdWVgHx2QL91scoadsoZIwY98OTeDMQnjaCXt9l
         Xv9WDhUZKLK+dXzjATbdB0yoEy+EqqHDpgNqfQd/03VVGrFSIr6v8TGefjmYstZbvCGz
         65kDh0p31SI7Zmer7jJfZR7SrWG1El15v7aKWQWPxHSwg9rGZMq20xp7m3cRA4KoUPaQ
         85iw/9cHJc5XE/QlClxSDw7dX6g017V5YTolDfbHCzrbaByPYTy6kKZl7BghttPU9iLt
         X7x96MmJJU7qNOrLsBHDQe5Kmg4fR3bqt3sX7XBjRO+51juAambEQDGNBmE9zcgR4CHV
         zf3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792829816; x=1793434616; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=J7SknmwTTzL7ECy7vAoxuDafrONez3XeCWql0X/0YXhgvAQE2BfBECDlTFWueGZ8Jh
         klrfah4NQphtxV5+spcx32j1zY8Lj6vh+cJFzrPDn1Ptw8VqQ53UpyioqrJd6EaGMvWO
         eSd9MJuHBLn7s+f0x+KjG9NHtf+4lfLEvhiOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792829816; x=1793434616;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lPv80ccJgYYw4AUwmqTrRtQb9q7abpSwK/Y4bqqZPDM=;
        b=oVp1qBxqSAP2Xg8EJ3pFmZO+MbuhaTvo7JGcy8onuECFoHL40PqdAoFoH7BZpNA673
         tOH8jzdU7UpL1ga80TozbuliGRIHIv7ngeOobXBiFeXgMVBItvqLbpXEGgFbOBEeU2TW
         BpoVu0TBf2BznWQOtWWZP2nnCPTuP/HlfH/oL0wgHe5qYTby5sKShhzQURgo6cffwBvd
         q55xRloKl2RvUgaO3+n8kUe0ryiLKXiUVxUC0b8u/NpVL8bCzczuJPYjCw98PTo3nfd7
         D+A7+mh/8N5o8rfsEjbIXocxVkcY5N9XAc5JYZteyzY/B18P0z2nEQceHzTGd7l6bKX1
         89OA==
X-Forwarded-Encrypted: i=1; AKwUvBzYXbWbEiyDzVCd5Pjhe8G71RXhKmetQtXQGXwpFtciCBax08caR7RjwHKxjYF32cMU224Blkf6hv5pimI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLDtRRHREH9SUZtT3/3ohn48HanD9wloCE1/UbJmKe77qH43dZ5
	yGvg6c1c5w5DrL7RzT9Xz3lhmvNhbDtEe/P4IEMui01O8QN3ehfwj21QLrXJU3Ee1hW8p3VBRNK
	z0IUHxJl3LyRGToLFf6cWk61CqVJrgbHQYcKQek3z
X-Gm-Gg: AYBFou0o5Pkj1DXc0qCKUFalzqCIPtxa9zXsfMXBM8+GaMdLKmHCJ3B0HetnCl9aPwT
	UBf3bYhDlYyKcIotvD2TkxLCAMRDLXvTUlqSgkVmGBI98fo7yW7t/Kt8qKTK42JYI65tMcwqxaI
	3FdX/xsa6XcvhgfXtj6hVd9TwDEcBtXCqv8nrZL8hC5EA6jHcgq5Dxa9XbY0ZTVyIWfUE3N7c5M
	il9ZkFCQ2kEMAY/pz7zvhLcaadOHd1jLdacJWLoY3oPxczZ+4AWHxJ+sqpvU/ZmD+2Au4g45DBz
	uHdSZi2oCJtVfwezYzCHm+NvWrYBxfzFYPxqlywQ1Y3Uf7Qc3xLIMr1PKUWtX+ZO7rSGqc/5Ash
	xjxhu0QR8LJ7jiYZx0GIC8r0XyomW/eO0eR0=
X-Received: by 2002:a17:906:9f84:b0:c44:494:692b with SMTP id
 a640c23a62f3a-c46bde198e0mr151110066b.22.1792829815874; Sat, 24 Oct 2026
 01:16:55 -0700 (PDT)
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:54 -0700
Received: from 415065739583 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 24 Oct 2026 01:16:49 -0700
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261020153652.2907186-1-dianders@chromium.org>
References: <20261020153652.2907186-1-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 24 Oct 2026 01:16:54 -0700
X-Gm-Features: AclHuK_VJyuusU7nyQWEvJVdBRj5rBge31M7RaY0GTXZjSe04p7xrEJjqvNNRK4
Message-ID: <CAFLszTgzpQ-donjjtcPwy5T3pfWg_u83QMh0GcdpY2JCq_s75w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/7] arm64: Add fit images for sc7180-trogdor and google,lga
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-kbuild@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Simon Glass <sjg@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-msm@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Devicetree@vger.kernel.org, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Will Deacon <will@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Alice Ryhl <aliceryhl@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Bjorn Andersson <andersson@kernel.org>, Breno Leitao <leitao@debian.org>, 
	David Sterba <dsterba@suse.com>, Gary Guo <gary@garyguo.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Luis Augenstein <luis.augenstein@tngtech.com>, 
	Marco Elver <elver@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	cros-qcom-dts-watchers@chromium.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Doug!

On 2026-10-20T15:35:18, Douglas Anderson <dianders@chromium.org> wrote:

> 1. It uses a checked-in .its script to associate metadata with each
>    board's devicetree. Other tools can parse this metadata in order to
>    craft a package that the Pixel bootloader can understand.

One thing I'd like to check before this goes further. In lga.its the
metadata is a string packed into the configuration description
(board_id=...,board_rev=...,soc_id=...,soc_rev=...). The FIT spec
treats 'description' as human-readable text, so this turns a
free-form, undocumented string into an ABI that bootloaders and
packaging tools must parse. I'd much prefer proper properties in the
configuration node, defined in the FIT spec [1], so that every tool
can rely on the same names and types. I'm happy to help get that into
the spec. What do you think?

> How does this series help us?

The FIT_ITS path is a second way to build image.fit alongside
make_fit.py, and much of it repeats what make_fit.py already does: it
puts the root compatible from each DTB into the configuration and
compresses the DTBs. The series adds fdtget/fdtput, sed parsing of
/incbin/ paths and a shell loop in Makefile.lib to do the same for a
hand-written .its file, and the .its files repeat the DTB lists from
the Makefiles. Have you thought about extending make_fit.py to take
the per-board metadata (e.g. from a small file next to the DTs, or via
FIT_EXTRA_ARGS) and to run fdtfactor itself? That would avoid the
in-tree fdtget/fdtput, the mkimage dependency and most of the Makefile
logic, and trogdor would come almost for free.

The new FIT_ITS, FIT_FACTOR_DTBS and FDTFACTOR_ARGS variables aren't
documented anywhere, including the image.fit entry in the arm64 'make
help' output. Please can you add something, perhaps alongside wherever
FIT_DECOMPOSE_DTBS ends up being described.

[1] https://github.com/open-source-firmware/flat-image-tree

Regards,
Simon
