Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988001;
	b=Fqrt2kcIB5DVTslllzMnSzAkgF9IGLWyJ1bPsEuV5IiI/Q1UP2RQCZfA6p3yLhnf2v6N
	 UToEh+rM0bwj+J5/HzSDyXSgiux6X/ZNx3t9HfL3m3JD637MmlbSs7YUOqMuImzbHOq1S
	 Wlg2yq9Xe2NS4xzug+7wHgAJB7gOJGb+Rs+Rx9BzWaThU5a6wJT45vknHjyPkBFkiebkF
	 tL0IpjevU7sstFgmp2ZP0UpeRSJav7K8KRex/iWdiFl6uouYUJRQOHYjmf2kEXzGhxV14
	 NT4JGiCia8HarUTGvQfL0oXqPmpHp9VkglHFo4EB0eelzOuAXlHCdF1lKxopuSlkH8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l+HBRH6Z2Sf6XQfzze6i5pft1TRrO4lvAq6O629kQwQ=;
	b=hw9nBQ39Hw5bTkqREDHYn3aC4HdQnkyUQ57TDP38TXQXkSlDY7QfIc7fMs0eUb+aISWr
	 7UlwAtottPGYQ6pQ0IGR/ZE3ZXqLe07uDajUelEDyr4u2oPZCchxC2+4TAgGSZROKXmIU
	 M3hJ12/8NE0OO0tL06BscilYsDqN8/8oTyeRvHHbSOLQ5SeT1PVzwdheOGcvWFoxeGYkd
	 z8tt+QXpuWyBBxx8OebcoHUvtzGfdQBqA2jF6ptb+LlD8KxxJc7AqyMSPiWDOHFkzH8SR
	 oafLoLiXhatvhTaW5x5kcj2pNQoqAGCi8GwM6oHCiJq0+2cRjDU0PGFiDD8PrVRW+2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eFiIgfbH;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C913F606A326
	for <linux-kbuild@vger.kernel.org>; Fri,  6 Nov 2026 18:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C913F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=eFiIgfbH
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso118090266b.3
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2026 10:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793987999; x=1794592799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l+HBRH6Z2Sf6XQfzze6i5pft1TRrO4lvAq6O629kQwQ=;
        b=eFiIgfbH9jUVptjAdegYDSgo8GWEsnSpOLe0RbAYMnTBvO1t8YGUIsC5+NebmXAdOi
         ft1HeVHmW4jZkRp0rxSqSBpXYnGh4NiT0Ccocwjcb5yK6TrP5lKD3hdZOii4/pB0PGSW
         kSoKhk8aZl56YD3yQhwWHVh2CyfRDNqxs1Z9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987999; x=1794592799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+HBRH6Z2Sf6XQfzze6i5pft1TRrO4lvAq6O629kQwQ=;
        b=pbzcjfUaw2uq/+C6syBM8S/H+yp5g4scwmwbmSnUNjp/PkkoouyYXD45TDYfZCP+5J
         Hy+seB6dSZl3CzsD27bMXx5qFTtwLajk4KiX7JrhVpAZ7PHN/2oIrvEQMxV0d8dz/aBb
         V3DgbZgJsMf8+mPdS+7pX9hq0Yj/ESeuJr2YS0dVpRgVO0pXLI2GMj923JNobTU1QOsO
         2G2hlY/YpsuMIiuocBC5PTw9yN6vY1hgFL/A8asgmOqf/Bq3Kc9hmtJQnTJjK0CEpnU+
         X5Nqm5sXfy4OrsxG2ebrnXhmWaVTluWEGTrU95C62tZgbmQwcncs+KVxDBDUQzZyLjEe
         RPMg==
X-Forwarded-Encrypted: i=1; AKwUvBzlUNk+nFaaQv7cuX/yjdHBlLbjtCa01C7iJ5K6Uy6G3WBPoS4thvtdch2F8G9tny8C2zEveo4josDjCj8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LCB4yoQb3phXJwvIltI5NcwgXEP/mCJZtpMYooqmJH0JOgOUi
	1gCXYoPDOCGsFADyZw2Yn9gOiRDIMScybAmumeMqXvVVON/tm+09KRWKqE6J0l/2KEzhDq+cCNz
	cvwf58dtX
X-Gm-Gg: AYBFou0qpG/sgsx9DA6zXXooazXcPeaE3FhYBQ7zBqMLLxo3AfC/+5ycAzrNupCKhJ2
	Mv5hDdk6MwN1FZRCpMPUcmwshmg64NaOB2mRIubBarAru7gszM748dpmNvOhJUpu3yD3qwrl/ve
	hdJqu8PmEXxN9NB7scsETEdFy/B3C3Z9MtpktA+YalxLtStNiG4UaRDHCji62V6JWG0JnG85U2g
	4bsLFJlUn45ZLuO1pBDkFR0ZT+cAaqFtB9Kr5MyR4PpSnYGQ2YzMjTd8Js02usBcBeafRYl0bhr
	6aAGwjpgmmP6Wy83zO1qoX1cBe4Zk7ydRobXwDG1E5mesjF93ekg4oQW92Pt6CRQ3NcRXhUoYh1
	dBpjaqPmEvLEEUYu2NNJKWDBQROT1Wo9r4XKT/qJ9vBemC6pRqUv46q4bTSQTCXd95LfckF+Uk/
	D5Tsv+1P4VLATwlUVG+SitbzI6Y5DSCpCZ/38IeJ538PDf5a5fldZPimRI2iZbRhzQQgxjwPZTm
	fRCVllunYNnFyTiHlJ3rUqhINzlNa+fPUUkMwDYxj5Vgh6yMqMryUVK7+uEge56k3zj6Sk20wBy
	n/ES38y3bmsrn7xOcd9bYXf0/k+hzf8rcBSnOugBeOjqSU4tAOEYdW5BhBKDjBWp9wU=
X-Received: by 2002:a17:907:c5c3:b0:c46:9ee4:8f0 with SMTP id a640c23a62f3a-c4d34a64b33mr287173466b.10.1793987999241;
        Fri, 06 Nov 2026 09:59:59 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3566ff41sm96196966b.35.2026.11.06.09.59.58
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 09:59:58 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so7734735e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 06 Nov 2026 09:59:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxIfvto0K1apA8MN8Sr1vksoKfxctmPpKzH4xYpp/Ftsz/T+mqCLXb752uaUWDRSpCyqmvSRjdWXJpuOpE=@vger.kernel.org
X-Received: by 2002:a05:600c:8b28:b0:4a1:9663:7633 with SMTP id
 5b1f17b1804b1-4b6dd54b16dmr53499975e9.11.1793987997939; Fri, 06 Nov 2026
 09:59:57 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com> <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
In-Reply-To: <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 09:59:46 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
X-Gm-Features: AclHuK8dSVweZwLxaeldnIMbndWhz_-q2OKzaAPnRAmMzhlMe2QAncAFrE9VlH0
Message-ID: <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Rong Xu <xur@google.com>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Snehasish Kumar <snehasishk@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> Just one thing: I think we should also have this flag for Rust so Rust
> and c are consistent.

Please see the commit message, which says:

> RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
> SampleProfileUseProfi remains false by default in the LLVM backend and
> is only enabled by the Clang driver.

Is that incorrect?

-Doug
