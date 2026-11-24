Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513583;
	b=tlJC4skuh8PwyCHYxbYbMjntzPsJ2RZs/UHcETpHFjAu0veRlDdPXQt/tlTct0yt4Soz
	 p4zrt7iAz/esBG0uou04bK8y6TXN6U/RpXYLubyZgVs45oGD2k/niId8fG2ae5tio1STw
	 cVHecWSPjecdaxFa+x02brrDjOvUo4Ocg+2v3Br941/SSrPHRLML4SFzbd3t1MgCtGOjY
	 YnmRwiseJ8Yz22v7c1vfFpEMqW+bj/Tmzc8oUTyy5C+y23NzelKFMhKsDyqMGEdiArnwC
	 5BkeZfM7jjpd9gi0BlOJ/R/oAF0sz/e3YaXIworE+K2Tiz5xA8Wi+Ea7/WpQUpXMPCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513583;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=mgvCyIDH2ZO9+zG23U8X3//E3hkWpB8K4IySBQbaBqA=;
	b=r5TiHMhS8yeI4ETwaC2cZH4MsqZUM0CiQVY1vvfzLqNExTCzjARSym1JWRgxUe8I/lxB
	 G8FVEc3FrvpsmwQdwBQPI8FzTnC6/c98edTmvdm/ei7WHcVXEAIG9maUD6V58z7S4L2J4
	 07w6JeHRghED1vPzO6gmebw1dgyt/9ant2Xb/+uB/lvQp+nSvDjk27B4uNtV9iNgpB2fv
	 WcSyND5FotLhwqUw536plAsTetxm6HWuSK7G5L9ZCvhgxptxvigreeL7VvdSKOTT9WPjy
	 DLyRLiNrpo2Org8J7O2OLdX44gV2fn+VETHXABYbPkYOLDJVJAXLCQ5Sb0FX0SrA7Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="BBegzI/I";
	arc=none smtp.remote-ip=209.85.221.70
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3FB607149A
	for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2026 09:46:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D3FB607149A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BBegzI/I
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48e1d839ddaso2344202f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Nov 2026 01:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795513580; x=1796118380; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgvCyIDH2ZO9+zG23U8X3//E3hkWpB8K4IySBQbaBqA=;
        b=BBegzI/IRnEu1g3h7lrmzdjgMRICinEVpzFRkYZuurzisJf2Q6LEpSSXbWpykbdSmB
         lyoGQVx/m1ZyvCL6c06YRKZ6yE7RG58tRqwOYxqIJhA1en4ZV1klLa7ByFdGSxnb2/Aa
         dQpOomFzSc10bKxZLqgtCbR9Drvz0LPXGjTdXm3caQc9WKqS3Sh0ou3OcVG5U9n+ibDX
         HZd5IjnPr7EWQ+ToX5l1OOYi9+18GEtxtNRKmqCp0rupq3wzB1tWzIoz6Krdkb4ULBfM
         cEg3lgIH3Ds/9sIDhuJ5h9S6yrCzuh8QtGVnuZqrAYvHzN53nrWj+lZNGuB3YfKpbpQb
         Ax1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513580; x=1796118380;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mgvCyIDH2ZO9+zG23U8X3//E3hkWpB8K4IySBQbaBqA=;
        b=PS6l0/KV2GlZwAfHrTpMgHyOHAMbHB9YhANux2osdNKovoiCFvKDrrbshK5gxtk6JG
         EuZAmHQMYwFF4LaHTDlvAVVtky0e4OeizgbaZ13c93KALv6g0L2szPtsOhmDFPlflweO
         2cZaOmaYlnnLlN7SvYvoVzr+2QZ6lAZB0kBkzwnu1xGv/EIw39DuMxuSVEtJGptPP9nJ
         JoyMfSfQhzCFPDVaI3/dnD4HCXv4wyLlTXGBWy38JRpF/ZNZxCG1oORVBO5+uY69d2B6
         g05h9Ra7BxvTmnDDiqEhwL6V3Czo0zJwAgs/o9y2hPRsaZiCG4kcCUFl4KJZPzXNpAti
         Etgw==
X-Forwarded-Encrypted: i=1; AL+hErHP0qyXY0g0iNrvCSeTiz+XBrCUD1MPJ/uu1XM5HSszlxn6RkWLmDY9BZRNGpmAZm9xPXvAwpHn1Vaspqs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7E6RmWyl/tVwvcA62FPLuO0C9rvZBeQGGwTX38Pwl31oNfcKQ
	CrsAzwd+RScC6wFUPCq7ofvIm+HGfoj85LoiVuthGA51pcpqmqyRhLkmGf4XHBT6o8znIq7IIYf
	AyLYegcoUX6gWIVLrnQ==
X-Received: from wrme18.prod.google.com ([2002:adf:e392:0:b0:4a2:e780:c3aa])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:298e:20b0:488:7496:15b5 with SMTP id ffacd0b85a97d-4abb4c7ab74mr19174607f8f.47.1795513579682;
 Tue, 24 Nov 2026 01:46:19 -0800 (PST)
Date: Tue, 24 Nov 2026 09:46:17 +0000
In-Reply-To: <20261124074138.450793-2-ardb+git@google.com>
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261124074138.450793-2-ardb+git@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124094618.1683579-1-aliceryhl@google.com>
Subject: Re: [PATCH] kbuild: rust: Pass $(modkern_cflags) when compiling
 inline-helper bitcode
From: Alice Ryhl <aliceryhl@google.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun.feng@gmail.com>, 
	Matthew Maurer <mmaurer@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 24, 2026 at 08:41:39AM +0100, Ard Biesheuvel wrote:
> Pass $(modkern_cflags) alongside $(KBUILD_CFLAGS) when compiling the
> merged bitcode in both cmd_rustc_library and cmd_rustc_o_rs.
> 
> Fixes: 3a2486cc1da5 ("kbuild: rust: provide an option to inline C helpers into Rust")
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Thanks. I didn't run into this because it seems like on arm64 and x86_64 we
don't use any options where this matters, but it would affect us if we had
riscv builds.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Tested-by: Alice Ryhl <aliceryhl@google.com>

Alice
