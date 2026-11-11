Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794422718;
	b=afsEKAydwDWKbLpsfmfXGH3nC9Mg/fFs7ezo6ntTCFofMNSpx/rJSsfpnnIvB3dMS6pZ
	 o2byxnptDSN9wY7V2mC7925NSMy2ewFJp5g1xDvgEpakrqqey6vPX5eGezUYa7rdkkp/H
	 GYIyUZMb3kYGRn6jIwI4IL+TTEoP2y44+nNKCCRLkpA1WhPBaxDz5kGk2PRePrUJ5b8yF
	 gxRrie1J81ohG6HA1t5lHnz7VpeZDo5zpsF0F8I3L/VZtZ5RJORFFP3Fi7iyOstQ0XYNm
	 f0fr8RpXT768mhUwEZG1f0+X42Qjz+2ZdLrGqYlSou6r2JgiRs15Qatygir2Itgd0nA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qN6v1dbYSFGlwHtt/ghkjuZGFvfVELfCgPaf7QsuhL4=;
	b=L22f8X/nJiaOUppgXZ8rGcFRXQyCKf0/hRsQIXGWX6Bl/Kw6pm88uncKMyoEjshLQVVA
	 B3dg6aSW52zUcIYlD85Xh1pe8qbJg19++0vEgV8dckAtt1ajajr7IThzphfH8Ik6cfzaP
	 lp4zs+CPyb/eTOtO8MlfVMitjm9cmMBKxgs19iorHXs9pEVmg0sOEwa3rbQsNBbGD76Br
	 pbFJ6UPB6Dc41XztdfNDsPwpRG8KAmQuYW7rz+LQ/JeHvbhZK0mv6gmfLxznGVxFrK9b9
	 6vZGMmLwdxVFjUUqAfvvCU3kkPEdR8bGca+MCzFrd6Ll41IE5vloONEiEv5oxz4GUgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JXXM1Ttj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9A2606A32D
	for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 18:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D9A2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JXXM1Ttj
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48fd2e38825so2099408f8f.2
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Nov 2026 10:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794422716; cv=none;
        d=google.com; s=arc-20260327;
        b=YLLyu8/lHVB2AUMgsq1TpjXPaV490+EsLMtGqUOWpUMnAYb5Qc9mNAomWmKPugrkMs
         jlUCPqg2olPYKz8RNULkUkv5f1QgwZQWXRgsm3lSm6vu4/Ux4VvsnpC36SeofIYSEPKq
         dLaJkqOQ8C/M/19p1eEYpgUhk78lpLslmknXQSUOfLzFB5FUrt64QPItKlbOpnI/VlBj
         DkvpvvEpyBqC0SsPnDg6/9UysSqfpl00uQBVnO0ywzyPELvpMLeljk7aOcvM2uKW1bhB
         PrU2Bcjj/BfRrD0FcHfLsd8H05Szha/7njEwGigi0vEDjMMil5QHvMwSaNVXV8V+yd6O
         6pnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qN6v1dbYSFGlwHtt/ghkjuZGFvfVELfCgPaf7QsuhL4=;
        fh=ZPivqrBZySlwkOdZt8e3wxErA5UThRMch2BWd4SVvFk=;
        b=SCc630auOn4Inv7vNI0i4dIVXCSsC077xdh6gMDAZ9/q+SKmUT0L3TGdUH5DsnXwzU
         cfQdF+nwHCXA8+QA61sv2Z34JOMYzFZSUaldfLAaGI5jEVr+wpO4kevu2yHm7Of89Dm4
         ow9Gu36ZSoSrI33SWbcGBmDh8vBtk0yu2uL3vvxV+s0S9gm6lecFzViEHugvQkhhTWW6
         MwTbXGkJiCMrDPasTzE3T6JrxMJtWbbG1lzGB2j+LBajpvVGpGeZ5DFgZ6+/BgxKKJ7c
         f/LizVnhoZ6qm972SQFYH15MWhavhqBQS0+xWQpMumdkIGW9iLOArbPP1GfjxnStHLBl
         ysOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794422716; x=1795027516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qN6v1dbYSFGlwHtt/ghkjuZGFvfVELfCgPaf7QsuhL4=;
        b=JXXM1TtjDXwiDsfLqVlRuk1lVGRHwb6LfIxwSfTu8ARBL6aiD20t6U7AJVxFhPkBtM
         RYtrqICSag00Hg+2cOlBon3aDKhEb1FuYHTu+iNWhYF3blrYV9C4JJDS/FD1KYUMgA1j
         3QGKvbOlM6zAHaLjPG60Ao00OIkntbDLz79n73rFB/Waf/N3n2D+akPsVv3d71kuI019
         Hhv0MgY4cdXV08+w5MjG959J4rGhL01/xOzApzS27IOzenVyxCHEqO4277ImmzxwDYDf
         Wj+ixUHTByKcUkK8xMWrhenHEI2c0anEWiKNTwdn+/mcHo1QTDfLxGvvyuvivmb4wNyT
         R5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422716; x=1795027516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN6v1dbYSFGlwHtt/ghkjuZGFvfVELfCgPaf7QsuhL4=;
        b=lmvhLkcHpyR1xhZED/DT161i+zqI0rHlirHFe6fxaBacWP2uZatK4diX9Qo0YSj5+e
         o+SZfsqS2YmNiUTYAWs9k+OpDrdYjNNmv5D522PZoRp4CjsogucOMHcBRJj5QHZskLYN
         vtQadOZqyC7TJm5ExBjzOMqsVnZBsSTWvvKdE/PmS/wf4JVMJgeNWrqDKfon77k1HF5d
         di1klxUWyslAUmYNojLhNnl8cgUZFm2lmcvjFZOSY/YkAonEpmn1zYKYhN5mkI3PkD/5
         LPHBR+rvk088R3x6FeKhzMPV0jjY1UxDshU25XbaXe5iaWKqifGCVfRPAQ6EhnsMwDjY
         curg==
X-Forwarded-Encrypted: i=1; AL+hErGIaDJiiMtf/XKRq6jJQBu0hKevqeZXdAp5WsZ9lWRsLHAVuVZRKvFoQFDuEFlesWelMJGs0ZGeP8+AiRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FP12hhbn0w7J/Z7bnsfimHLxoxZbwRk1KdMSeMcnfmsqViA1y
	/8Y4BFZe1UXFvVxkzk+qu5IR4bQ3EUmQV7ebQ1Z6KHT4FMa6BMqRVKcPafCu1BGLt2eBZPPlMeF
	+UjR+sIah9SihE8AuQLflIToVF7UslTk678avPTsB
X-Gm-Gg: AYBFou1LwYM02Ml8FnaYd99Mda1Y7CJwu6T3SYudbgKXkkUYlLj+NaQ3zNH/CvHg9LW
	5dZWGBC1v52O72pCZNPpkrLcayAn0fWHOYYmhUsYDNiu0nFHIGxIDGeOduiGbeWNuiTUK0b00yw
	/4OIyFKY0Ow+Xso77ROh0cNlR0jTtcZ7Rcyt3sJLyOvVFSwkR74n9qfbrLPscDdB72ZqfbA4t7B
	UCCX92+0kDjcqvUi74lnQ6kcTrM5vDHsQyKG37iVkm5gKMajuXe+H0AXxUOvQcl9CVlfazh7RD0
	YoVJ2IklVN4B2wwrHKQr5BND5TDFyzgwpYXI4uNbShQZmdf55SrzbwHdtLrc1ncxhgxHi2yGmMC
	5zPmc/YpRsWB1DpIiA2MQd5eoABUV2RbuBXvsb2EhZ8jyJW+DZ4KnwZlNvpdYJWAiTPGLP8WlXw
	4un854FADB2n4PbVeBMMLBpXKzFxNJ4hVDZVX4cYfQwrTAZIzaEMJU5ov+gP8Ol4OeHQsBndKEK
	nQuWR7pGW5mGPyuIrvRgQZS+gLcLuLXPbfQLQ==
X-Received: by 2002:a05:6000:2003:b0:490:50c1:f359 with SMTP id
 ffacd0b85a97d-499c708323emr6448339f8f.39.1794422715208; Wed, 11 Nov 2026
 10:45:15 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
 <20261110-kconfig-toolchain-updates-v1-2-6d4fb636290e@kernel.org>
 <CAKwvOdnFG1ACEvGPXGW1XK_3QN+5UaR_9EumhmrsyKOs0aYCPQ@mail.gmail.com> <20261111183611.GB1452558@ax162>
In-Reply-To: <20261111183611.GB1452558@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 Nov 2026 10:45:04 -0800
X-Gm-Features: AclHuK_9r4Vz5uKygUGZIUoOcqYm2micCjZcbpAhINBsrpfAWKW6AJJEGMK37sw
Message-ID: <CAKwvOdnmJ6TCdtr+LPK9nBtwF24QY6-cQA3PRocuvd_gQUpJ9Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] scripts/Kconfig.toolchain: Do not dynamically probe '-fno-addrsig'
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jordan Abrahams-Whitehead <ajordanr@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Julian Braha <julianbraha@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 10:36=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Wed, Nov 11, 2026 at 08:51:05AM -0800, Nick Desaulniers wrote:
> > Jordan, I know you were playing with -Wl,--icf=3Dall recently.  Looks
> > like the kernel does not use it; AFAIK, no one has ever tried.  Even
> > -Wl,--icf=3Dsafe.  Worth a shot to see if it boots.  If we did, we'd
> > have to update this kconfig check (the linker flag is only supported
> > by LLD).  Even if the result doesn't boot, it's perhaps worth doing
> > builds with BOTH to see what kind of savings are possible at the
> > limit.
>
> FWIW, ICF came up once before through OpenMandriva defaulting it on in
> their toolchain.
>
>   https://github.com/ClangBuiltLinux/linux/issues/1341

oh, I forgot about that.

maybe worth researching at some point. Low priority, but filed

https://github.com/ClangBuiltLinux/linux/issues/2189

to track this at least.

--=20
Thanks,
~Nick Desaulniers
