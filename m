Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746240;
	b=zoeUw9vbP+O9LZ+DDJ9h3ZfblRP95q738/xDPQeaPxqk76KbX65yySaIcZzoCkk62Quz
	 uDQv0/Zs6Q6esUtM5qhym6jDUMQy52nkiIyhFyTB4eOUatsXp+2dXMR6MBvGe81rP2tOK
	 o6bS4hZnixU1DI9vusPZ8tCU1t1nS7mDmt7taPT0FxEht0Tp8gSxov7EwFifPxwlWQwqU
	 TrQ/PLYDDURB5CeK0jP9onKEhlqut1F/fbu3G0bYU2gG0lreeySoKJ7D1U7r83Z6wSNLG
	 CLQeTKlF4s6VrKdJ2seMUo8URl264i6Mn1gyvq06pAw71aaSMBgH8IcNWedVCnMxDEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PACmn9X6u41EYHDumO1r3Bflx64JZWil41mGMYpeds0=;
	b=OPzDy62/xtO8VDqWWbGSzjCoyms02Eo0Z6Gg+dEWNMUSXiXOe/k305iWj2l6nNF5J8Fi
	 mmV+31C/8EhSu6JooqhX6grBT2i5EAxpYVGlA2O0wmYmIHbNo8DJScevgnoPbNr3WWYug
	 fVWcIzDg36ydh/CR6L2Yo6F6fYMM/FjGYJmTxkWj5KR1/XdvAZ9KEg0fIYel8fEIb/jsB
	 9MTOVQWG7uSq1TKdzeSdXyD7iGjKnjVldUYlwqORYWFMMwrRwaP4fF+oGwk78ljjQWQpg
	 uB/TroSZeC02voiFTftf5qARUKccjDdaYZ0tZPpiWGsAKkDVfPtcujuGorivDxgBlOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Em8ljrc4;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945F2606A31C
	for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2026 02:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 945F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Em8ljrc4
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b532f8a51eso100569a91.1
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Nov 2026 18:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746240; x=1796351040; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PACmn9X6u41EYHDumO1r3Bflx64JZWil41mGMYpeds0=;
        b=Em8ljrc4zsNuvXqaHZWtrYo8RTgJPZWLcn6tl3boLda0DKunjpAJlNBGTar3/9S6FY
         sue4dETxXaJ/UZtBmqDpZSMaYu3R+f1U7m/iF3UmkGG0nMB5NukKfQdHP6cx9Ai88M7l
         jYL4ZXnSZZzJSk9f71zgHZPkebKBM1jTFtRWZpEGVe2MxBlYOvbNdtk9p5NacW0JrDLk
         xEDTjJyPB2H4vO0DIStfoDpDUy2Zdafi6wG+mHnqc7W/VAPleOdUnkbO3RVVwXx9oQqV
         XdYQbBPbY23Ssr/Ga6hejDXGHRV98GwK879UJX4CB+Jq/CZ8cLu2++X05Bz3T+DVh2fd
         A54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746240; x=1796351040;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PACmn9X6u41EYHDumO1r3Bflx64JZWil41mGMYpeds0=;
        b=bTdHhUs5qpQczwTqwII7kB6EnExpCKqSLRUmk3yS/xqSrzA7gT+0e4OGalEdL3Pm5A
         GlkOBYqlavpuom3JsS/Ty3NLHxKVeeABdQzu2ksRda6qHQOYLbBvWaaLbIVA3R/DI8JQ
         6b3CBxdgt9no/qV/Ph0H/J4MC9/X3vwL8+uti6TI0HEYNn0JkX/atrFDV6LIWYbwgVq8
         aXbJkGm+Wd99HKKIaU+ldGDsYuYRS0zDJ4HXDVdHVYywRsOfWONRaComep3EE65znAy0
         sPNBlsBYpUcPHID/NtgoQObQVNm7hBbRJygdjy2XWu4sTL/Q/qiaea5NMAlSd4wz0YZU
         vuUA==
X-Forwarded-Encrypted: i=1; AL+hErEGnikIZ6SJLwgTtwg0VI+rot537+T0tMZpHYYB8x6Fg2Seh7YnB2ugLdEzR6ulk3JW7JMjapY/zZmfO6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZBBnF3Pt3ObGutZSYxXG7FW/2QPuZToUHG6FwmLNPMtVYfbKR
	u7WwRG2laN2cPDj7KoIDSNYn/U3FMCWlhWVZIZgJ+nmOcHsdmKPCoifw
X-Gm-Gg: AZFdTZcU2RDiPtHs5hQM3+ag6RMOP1HML47YMSBfq7GXxx4LBCsrYzxuzWX1vFJkY4Z
	poHW9e/KhH5iHAYPmspahFQ719oe5yXJ0AGUDPsBLvTLBNPpmWlhfy/Av6/qzvIPkmdA9KsaRAO
	mCWKG5HFTdE1xGX1Ry6Ty9t3F4R81RAMLNqNvts6HIMVsQYH3xsU8jZQlb2PcPyRZjqD4fxAi7L
	5xZNI+6qbHU/KoQ3Wy4ooFvUKcuXobMPp0CgKOZ1O58cC6GK7NZq5sFawNObrpnJwiXIXxBsEd8
	yXXzY1k/i4HhfyDz4/vE3Nk/BCfaWD4Mz1Q/TKIl10Sny1P1DBLbsDEkX36GtJS4QXuE1yQauBy
	pMq6qI+fB1wS2gR9iaKhG/aaV9wq17QkLu8Rh2Bva9xn0llhwj0/qK5z5Qflwr+f11unQyIhSzD
	2YeSCN6idWd0QGVpGGnZNY9L44fPoFaVEGhV4QRhor+IlhKhbmFqxp5AjUXLppPmUICgj/m0Dpk
	W6AAyqE0XE/RbYMbrRA6nOaOqO+dyAUxRYSc1GQQWCB0xD9Zom85gEQyp+7pX7lP01iv7p5/Ovm
	MwRK8EOkmjl1aaF3UKO9dOFBMkpYm+DWiEMCQb11ECUrP/nhm92T8vh3uBCJX3mJFVLWYFVp9+L
	Sw/0SjpU0KY1ieLiF9LibXlxpWbHOk4QA025w24tD2nz1nqKPM4tB
X-Received: by 2002:a17:90b:4c12:b0:3b0:a831:5acc with SMTP id 98e67ed59e1d1-3b41c95408emr21354995a91.42.1795746240009;
        Thu, 26 Nov 2026 18:24:00 -0800 (PST)
Received: from [192.168.29.169] ([49.43.113.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm16720268a91.3.2026.11.26.18.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 18:23:59 -0800 (PST)
Message-ID: <32727766-89ae-4e23-ae39-635f7c0c9a6c@gmail.com>
Date: Fri, 27 Nov 2026 02:23:54 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kconfig: warn about malformed KCONFIG_SEED values
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>, Julian Braha <julianbraha@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118071557.791279-1-singhpriyanshu9838@gmail.com>
 <179564821041.3369856.2083626361406656618.b4-reply@b4>
Content-Language: en-US
From: Priyanshu Singh <singhpriyanshu9838@gmail.com>
In-Reply-To: <179564821041.3369856.2083626361406656618.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nathan,

Thanks for taking a look and for the feedback.

On 11/25/26 23:10, Nathan Chancellor wrote:
> - Most people are just going to be using a previously generated
>   KCONFIG_SEED; can these issues happen with the default logic?

Yes, in two ways when replaying a previously generated seed:

1. On 32-bit hosts, randconfig generates a full unsigned 32-bit seed
   (0x0..0xFFFFFFFF). Half of those default-generated seeds
   (>= 0x80000000) overflow 32-bit signed strtol() and quietly clamp
   to 0x7FFFFFFF on replay instead of reproducing the original config.
2. Even on 64-bit hosts, copy-pasting a printed KCONFIG_SEED from a
   build log or CI report with an accidental trailing space (or typo)
   silently discards the seed and falls back to gettimeofday() with
   status 0 and no warning, while leading whitespace is accepted
   (asymmetric behavior).

I suspect it hasn't shown up in reports because the silent fallback to
0x7FFFFFFF or a clock seed just looks like a normal randconfig run that
failed to reproduce.

That being said, I completely agree v1 was heavier than warranted for
this (especially the test file). Once the 0b check is dropped and the
tests are trimmed per Julian's review, the C change is quite small and
brings KCONFIG_SEED in line with the existing warning for
KCONFIG_PROBABILITY.

Thanks,
Priyanshu
