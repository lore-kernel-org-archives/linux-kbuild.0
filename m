Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792614494;
	b=08C6N+uCPEJ+PsCHZqjFU4glZtVSoaqiNa1crvthEmm+GmiXogcOoaU4xAk0eMrmyMKL
	 +BxgqCerE1Y4lowBnbsusvzSmAeucO53/jw84C7YHmPsmsWowfQexdRb3rv0PilImhdUr
	 +dehvRwrrz+qg95eM5XSxS5JOzJjgieyof6KOu/N5bjz+Z31cgc9eSiIWQW7W186BeUq+
	 lpQ6LhG6THzSO9Oxw88tTdpSgNyCN/PiBE2KuSvqJlOAd6KFq8NI7fzWdzd9iAxONBMFh
	 VzxzMc+dEmQLtuuD+6NtF3pN39yMZlBgr9R4Bjwq2JwvhKIWejs3W+FXUFo4h7QHOUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0puJpnNmDvGtBriXSLRhq4RtO307HXFeqwawArp0hCM=;
	b=oNmoJ4udoWcRe/6ifnIW3qpyN+MlH0T5B2AQmqoQ9R5+KhzfC5bDxrn/uByahgm+QsDw
	 Cr4ANJsDPIXJjSlDvK4NBvwRfYG8WseGvd/cJkts2EhHJWnmpRjCzUjugxvmqPfrNUQs4
	 6vxl4MayNlqGwTdtn87/d5/MYP3hpBiS/Gy1bExCI4jXCR/yjyehuIT1QrjzPbX6pFxOv
	 eeeVfwGELNVHmLQi5U9q2gV6uhbVYk7M9WcMqOiPenXmJSlkr6LMkZXwDKR+UQuFDf0Q8
	 StOcR9HBnkKQOPVTNvKMbJbVqIUAD1HxDERoBKn3x79eCymd55jn0kAt1GyKq5scMpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=URXmPl2z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4049606A319
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2026 20:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4049606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=URXmPl2z
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so1806270a12.2
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Oct 2026 13:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792614492; cv=none;
        d=google.com; s=arc-20260327;
        b=A/jToz6F5qqOosy/mAQW+aee9/Zn97CLZwnYG9Y0Kn+E6gnNRuiwyKwBv3jQu+PYxo
         U1nReewiiq1q/sfxRxTUSKN4NmV3wJgdlmRSQGZyW4nFJUajQKKyK2oUPYtJQHb0tQtL
         +SiaE6vSvxNKP6Eva74atizdju4GMk6xB8tFnm/Gp8JRTBSNuNB4m5w7Qr9wf1s+MUdV
         yPJtcncGwTv6I7n1RwpITNF0iTTuXFjxPxe9bbocZQvsmbFzkILhfHPyGCjJDJ5gwEOi
         41FVqQk/Z8EXgMC2QFccsQeoKeWNZYS0RpobHcXX44M7B3JNi84joiSdqzuuDwQfpDYh
         Fe4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0puJpnNmDvGtBriXSLRhq4RtO307HXFeqwawArp0hCM=;
        fh=hIkT7U/mWxbIH+zbcIVgADkSwZtv6y4iAU3JOD0nExw=;
        b=d46UkALHkF1KhMfaUvzQNzGwOgY/tlgoRk7xaz6INAx4iLROz7DQvccKzGArYjF8QJ
         yGo3B3nvOLPvVYB1TqbLz8WwwAOIa6EaZYsVf6jVJiNJtTrcT0ZFh6tN+bxYJ9KW+jCL
         yXgYrhrO3V/mzSDngd2DYD0hwIvYFpt2mienhcpMrJXCyfZpvgvetfoW7rekHmsu5AVT
         Ec8pfZQZuQ/ny3+WwFo+7EiU4/JgHn0ZapCI7ICL1dqj9YT8e8v3XA5UP9qq6VgT9vTo
         OEmFjcg2QN3p8A0UtG8EvElTRMjR1UPzOdLjCGXW8vMP8rXlvWHE2piKP91FiTV8M/2L
         60cQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792614492; x=1793219292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0puJpnNmDvGtBriXSLRhq4RtO307HXFeqwawArp0hCM=;
        b=URXmPl2zu5AaaNBg5ooC/iK7NTyySYtNXsaKySb9/H4Qw9911yJ2jwmHAn7350jJg/
         a2eSFgcfyZdyJRR5KOa/C7d9K5YOCA1vn4EMJYxfrubzWly4MIamaeyZZqOsJhQ5na1n
         ifR7aLm1Mq89DwJhJHOa6AjfRjuV2xrDd2m3O7Q5tIYD2xWa3PnAw3rIMmro6/CZC/sb
         cgeTRHoT8dsscKPO69TKUfMAo+skotHEBliFKK+PfOpdLRT6I6Yz/qPr9lRHyQrnsplp
         75gkO34utiegY/F2CYlPwaXxPgSki0RAvGQUTb1aS+ql1Fo0q0HYeRoSqdnVnAEZ1yD0
         PFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792614492; x=1793219292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0puJpnNmDvGtBriXSLRhq4RtO307HXFeqwawArp0hCM=;
        b=Vl0ARo6eJsu1RYBhUo1YeRm1BBOFy37UKsrcx6l8iid+H2HKIIt8y24Gtl1aG1QI7s
         j48oKbBMXhwudrmvY+zgUB/sj1+BkxXUvV6J+JR322WmK2qwYEK2tsa5N1GbaRQ/AtfN
         PVhPKkNI8Zfx29TIj4qPGa5VrQity669Ai8W2M3Zp6F3NafNdRUlGkhd0Qa0kQzFW1ng
         oxyRxJ9B7f0UdK95/gDGFIHCskLj/qfwAt2LijX2kPqu5/30p9zTcJ407931CxJSWFf5
         qufIG2D+JCVpNLicbDkKfXFAL2C1yOnVX26FT7G+Ld4Hf1jgZ52OY0gERlnXoyqoYPs5
         CfoA==
X-Forwarded-Encrypted: i=1; AKwUvBy3l3Nmu8FvFipZvF3xjDmg7J5f+YZkOWBjlG6Nt9T2hcNpo6EKXF1vGP7GN7Ut2TXHGyilwpHQjjVY4Vg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx7ejWVqWpz43HnLomZv3l46tn2VkWqRzWf61DstFDGa2CvpfZ
	8bBVJQuSFj9aLAEy/kIplsxzuf/Q97W1cZKIPa8t12TG+Q58TQAORWejsr+0CgOtxuUl0Ao1OZF
	W29P/xcDyuNc12oI7n1kQKIzK7Ym4oOY=
X-Gm-Gg: AYBFou1B2ePKG+vt13qwpIa3PcfSR4qKgp7JihWe2Lw9B8N2XY0kzir9XpDn6rxLv+D
	ZpqJUN/wQnTdThC5g3mqKM3gpklM9C2FFVky/J9U2PsTkIH5etPi2fQJZZug/Tgpp81qpAi0XlA
	KY/EFGiRCahra6a/ESngjV7iktNnE1+aVaVnlAGE/gi8xJ99d5XPL7uDrT8ye6kpU+M10SlKjya
	tSOozFa38B/RGYOs0MOcVAx8ajIUm3YwqA2PcRZ8q5/xGuU2WHHvFaw6A3fAs13SofwmwDX9mY5
	Izq1qe5SGWI/ROr3TSQnrIavgIwWUA4ELzRow6SAzkwhyuReQ3deG6w4+8lquvPwHzpS+9KxAT9
	mD1EYV99npIONMILli793LXwnYhkcmh2d+SPmW721CyDCNy/xZerpavRptlceIqlcfA==
X-Received: by 2002:a05:6402:46c3:b0:6a5:fbc6:cad1 with SMTP id
 4fb4d7f45d1cf-6b408e89e41mr2170258a12.7.1792614492072; Wed, 21 Oct 2026
 13:28:12 -0700 (PDT)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <atibhAMcgKle37-g@sirena.co.uk> <CA+=Fv5SUHkGtBPgzg9C1qGf6aiiFTVpStPd6Os3mTrz_+_5dKA@mail.gmail.com>
 <20261021185857.GB2608581@ax162>
In-Reply-To: <20261021185857.GB2608581@ax162>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 21 Oct 2026 22:27:59 +0200
X-Gm-Features: AclHuK80SVzQM3IT8hIbzJ05B2q7Hnxxi9JMQfhtwyRQawT4F4MwO5pP48izAmM
Message-ID: <CA+=Fv5Rf0puguC_G8L+CL6G5gjQZ2m3LpEsicN_jTcBpEK7XeQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the kbuild-current tree with the
 origin tree
To: Nathan Chancellor <nathan@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	KBuild Mailing List <linux-kbuild@vger.kernel.org>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Matt Turner <mattst88@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

On Wed, Oct 21, 2026 at 8:59=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Oct 21, 2026 at 04:40:22PM +0200, Magnus Lindholm wrote:
> > On Wed, Oct 21, 2026 at 1:01=E2=80=AFPM Mark Brown <broonie@kernel.org>=
 wrote:
> > >
> > > Hi all,
> > >
> > > Today's linux-next merge of the kbuild-current tree got a conflict in=
:
> > >
> > >   arch/alpha/boot/Makefile
> > >
> > > between commit:
> > >
> > >   c437950dceb88 ("alpha: add self-extracting compressed kernel boot s=
tub")
> > >
> > > from the origin tree and commit:
> > >
> > >   0d4d70da348b0 ("kbuild: Mark the gzip recipes as recursive")
> > >
> > > from the kbuild-current tree.
>
> Thank you for the heads up, I have let Linus know about this one since
> it is a little tricky.
>
>   https://lore.kernel.org/20261021184723.GA2608581@ax162/
>
> > Thanks for resolving this.
> >
> > This recipe now only copies the completed image, so I think it
> > should stay without '+'. Matt's series moved compression into
> > arch/alpha/boot/compressed/Makefile, where the change should be:
> >
> >  $(obj)/vmlinux.bin.gz: $(obj)/vmlinux.bin FORCE
> > - $(call if_changed,gzip)
> > + +$(call if_changed,gzip)
> >
> > The existing vmlinux.nh.gz gzip recipe in arch/alpha/boot/Makefile
> > still needs the '+' from the kbuild patch.
>
> Correct, thank you for catching this.
>
> > Maybe adjust the resolution accordingly?
>
> Since the conflict came from Linus's tree, I have resolved this in
> kbuild-fixes-for-next so that Mark does not have to worry about this:
>
>   https://git.kernel.org/kbuild/c/83deedcf85af511dc120b3cd8ee597d211cdf2f=
b
>

Thanks so much for handling this.

> On a related note, is your tree flowing into -next? The recent
> pull requests for alpha have come from your lindholm/alpha tree but
> Next/Trees shows Matt's mattst88/alpha. Should that be changed? It would
> not have saved much here since I send my pull request to Linus before
> c437950dceb88 was applied in your tree as far as I can tell but it is
> always good to catch these things early.
>

You are absolutely right, I'll wire up my lindholm/alpha tree into -next be=
fore
the next merge window.

Thanks again,

Magnus
