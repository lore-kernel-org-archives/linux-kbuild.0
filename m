Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164389;
	b=RgrO+iloJGvsWCV36uZeICTLrKNSFlKiVABTVf5BuVHTNgaO2SmpwEilwvMx0qfbJhJJ
	 rFtIATL8anoG01bVLE+ZHjpn7Z7cOxr0zxwyj10cCxFQbPP+O35BOVMq1BGG2c1KETwuH
	 qdr5De5+v8NkcY7QtET+JjbkEd1HOMHWFpDgSSJfo9Z5zuvS16GwElRfBXgIcj34qAXOv
	 0BPBjMR2HPoK1qwZ/7wLB2CGQPuNZP9F70ZtAga1m9pH4c3j/4NcBN80Iy2KgkoVliPnY
	 hSiLyPcl/yEvXJ2vphHsSB1WH4rMdo21PQXDuJF3dqmyTJg/SAPa//eNaAel9SkKhhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=GpAFUlt0XxBY6dBpUlo0gkGGdcjqwC3S9cjFDt6ElxU=;
	b=N6DAAXib6bcb03u8XvPMloIyEr1wm7gKxm+eodFjyAWN69k+h8JsgvSlt1VSPVhzxtyk
	 jmlYGJ6fIK/r3Eds5gbH34u1/h9wEVVBzA9EEEZzaDJs8uo1JI64m6Jx8qdby4zPCzkMN
	 soRbm8jihpas5itlp3SRO5cmWR4hQoHf88dWBuFyMl3QclHmNwIdSKWig00qcwvzSQFyt
	 q1EbBiGBM63vOdjrCHkEulD/rfB98VNlTRhecMCoIOJh6xB6MwHvVgI/vgLNov/xev6iy
	 SmKH5sdQbVbpZuhSRxVHo2eAY0Jbnj3Pplz+zen6ZXCA98pZJdUcNJgENtjYlsscDVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5dWnNiF;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2627606A31C
	for <linux-kbuild@vger.kernel.org>; Sun,  8 Nov 2026 18:59:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2627606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J5dWnNiF
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so1457025e9.0
        for <linux-kbuild@vger.kernel.org>; Sun, 08 Nov 2026 10:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164387; x=1794769187; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GpAFUlt0XxBY6dBpUlo0gkGGdcjqwC3S9cjFDt6ElxU=;
        b=J5dWnNiFRKZj0dtJfdFFjQLklNQbzPYUrEh25hgk7Motlge51LERu4P4P/TQlOUbgq
         iBlijpaSV/UfK5kMduDdxTVwVINj3JbvY6soIiXQQvfEdCOsmSjKq1rviZWtK1iaoaXF
         6IDxeEL6xY8eT5LA1UYCJ4UkJOO3eL6uOspPn8HF0IGUihihkerf/MBFkAioF5nInmZM
         drHx4xFDCHd8+Ek7/nkf3Gwg4H1KSB7v4XnA4oKWTzmwfb6d8+4EEuQdYnQxbST1abWl
         DbUlOOu86QNHAzYgk6o/bC3OfsXOkpfa1ZYNjle/htFyJ21zhRyCYbtO8MCxvowUMQhZ
         sKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164387; x=1794769187;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GpAFUlt0XxBY6dBpUlo0gkGGdcjqwC3S9cjFDt6ElxU=;
        b=EA3y32WtjJJ406lDrKHHhia1wnpQQje3+XBD1gYCGbOVSj8TnFNiOpKM4UUSTm4Bpr
         hGKroFCx6rc13K1N1UDkfYuVBPCAO+mYzRtjuZz0YwMEAbzUL2o/1DVe10XqSa+Y+THH
         ZF3a5Ac3c5ScI97C9jhzutHkZgvuR/iZWR4SG3gz7kKhGo8vGkQB1E9S8ngZgcPI+P/q
         DWxil9qV6DU/F5qwHXb+lb5P963bXkw+ah6zl78nvi1dIhQVIYwlsjsYSah5CqChnatA
         xG9ya+RRo0tDpItAiTQgj0Nh4GfXwn7HLpZ/3zwWhmnIlzyvOFSqsYCMFR9b8VJkCGEj
         9j4Q==
X-Forwarded-Encrypted: i=1; AL+hErHRuX9UQNm0MxJlAxPAiQZn7I0CXilWJGFzyL9hhrJZVqS5MvZEr+0W/h8ecHGGtpvhgpSV773l9x8hEeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z97CiN4t8wmgzBwfCwCDBd3lCAIf7LagHt/D8LiZPQAI9JJ+sXs
	XSTQioYfPQA8PsDl8JDudi5FJYXhMED1W8cU/gYUY0IlW4Ks+5maRA4l
X-Gm-Gg: AYBFou2DreQZibXxEA4TX+iDSX2HRlEZ3YP+Ta+RBviFFDxE3CsgfCYgxHwIvW9dD+9
	tn0Miw0UCHUUwRiJtHDkN/Zir/fVe0MHAlqrYsZPKbVs8Fq1Ous7l4zTuitmLoVpHLt0uUAUh7o
	7cS8wFYQ4jOA75lvn6LJpz3EunTxooht7MCBg3/hgRw79EOXTcXNt/YeBdZclOpHGzSyM0qR9nG
	Tv7/MvLdZic2HSMAkaMEmNvRBn8E2hDN1A4d890bklM3xCJpWB7FNBa/pxhNZVCVRTpv/uxUkxM
	8p5BHVraCQoOnP7UjGDtzwFy/eWZX7YhNMFCBn7owuYC07nqBl31vR+L+o4HwJfYD/eSC2fe9j4
	mfwPbTmSB385EOcPO8h68TGBNGisMm5YrbDuhn1gb1Jl4ygHoF7mAaYVG+B4+g9wh9NnSNtQEd3
	xj+SELHMRGkYvMpocAZ+uatncgGmBsUDq7OI4qDMeT0DiqcjX6t0l9Mnt0gu3J7RYi/atCKubVr
	nhTOAEcGn5oh/P1KmmGynPHYqTeFwOOMA4kCvuyA+6V0IElKBZOuQhnT8ZZC4yPr5kU8sNmfT7g
	Ez3vf0uTG+a+883dZaxEtb7XlEW55DqOkg04r+UPUmSe/J+z0onBpNrck+YOrgGCacQLhyDKEnd
	K9T9WrLxXY6v0xI7+hWoD7y534RqZWaBZTkaBmjy4Yw==
X-Received: by 2002:a05:600c:3ba4:b0:4b2:61e5:b2f4 with SMTP id 5b1f17b1804b1-4b963c65a88mr49152645e9.11.1794164387223;
        Sun, 08 Nov 2026 10:59:47 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f11172esm80401145e9.12.2026.11.08.10.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 10:59:46 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <3dd2bb0d-8486-4630-b496-e92e4ac37c29@gmail.com>
Date: Sun, 8 Nov 2026 18:59:45 +0000
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
Subject: Re: [PATCH v1 04/10] kconfig: Introduce checkconfig target
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-5-darwi@linutronix.de>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261106091922.7560-5-darwi@linutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3ScbaGCYTbGeYkRt0jz5kpka"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3ScbaGCYTbGeYkRt0jz5kpka
Content-Type: multipart/mixed; boundary="------------NII28W9PtdHxoeuGqG7HRNpZ";
 protected-headers="v1"; hp="clear"
Message-ID: <3dd2bb0d-8486-4630-b496-e92e4ac37c29@gmail.com>
Date: Sun, 8 Nov 2026 18:59:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] kconfig: Introduce checkconfig target
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, John Ogness <john.ogness@linutronix.de>,
 Derek Barbosa <debarbos@redhat.com>,
 =?UTF-8?Q?Zbigniew_J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>,
 Daan De Meyer <daan.j.demeyer@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>, linux-rt-devel@lists.linux.dev,
 debian-kernel@lists.debian.org, linux-kbuild@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106091922.7560-1-darwi@linutronix.de>
 <20261106091922.7560-5-darwi@linutronix.de>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261106091922.7560-5-darwi@linutronix.de>

--------------NII28W9PtdHxoeuGqG7HRNpZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/6/26 09:19, Ahmed S. Darwish wrote:
> Add a checkconfig target to validate the current kernel .config against=
 a
> set of rules.  Select the rules using a mandatory RULES=3D make variabl=
e.
>=20
> Example usage:
>=20
>    make RULES=3Dpreempt_rt checkconfig
>=20
> Use the kconfig-checker to perform all sanity checks.
>=20
> Document the new target at the 'make help' text.
>=20
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  scripts/kconfig/Makefile | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>=20
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 5baf1c44ffa2..d67a23730259 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -125,6 +125,26 @@ testconfig: $(obj)/conf
>  	$(if $(findstring 1,$(KBUILD_VERBOSE)),--capture=3Dno)
>  clean-files +=3D tests/.cache
> =20
> +checkconfig :=3D $(PYTHON3) -B $(srctree)/tools/kconfig-checker/check.=
py
> +list_checkconfig_rules =3D						\
> +	echo -n >&2 "Available RULES: ";				\
> +	$(checkconfig) list-rules >&2;					\
> +	echo >&2
> +
> +PHONY +=3D checkconfig
> +checkconfig:
> +	$(Q)if [ -z "$(RULES)" ]; then					\
> +		echo >&2 "Usage: make RULES=3D<profile> checkconfig";	\
> +		$(list_checkconfig_rules);				\
> +		exit 2;							\
> +	fi
> +	$(Q)if ! $(checkconfig) list-rules | grep -qw "$(RULES)"; then	\
> +		echo >&2 "Unknown RULES profile =3D $(RULES)";		\
> +		$(list_checkconfig_rules);				\
> +		exit 2;							\
> +	fi
> +	$(Q)$(checkconfig) check -r "$(RULES)" -c "$(KCONFIG_CONFIG)"
> +
>  # Help text used by make help
>  help:
>  	@echo  'Configuration targets:'
> @@ -154,6 +174,9 @@ help:
>  	@echo  '                    default value without prompting'
>  	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
>  	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and=
 pytest)'
> +	@echo  '  checkconfig	  - Check current config against sanity rules s=
pecified by RULES'
> +	@echo  '                    Example usage: "make RULES=3Dpreempt_rt c=
heckconfig"'
> +	@echo  '                    (requires python3, PyYAML, and jsonschema=
)'
>  	@echo  ''
>  	@echo  'Configuration topic targets:'
>  	@$(foreach f, $(all-config-fragments), \
> -- 2.56.0
>=20

I think this tool may belong in scripts/ due to the kbuild integration,
as was mentioned in the past on another tool review:

https://lore.kernel.org/linux-kbuild/20260428183101.GA3304253@ax162/

- Julian Braha

--------------NII28W9PtdHxoeuGqG7HRNpZ--

--------------3ScbaGCYTbGeYkRt0jz5kpka
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavDGoQUDAAAAAAAKCRDElYPCBXNxICr8
AP9ab7lj4yj0R79XczFEOb9wo5VIMZGC3vGZY5oFqemP3wEA3AwrJodpubXiVsw04hceTbqM6l8E
RZBUQogdrKCHxwU=
=wQlh
-----END PGP SIGNATURE-----

--------------3ScbaGCYTbGeYkRt0jz5kpka--
