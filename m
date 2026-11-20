Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795179202;
	b=y6J/+NErrR/uQmfPP27NTLtalfxeCDa4Velqb3U60Uw6DEF9Y+8mk8ENvksi40jzGQrB
	 I+uPSgsRc3kYZlWS+yz4mxTDNI0DfD81SNdabMdEza/Zerx11lCOMlaVdbVNE9vtjWmvD
	 mazSXQR0kDTgUoeOk8bPUW45830mz1zuHSchAZ1UaaO7xQE/K2/hjE5FhO/hFHU4pxC+W
	 QLNSpQNoIlJUoY7rTVOZIplZ9HUNwyHrIi6ZQV1SgPrZWTbuYd4OElQNRiPMcsU+Rpnd8
	 lYVPxlqV1pborYBpfu0L7st73xxbDQrMYuLyhduEKuPVvU5TxsGtEnRtFA4OSREqIxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3MHtFFss0dXpF2UpQwJbxcc5iQ45JvDbWcteDmyQxmE=;
	b=F8eWcGgFwM5bmXzzQpMsI1inhHaD3IIlC+J0e6yPWtuDd63eoP6WZnKozyRNLkz5rokQ
	 rVZQiwKgN+oHpD4nDCjaUZsuWuRM4q03KePJ8ny/K8NE19nhzEEDy+U/B3r3+T2pl+czb
	 6H4sQIggNOwWsi4Iha/Scz+FXGHePWsjKfjB9RACqI5h2X/U62kF9KPk008PDMiI5mwjP
	 W5fxeRff6+lzL337RaiB6+ZheArfMFQDylF+A5P1MGZW/EQUBj5Z7329lOIPndHzquUzc
	 fhjhvG8ZdpELh/cIBeHH3mwejEFXrWcJ/TTtBTvQK4GR+BXSNthxH8JSJP6fxxi3kHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQvDEzXg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31F660A2609
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 12:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C31F660A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQvDEzXg
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3adf222704dso998041fa.0
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Nov 2026 04:53:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795179200; cv=none;
        d=google.com; s=arc-20260327;
        b=FQL9+IWo3aH0D6SK/OJyRcUvjqWU7si6T00/o08+pRv9oLLfFLv5NWvrVm9trfWWYE
         tEgAfFPG1WLmnKLFVID9ALrZ2L9RCz0o/zuuHy18+JqnCTv6ui8T2534VnXeumv6yLDk
         jD38iL6yQYMhEcgiKNIZBU7WTPRUe57+f7v/KyROBeDuNCJVMRbGPraMfGkFX2rGsCWE
         GUsUXkFk197xV7Sr5XWjJ71F/ggRta+tgBXVzywYTwbFhH3PlktX78tgKeqP/P0IrtoT
         E4AtVRivZ9j+mZC9rb65cxOKX+BZo6GPJTL8x0HMqoaisFHpa3qM220jHdacfrodJ8W/
         ztTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3MHtFFss0dXpF2UpQwJbxcc5iQ45JvDbWcteDmyQxmE=;
        fh=sw4TAY9um9Ve3H5aTfZCVfOx70ehiBc3sRKEcmKJ5I8=;
        b=kRd2Age/QG73vOwEskxoF/QAMMTjyWXIKvb6d34+93XH8wv8NW/1m5Cy8cVaYsne4j
         61chZV1L/+cZ/vUeXd6a2fcM6zk4bEAnlMbJ43mAXR0zzqwMqYe8UdD3IUx+kUyTSncO
         ZDsS/M/+eqzwjBxo5ONIGcgU4Ei+Nq6a1oA6iVAF+NPN29xHpV5mslI0AbjqIUNAy6d4
         LnzZIXq5c3cGrszEjepj7idkE2op3r7boqPmtTgh8D+fEN0RpfCZmvONg0r4DTDnf6s6
         tIxtKSFiw/oIapkQsCaNVz2nDJQexkZKoUuLIuBuBfWgC7qnHvwO6zpnCy2YDtqHzEwW
         tOvA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795179200; x=1795784000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3MHtFFss0dXpF2UpQwJbxcc5iQ45JvDbWcteDmyQxmE=;
        b=jQvDEzXgKEsawRKoG5gja8c/RAKmnFqGtl062PWnpLK8r+U8QANDqYB33WsU+HHYFM
         tnPJzTsq/TWPAsJ8aoJUXJ0Y2UuHY5thJpT1f6OmnOtrLQEW1yVn0Mc3dRvW0dJdjUXp
         LTVmuDYOsgOPpc2VKnD5jd16wc5qiaot5YA2UGCgGlXGqeShOB3yGkbLUrc6QkqTinNQ
         xkL2BvktmmTu6MTxkxhxyPhrHXt0ZjC+/qsIwtj0f/netTMtEV2nIOd1OJuiO44BT3tl
         /IHxiZZbkUxwB799qxmFKI01/iTxgFy7C/x7bZmdp57Dcs5vWpPDMZOCyY5hlNb9h6Ts
         DJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795179200; x=1795784000;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MHtFFss0dXpF2UpQwJbxcc5iQ45JvDbWcteDmyQxmE=;
        b=1oyKsp6VmF0d5YuP9Q0QqTWIKtO3OHUhABP/he5aB5vYPRQxwytYQL4+a/Mv5/LxBk
         oOHkGQWh3qOTRJF0Ac1KrJP89CPFVq647QMPdmsiGC9YZ+4/As/qchPjT3aXzHQinIE/
         ouTw+QTyicgEbxsFnLw8njPrFI/Rjh0wNwzsDaNtv6Kh9tnEaE/R/GARB9IQd3XStyl4
         E4X3ZLi6WJE1UcJgoh+9Yxlo6+mIei/OzO6fc+9bJOMts0OrEJNTiNwFYjH7Su9nZkSE
         7FITKTWycHUaPcrtta6R6NRL/oouwQQP/4Uv/CnnG2sxqN1Dnhg8i8eW8qrxgRjXODhi
         qBfw==
X-Forwarded-Encrypted: i=1; AL+hErHPrG9hVbk6xYEbizTkqfnkSpTj7xDtw2VZ1GxN+mko7dB0CGcs1QJ0cAHoBuvMW92EDGL3mjtIzpocCrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CNkIm8o+re+0/UnsVGkSHUWxBE8a9nAKknAncnGY0K+XsVO7i
	Ls8w7PzwKFrX5KhHPk9CvRGZwysi0CraWNqfbkUcpvLiXFhft5lXuV5STECy5FNVCm35XS7c9zs
	tUGLx1LdLbRB8DylDovNmYCwN7IwcX/0=
X-Gm-Gg: AZFdTZfWTc4qKxiKk/lMHWQvtXnEaC4491wX+va1guK/eDEHYYdJKzd+JZeHgDT4yyv
	J6NgSk0sm9ZoHps1WqBNFas1ZMFB+ezZH7tPcvCBJLO45JWKqRZ0m6GMZLXJnv3KpTGpZf0Ydsq
	c5xGXovps8YaCTzN1+lR04cHrWkpMkwufrFQCgcnab5qA1pIKXV1nWMrM6jwe7UG504B5TROdGz
	Y0Ygx2wIRl9W9iOqEXzyKD6NBDVX46mY0zVIUA28QNCuA9CLpAB2kkWAWTKT5V3PCLgw6ISVSen
	FGfAvOS+csANwH/px6ib5lgexh8BOTjEBgef822FhA2mVEH4Z3hPHWo6zysrp3usqAWaWxUwDfZ
	lHWlJW/bJkhGdmH/PVwIt4p2JGM+v4As9ot6T3Bm9RYCpWaopdyg56Bf5BajvNx1y6iupn+chbi
	/PsSG3Ua3Hfdf8S/axabqmlJdlHjaI7FJC/dWF+c4nVXuA4EQiJMC4flJE548CTbHI3sNfQV9de
	lXyvowCn60cGeChiXk36OV5dcO/4LM1283ootX6sf2Xvs+Ik3MWy5tlB1Hv8CLg+SSMws0k7NZG
	yN5GFmsnSL21smSSFw==
X-Received: by 2002:a05:6512:1394:b0:5c0:da9:407b with SMTP id
 2adb3069b0e04-5c1bc8722ffmr1214127e87.5.1795179199679; Fri, 20 Nov 2026
 04:53:19 -0800 (PST)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <avXdJyqNNqopuH2_@ashevche-desk.local> <CANiq72nw+g=RTvR-zZh29D0=MOwNYboNSeKkNr_Z4v74Q4hn1w@mail.gmail.com>
 <avc-fQWSvmtHhtCO@ashevche-desk.local> <CANiq72=RbzZHgZEMfLkDRQx-_PoxEfgL_Ar8figchde5u5qc=Q@mail.gmail.com>
 <avq_fOVO4dina23a@ashevche-desk.local> <CANiq72mWNJ6qpxUrsGHGiRHeqb=uHMzqEuYLOkK50i40T=yHNw@mail.gmail.com>
 <av9a5P6ciEEjmxbO@ashevche-desk.local>
In-Reply-To: <av9a5P6ciEEjmxbO@ashevche-desk.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 13:53:07 +0100
X-Gm-Features: Aa3M54rzj5mDtJm408mf92i5QGgwLI1wtx7vw52vAJORfiu8m-wJjn8uuDkfi0I
Message-ID: <CANiq72=8RZazqi6_yPa629n4s2OuQ2NODtfhfAM6kTRpryqthw@mail.gmail.com>
Subject: Re: rant on Rust in kernel
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, ". Boqun Feng" <boqun@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 9:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> make LLVM=3D-$VERSION supplies the version of the compiler, can it be use=
d
> to understand which libraries to take?

If you mean e.g. setting `LIBCLANG_PATH` based on `LLVM=3D`, then maybe,
but generally speaking, the kernel doesn't try to guess too much, i.e.
it will assume the toolchain you give it is correct.

Overriding parts of that in subtle ways can be quite non-intuitive,
and sometimes may not work as expected, e.g. setting `LIBCLANG_PATH`
may not be honored (depending on how it is built), or could in
principle even break a user that had a `bindgen` that worked just fine
otherwise.

So what we do is instead print a message when it looks like things are
incorrect.

Cheers,
Miguel
