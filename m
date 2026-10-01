Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF9A4A64C8
	for <linux-kbuild@vger.kernel.org>; Thu,  1 Oct 2026 08:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842922; cv=none; b=VSUIZZuT8hI2Fn/1m0s3xeSoPZrHdOFDSfoT99FEtfKwDBJGRjC91QzjU3zmydNxFm/bZ/gRovlcGRqLcTJQniNVIDWjRlIAww0T9/XGY/2apmcAzRa8i9dvLKiry+2veNZ09Fft/sbrfydgHdiBv+x5Zuxs0fKYZ0aDWNt5+5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842922; c=relaxed/simple;
	bh=SFWYPhaEGj3UnxBHEe2gf32Y8aVtv6hsGGY2LkfRXaM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S/6E6+BjjY5YF5OPIDTL0TFLxCd8wbekqdr1PPWHvOBHipHyI44REsKOnRiRSINNbYVAlaer7qvQnnQcXiU06ma8O4Zmvt7NRqzu0uWHydK/5RyRylPmbb74WVXYqtNpV0rYusOvlU/0m3c2aCEZdCjU15+XsK4/aBQSPpD0rEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQw6RjaV; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQw6RjaV"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so50105555e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Oct 2026 01:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790842911; x=1791447711; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YVIqIlAeBaodz/jKHUPLRi2NF2+TX33O2kKv6cYqX/g=;
        b=DQw6RjaVQHBZD01xAfg/34C4S9kUsnymCITopTWkK9FRLcMGXcipdx63ivh514e586
         eNWWjdYaP2szyyTiOMqYPDSXoPMBGByEKLhflxEyPrips8OdDqjubb5pjv8UCuRHY75N
         nwo8TCbXUQTYuzCAqnjs9dTR02O4jxlKoxlEw5BA6iKH8w6nhl3hkzsHJyJLVtcU7fNw
         aqFgzqx5/cS+IYMbYENy0/fUVb1m1p68cY07E98HnL6YdPHr4AE4dJSvjabpVQ5qNLJ2
         0ThM9fzOzPhwsDeqVV9txmNF7teeK6nfpBdt6pZS3cO8KCg/+NZbfxWpgq59j1EYZKM3
         +0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842911; x=1791447711;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YVIqIlAeBaodz/jKHUPLRi2NF2+TX33O2kKv6cYqX/g=;
        b=LEcreUDUMhzZSZGmDrTVWBV57nDz1Sr7OlBOGqGSqIDgXO8D7mdnY3kBekarr7LxOb
         KjcnFBGw3obgCt6aRAA6/FZwGjSzBiOBoGZDBueGhoBEQQGSNxal1xEStnWzoFNpPhc6
         oZazdUPRZDKjjs42AOUX1ufSGUZyJ25wsg8mH+qwBby3soMk6ly7/r2qf+MceJse8hzn
         Q7of5Y79CMIC8X+jZLgKOknAJ6C8qTqVA4M6o10puMIhrnfVze+8jNAlME5GRJHWFD5e
         Af5R/YqXV77m6Nf8Ck2jnonInDJbR+tostma89Zq1AtcIJfT24RN0FrYMJPSby57KllZ
         8jLQ==
X-Forwarded-Encrypted: i=1; AKwUvBytDGLKJXIN8LttNy7F3JuDhGFy8IDwDkPcbikaLaTsI/guECh58UA3Rc/4FLv2owybncuNLfB6rOv46sg=@vger.kernel.org
X-Gm-Message-State: AFuF++ngBfpuihFlZkTkE+oWgYHMglFWufn7WyLF5G7vBXCKmWqBhYOm
	eimM4fQ/h8xUFB8qIjwPSq/zmO9fAf9JmPIROC2f7j0EgDxtzyIZBXud
X-Gm-Gg: AYBFou33p5ZVBonzWN50QZtPnt9Q1iYSCo+uFSyWr4+ccSe3xfqj+RSRAHgTURpHB5o
	V3AMYxv5V5+W5V5AS18frozB4vmKE01u3143L9rkgkfVU17RNPONnvVQqxH9V/OVEt445Pk86r/
	6B6EuPDZ3kr0Xyr2vzfQh7eGSYXF2Ac5hPQeUcIR6HdcVDXLdGZqtDc08gzs5g1+hqe1rMSrVld
	Idv70AM8HaNH23L7RBX45kSw4nLeQ0m7wKpXjS9FY26rrZ4DTLlvgZKU+HT2XhN66pLKvBJlKXq
	ZhQp5foQ0Qc1DzhbbyvOo5bnfmBpu+egywtWZbRmFAuklHEuKIlDo6298W8aaGLd3H5b8oAmeIR
	rGg19Sjf38YlZzHt4oaVgzboVYIJAWmwBbmiQ+wuChBSrEVcId4EaXC3bjeNZK/L6QNLttoSKTb
	HEJLkDzQYICKniAMlLOynUrpCDTIqNAv7sWYCvGpOmbAhVgzzXVunwUkr07uwIxeUFa8DEz08y5
	QBHaV3skR/+SkVjKknwEBaKN2CVuLmlLXs=
X-Received: by 2002:a05:600c:4e56:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-4a01b00ef27mr71316935e9.33.1790842910996;
        Thu, 01 Oct 2026 01:21:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6ef459sm36030645e9.1.2026.10.01.01.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:21:50 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:21:49 +0100
From: David Laight <david.laight.linux@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: akpm@linux-foundation.org, pmladek@suse.com, kees@kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, jim.cromie@gmail.com, ljs@kernel.org,
 thunder.leizhen@huawei.com, mcgrof@kernel.org,
 andrey.grodzovsky@crowdstrike.com, rostedt@goodmis.org, ast@kernel.org,
 andrii@kernel.org, daniel@iogearbox.net, martin.lau@kernel.org,
 eddyz87@gmail.com, yonghong.song@linux.dev, mason@kernel.org,
 ihor.solodrai@linux.dev
Subject: Re: [PATCH 2/2] kallsyms: Optimise symbol name search
Message-ID: <20261001092149.22e07e90@pumpkin>
In-Reply-To: <c26e2afbfa2cd71b2cf8bb0e963bb1d67dc5519bb5c4307c96b826ae5fdce269@mail.kernel.org>
References: <20260930132109.260597-3-david.laight.linux@gmail.com>
	<c26e2afbfa2cd71b2cf8bb0e963bb1d67dc5519bb5c4307c96b826ae5fdce269@mail.kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  1 Oct 2026 00:45:19 +0000 (UTC)
bot+bpf-ci@kernel.org wrote:

> > kallsyms: Optimise symbol name search  
> 
> TL;DR:
> - kallsyms 24-bit table struct may be padded to 4 bytes on ARM OABI, giving
>   wrong offsets and a possible out-of-bounds read

I hate ARM OABI :-)
I think it is the only architecture Linus still supports that aligns
structures on 32bit boundaries.

> - weak table symbols may not read as NULL on relocatable x86-32, so the wrong
>   table may be chosen

I'm not entirely happy with that bit of the code.
There is a conditional in every table index.
It is crying out for either a static branch or just compiling the file
(or selecting between two object files) once the symbol table size is known.
Either removes the need for weak symbols.

Anyone know if there is 'prior art' for a late compilation?

David
