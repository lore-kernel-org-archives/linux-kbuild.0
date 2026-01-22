Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E103A9D82
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 22:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769121326; cv=pass; b=Qff6CzRbB0e4hrmh+7jRSdoCc4Y/rmbjGgA6o0dlDsBd+IAPP2RcAlCdln2UwmkG8JkNlh/8nn7V38MOot7OoJWAfwaGXN64SVJXR7170Kb6FGo0jMXwuvczASv+BKOzcfsOoIKL9sNWCpkl4A16yVaem1PknYgRklBwnT/LFvU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769121326; c=relaxed/simple;
	bh=ufCvLsCqZ8AqaU8d/PBJBKuOCqPuK8xx1IL6bbluy9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pnpTYtbeYvNxP14tU26MUIokZe6P19NEq/WPp4kWZFqK6f48g2NNJHTp66pOrPihl7jYooMlivCX7EPdu8D87AqIntsPw1faWu3b0W+q6bp5yWAcREqso+Kg60XfobpiLPwjaQCFEszR8tXNScCUpe6XFYeh1/P8uCXS9ZCuBgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsBJcaNt; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsBJcaNt"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1233985e56aso161484c88.0
        for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 14:35:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769121316; cv=none;
        d=google.com; s=arc-20240605;
        b=Ppl0MR3T2XWYK1OfPKYp34rO4HqAleP+D/Rxxj/hC/yq4A6m0phUlGpZGT9UuUa0gA
         XV2Pf/sD7zYb4e9zbMheKLnYVWBhVTwIds8cnN32bZY6rwJivEt3MCYtxezIkxjSih8x
         SXUiRk1ViIH5EySQT1SNwKImgqa9S0xKWXJqtgT6qKsf0Vb3Id6kGIq6FmTuCnue8CON
         Eed/hm52r9HReOR2NUbL0pSZXq/VEi7V3sgnuUQCVOcFwYqTnNR8EtXi6e+BMBIFXOEY
         cLTkdSiIirSTJaJF1SPSJnbXrsXEvCGQpE9tqh+IH8rqZZsqmrGb4XnI+9Mnc46su8dH
         hYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5wtth2V1zVTwUMZNnZNlh5yUmwH9WjSxmkrJq1wiVAo=;
        fh=CyuOgRLjjnohbmNgLwdj1wxCY6NXstI0Qw75LNpVsUk=;
        b=GzeSVk8WbJ+lbQfN+WMCpj/vdb8ksFSELyTzcro0LqOEcQmJ60qvv9cP6UlLKKnuA9
         UmmsgHBTGRAVfBumg71j3c/x1x0YKNM5BZacwagYrnn+NzayZwFU5KIj3HsDccAuTtht
         vjjLGffIim2E6JX4D5Hw+6Wqel7VcPTyp/ZsYGuyMuezyeyf3NrFI2JoWhGtnn+8F2pQ
         TMsiRgup4Gozyjn8a0tjqC6UOZjaLv958m7RgC/3YDAX3Q2mwIyWGFCnAVU6N3xwexJa
         ykIocJ1i4qyFNy1igvwhLd0pDwMT3p9O9YR6E/QqTEwKlrxGN0qMQwh3yRP44K15bpCP
         8iCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769121316; x=1769726116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wtth2V1zVTwUMZNnZNlh5yUmwH9WjSxmkrJq1wiVAo=;
        b=jsBJcaNt28X5nD5R0JiU6VGLixIswniNbJhXcnNV+33C/KavSkld2h8Qx5SMbLgdIM
         B3FXD6NR2Tk7HA45TqMrPZ6pehoFpjd0QiaoJnqM5P1X4ocowcrcjhmzc99huUiIDxD0
         SQgVZsqSuX1+rvaXu3CSIeBPzgPgzf8Idd1iTNfH+G48qCP1Scvix7SwApxMKlu4njbt
         OuWyNd5Izuox0dJNcD+kLE8xlqyu5iKpA17yEheyBwUjzLm6jLXUCjE+Bwjc9bzfQLHq
         Ox6KYby0hadasVqYhjrGNGJylkjC6cfvHmH5lBypLHYTqbry3nfOm6a12wq3oFPIPN3b
         ldcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769121316; x=1769726116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5wtth2V1zVTwUMZNnZNlh5yUmwH9WjSxmkrJq1wiVAo=;
        b=QhZCnaQsLyvNrSEgn9omYBAW+ZgQR5y1LZFKrvsgFMhaPnCySp2PZsphGrgSIwMGRV
         T866v+Rk3XulD3Zx9cEKDF6z3svsi94kMgqm/jPdEBFrzG/EcySp8rVCHdmHwE0ptqyI
         E8ZhXooj7sdki6Rf4uegF/KNIGWnLgWjElj99E0VF3Fvl3KcixgSeoFzuvlBDHEQNUl3
         dnHGo725uWQCpxqbcwyuL0qBzgFFrWT9/nX5h3zLS4ZqsnxuGGFdRWh/yErClLzlTnld
         BSnrkpyAX5GhxTY3YYctCLRVPk6byT1rfrqgesEPNN3zSf+k8jI1YJFGkNqGjw3E3Mf6
         qXjg==
X-Forwarded-Encrypted: i=1; AJvYcCWxnNlLKRQ7x1ZJENjaUMTqSLXzsXAIwqbfrDe+U7Lk7uysA0WBs0T7Xk9o52FD7YxtCRyCYC2ZFz+dJzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxX+vsU/pRR1QwyaInqJh5TqLDrikLGvrhffy7WY92tgfJWeqm
	blyPNQEk/IsGr3m/mHWMpyct+1KxYJfvPu39ucWChzFW/17X6j+MEwrxjXpqeZvqyiE8XBX5TsS
	dJRqe5bd8wSYV0MilYDSwhuC5NZymqN4=
X-Gm-Gg: AZuq6aIH89fh1MUsJl0pXCcJaYyV6K5INHEmDlSjETcAcxYkCSgHwYmE7zcujGW7yx9
	KmTI7CzByzLq9Zb46ViSfs1+6T7DXclpAPiL4nPjVOKX+xKSn3PttG5nraSZ9pULMA4YcnwM43I
	jbwaXvRZmpCZtdxC6wxjR51a1ZA4jHX33lIY5MYPrTb9+Xn8B7CKR23GE911U1JU8uuM3Yb2qT1
	kpEkmMP6goi+X9F4hteGjnTzCM6Uh8W2dyZoY4BXlYLRUCFmVbK3ukMw4YFwJBKEDGIo2BM+/so
	5JGsb94VwCocpE/9ykW7j5PNH9zUz7QVToME423gPqjOwGI0OEVw0xKjl87HVxTUM0H+SbqFWsG
	dpuCiuyYCQSNh
X-Received: by 2002:a05:7022:699c:b0:11e:3e9:3e9c with SMTP id
 a92af1059eb24-1247dc0f483mr226570c88.7.1769121315970; Thu, 22 Jan 2026
 14:35:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122155401.335643-1-hheh47660@gmail.com> <ad197140-3781-4098-9a73-4d9f49356409@infradead.org>
 <20260122104430.257b5d9f86275b37faed4757@linux-foundation.org> <0f9f7ccf-8318-4d46-990f-4917b434ac81@infradead.org>
In-Reply-To: <0f9f7ccf-8318-4d46-990f-4917b434ac81@infradead.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Jan 2026 23:35:03 +0100
X-Gm-Features: AZwV_QhG0z0S1hTZFMlqTkW7auqQV_RtFulgOnCB4O-ilm-P1G0Y4bXjmbcaSw0
Message-ID: <CANiq72mDAR_qRJr9sBpNXfciEqO-T_dGPQR2xSFomTt2CU4U8w@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Globally enable fall-through warning
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Simone Rea <hheh47660@gmail.com>, 
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 7:46=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> I think Simone did.

Yeah, I don't know what is going on with that particular patch, but
someone sent the same one earlier this month:

  https://lore.kernel.org/all/20260110013412.14426-2-mohit.mishra@lunaredge=
it.com/

Maybe an assignment?

Cheers,
Miguel
