Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067953090E2
	for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2026 03:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782272067; cv=none; b=aK+klvne5bAFRSudYn7tAU8RK9H0mgh17idVL6ZewPsaJ74ehuOc7Qm+IFv4H/ZLKtwqhk1yF4vnzPIjRbVnAt1ULLOLP7typELCzS1SgY0sByMH4WLtMgUBwpY6WJB3QCUD8Ks4p5Zg+/euZqx8kiyNTSh0MJO7++GO4GmCTJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782272067; c=relaxed/simple;
	bh=OkM/HJ/yvg7XNaPXMhtxxI6wQvvBZYRO/vN8NU9BkBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDkv1jMc23SpuB5wiMM7MLfM64CPb8Huh1cd4gIQiDEtzF0suQPx5RvtxaF/QASspjKRqFAvGj7oawXnGz53tSxqw62kvnDO+pZD1TuIlB7v3CHfI5L1VgHkpo0jvu6FD4pWq6Pf3JnEkYqvDt0//WnYFW1l+QQcluWS3Z+Edi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mcqcufXG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mcqcufXG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so2914545ad.2
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jun 2026 20:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782272065; x=1782876865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eAkIXBRDyBd0kWrdYtz/1kib51xAPhB7FzTxrU5LimQ=;
        b=mcqcufXGPV1aySUa/Lkes/uYU8nF63/k7SxO2eLkkjhmydoGlXUEHBMUI2GBvQ5Lox
         1am7eWygFeAJDU7OtDFaFjGWwDSbeYh++5Z3maN3bgEf8nHGxdr92FlI+L0sOstsnW+Z
         98RtEBYSQK08k5/5vUktZdGtDRpGJrsHmDuqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782272065; x=1782876865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAkIXBRDyBd0kWrdYtz/1kib51xAPhB7FzTxrU5LimQ=;
        b=pUXHkpMH09trl0qGDWDuyNB/OcTyxwiUQT4mp7APTonuLCgwIGJIjkhXptjbVpR8m+
         Uds9GqQ1GAEMTGO2CsSwCpVSf0yIV0nykg3SxhICt1z2BruG1aFU7TuWJjv7FhtvtRUJ
         91E2ICAIXnXEBs+QTTNpn33KbPOcRyiE1UiDMQjr/bA8se8p0zlt9n036P6xwwaOL3Pp
         FhFB1FLQta3mW2SI38mmrVO3pSXs3vo9MFjPH3tSzlt2rdTI4EIODAN8E6j/Wc0am4vp
         anY9lC6tvFSEG3WAeKwmlJaSLPbNnXhWFcVsjfz7nULeouH5/gaj1r9OG3IvoEE1fBdI
         xTzg==
X-Forwarded-Encrypted: i=1; AHgh+RqgkGCh/7a/0CAMoHJCKZt2liZZNWvomZrCbLFHEqQrzyem9m45MKSSTO6+pFKpK71Z+yy2VVoAxMKn+T8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhmaA4OXWbbrjBQB7RTFFtL1z5LJ0dxO3M8JVAHCpu17u1/aXI
	WhrMc2YaFdokCQ4g59v23Xseg5K01RsVMgQwrEZGCAWJ/DAerPM8OMjlVE7iDyKz4g==
X-Gm-Gg: AfdE7clYvCw3l57i2x6GbKqzliltTw/Fwve0tt05euXUtgM+O1x4mOu8Lnk0vchcie0
	y2B49xdcELPYkwsyxWG2F74x778oHwRSSQUFHZsuwZ2qFa7hze5z5OR+QZ9w45IdxnqrkLx/VUn
	IJin36dkRjSc/RvQ5+QRF1DpUru2k3nJDwJmJhhjvMGL8+afFEpbKBhE1Kxh8bbCHY8Qg+5oDuw
	t2Bv8V7KJinmDScbbSceZBvE6ej8I42ove4MbByD7oMRYHf/Q7rp0TdmGpZfh5eiDcp/VbioseJ
	5nUShESGuD76jcdaLlhYrtC/MGV+q91k7BT6VixIUVL3QPKkw1nFFY6ZZMLH9DDMdLWcln2vmmQ
	J4OuWwSTn2eNX99A/n73RdSsPgvq1eMnd7L3QDVUTsXykEa7/ypBRM+qxw8Arp+w8DVcXqa8Xe/
	fLQ60atFbJu4zQr+6ME/ZFPUeQMm25d7GjRqxwzekqiTQh2z32Uj/6
X-Received: by 2002:a17:902:e84d:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2c7c7693e0bmr65176875ad.21.1782272065356;
        Tue, 23 Jun 2026 20:34:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:1287:5d13:b2d6:c6ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436af6cesm132002055ad.1.2026.06.23.20.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 20:34:24 -0700 (PDT)
Date: Wed, 24 Jun 2026 12:34:21 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: andriy.shevchenko@linux.intel.com, julianbraha@gmail.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org, 
	rdunlap@infradead.org, tfiga@chromium.org, senozhatsky@chromium.org
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
Message-ID: <ajtPk6gz8bd4bsxy@google.com>
References: <ajo4DVWoSaEZtBDa@google.com>
 <h3gyuwk2f53msfeuk3urxsfhrcsevb2rqszfh7x3laiwl2bma6@5edux2cyact7>
 <ajtM3i49HcYAF3wX@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajtM3i49HcYAF3wX@google.com>

On (26/06/24 12:27), Sergey Senozhatsky wrote:
> % echo "CONFIG_DISABLE_BUGS=y" >> .config
> 
> - Now run make (KCONFIG_WARN_UNKNOWN_SYMBOLS/KCONFIG_WERROR are env
>   variables)
> 
> % KCONFIG_WARN_UNKNOWN_SYMBOLS=1 KCONFIG_WERROR=1 make oldconfig
> 
> .config:4693:warning: unknown symbol: DISABLE_BUGS
> make[2]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1
> make[1]: *** [/media/dev/linux/Makefile:760: oldconfig] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> And make fails.
> 
> kconfig reads the symbols for (pretty much?) all the targets, it
> needs to make sure that nothing is missing (SAT), that there are
> no conflicts and so on.  Detecting unrecognized .config symbols
> on the kconfig level is a low hanging fruit, in this regard.

OK, maybe they are not similar, as Julian pointed out.  Makes
we wonder is there any benefit in moving this functionality
into kconfig (which is the tool that deals with Kconfig files).
