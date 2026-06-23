Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF13D3B6347
	for <linux-kbuild@vger.kernel.org>; Tue, 23 Jun 2026 07:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782200959; cv=none; b=byx9Xioi/SOvS3SRCuX/0Kvt3Ui0Ec+l/a60RqQMACslOw1M4fuAq00vuMTkDUCnDOuyrNze801wKIdHlxkzhgQM+9rFexPCrkTMXYD7QR3JkWCKT26zvcssiPGHmPVuGaKnDPQ3I1mC+FmjFlf1elsMTnYrAxE57+zsHSU8KNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782200959; c=relaxed/simple;
	bh=R2NfEFR48mxkPS9o5ja5whsn/gDEVUYlfiFFX9fRCMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mMb7ttXuOm3mAy6rhNYrlCjLvlVpPaEci7WcjdHge4Nk3+kPjLuv+qR30iNFutfYmnftp6IHrWxM9UHxs8cean5v/N4NsNk4rpNp5aECej2xVLbS7G1X9MqGR6F9YRfx/hgZE1WGsXAX3oGa2PuL7JEz33A4yzQBkIhkotKp3d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=P9CY92I6; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P9CY92I6"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c6d3851e09so27212805ad.0
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Jun 2026 00:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782200957; x=1782805757; darn=vger.kernel.org;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=stigWavm9kcEzMKTQ8vDm0IfVwfoW51oMNOmjzFHGwI=;
        b=P9CY92I6ZrPN/LpAK11+MP9m6aneZFdnBeCyE5rwYK/v8mVJ8KRE40EF8KQGtMX1pd
         NuizpcLv2zWAbXI7AeLnzXoBUN9sjXgtRFBXyUWz9wv3jvhutuQgAbXvnlClHXuBkpcR
         dQCQLeRYI0LOARIjwUK0mnuWY4E+BLm+n6Jfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782200957; x=1782805757;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=stigWavm9kcEzMKTQ8vDm0IfVwfoW51oMNOmjzFHGwI=;
        b=PyeHxWytH1iBeYpYdEg13xvBOcm8SGWU/dEgRlXBYmTVLq8MJGrtD0YEQZhFBCysjT
         TASYypPZ3G5Z+vxEouvDE75Y0keeMyO5SANoZp1cL4WV4C5yTxfhvvN2P6GwCBN3v6HR
         1PiSIOj55m+gjpdAKkZVOlY0Gq+4QCJVYzDqDaMwtEXAKa/o9ACRelNPhZ2tha9bKovZ
         pEvD5IYWinTT5ia5MHa8K9R33Rrvaf3hG3WG8eASd8dCfv3w9VV5rnnUkF2mgkVVVsnG
         Eo8JSd4BRozOgnujYj74gQl6pWH4tiHQzq4WsFTJiZ0y4552adkUtmnQrqodkMGnGhjF
         6y3Q==
X-Forwarded-Encrypted: i=1; AHgh+RqdfCkqm9pa8xKTUVAbKSVvtoI8wW+WXFo/01FIvkHvVMR8x/piFxLzDe+BuNIBh20wZkVstfL3e2V8xf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF9gN+25pw60ufiQjZ914hWai7kYZ4n4iWoYl4PvJ/DohOhDYD
	1UbnlttmuraCVkyT78LK5MTFYMQWPE03TQavrZgU8w35w2on8l7AA8PWnrPvydytiw==
X-Gm-Gg: AfdE7cngK/IM2M/2po4I4gokOgJKw75LJobGzGQDHiSAVfosyZyBDkqHQynxZnpO73k
	dgEoErZnmedXu+audksS2ZxCdA6Q6XClSqoSBddretdOed+WBAt76hESVZe/jIf4Mg6gcXx/mEX
	s+uJx2sGI6W0daN7fsLy827ZTg8js4kVBo9lpFc0ApfSsXrP/ucnCm6fTFKImLxvW4l2zFpD3jl
	NejapWtQGjKL1jMnY02LRWgU9pMnOrRYSML3F1WzygeEE+uRboqddDRMxc6KY5y8IU15geTgCNt
	rYJToFMyD3HnHsgfVVnzYZ2cgkdJ+wECwypZWmSAqwmo71l3L7qfEpSdOyjaesy2Z+kIwVZ0Ckn
	Ko3DcCq+hf+LClZkzSOVWUnX6jYyVsErilmy4IyJgnqNfOTnxtltlChBBpNrL59sZTKv/hIlzj9
	pEuIUtPlYJVzvUSZQwBQ3EapwPzrGTqhJ4UfY0fpZMJLU+qpgRuZsN
X-Received: by 2002:a17:902:f650:b0:2c2:245a:3364 with SMTP id d9443c01a7336-2c718fbc332mr190743855ad.32.1782200957145;
        Tue, 23 Jun 2026 00:49:17 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:1287:5d13:b2d6:c6ab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8d1dsm104708745ad.51.2026.06.23.00.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 00:49:16 -0700 (PDT)
Date: Tue, 23 Jun 2026 16:49:13 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: andriy.shevchenko@linux.intel.com, julianbraha@gmail.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, nathan@kernel.org, nsc@kernel.org, 
	rdunlap@infradead.org, tfiga@chromium.org, senozhatsky@chromium.org
Subject: Re: [PATCH v4] kconfig: add kconfig-sym-check static checker
Message-ID: <ajo4DVWoSaEZtBDa@google.com>
Reply-To: 20260527142703.107110-1-andrew.jones@linux.dev
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Wasn't on the Cc list, hopefully I didn't mess up the headers.
Just saw this on LWN:

[..]
> +	@echo  '  kconfig-sym-check - Check for dangling Kconfig symbol references'
>
> +kconfig-sym-check:
> +	$(Q)$(PERL) $(srctree)/scripts/kconfig/kconfig-sym-check.pl $(srctree) $(KCONFIG_SYM_CHECK_EXCLUDES)

I wonder if you have seen KCONFIG_WARN_UNKNOWN_SYMBOLS which seem
to be addressing the same (or very similar) problem (unless I'm missing
something).

Basically, what I have in my build script is

# perform kconfig symbol lookups: handles renamed, removed, etc. symbols
export KCONFIG_WARN_UNKNOWN_SYMBOLS=1
# make kconfig symbol lookup warnings fatal
export KCONFIG_WERROR=1

And then make fails whenever .config has something that is not
supposed to be there anymore.  E.g.

.config:1606:warning: unknown symbol: SENSORS_APDS990X
.config:2498:warning: unknown symbol: APPLICOM
make[3]: *** [scripts/kconfig/Makefile:85: syncconfig] Error 1
make[2]: *** [Makefile:760: syncconfig] Error 2
