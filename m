Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7899C364953
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Aug 2026 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786471400; cv=pass; b=Blih2cQG++014L517TWuLlhygqroU7vY/OI9WZKdkrE61rB194iYnBwtU5Hdx8rCYGhppdOcCWVYKiu3NluNOkRAQtjaMraKGhraZaobPIJNfAeeXOt02l+yZpfrd3VUvvr4yXEO2vo7o7gfp3RHaN9z5n3Wurz/A747GKcunSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786471400; c=relaxed/simple;
	bh=MoIAe+r/nMy5HKj2wea0IFKWy0S7HugyLhHKg6BcVm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CMbjH1Z2gtbXkqRSbGNPaxg20i+O8sGWXuE6wCsdpitWDq546rnC3gy2YdKX+9t1KtNpD/AyzDgzdn8gnG2v4daWJ5Zol+8+57esBlDE0oZeDtSFGYzTi0VSjWxzPl8EcVebkOiZdikGKZOyqgzoee8sfMvpo8C1djIlMSg+vSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbHNHLnu; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbHNHLnu"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so125612e87.3
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Aug 2026 11:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786471395; cv=none;
        d=google.com; s=arc-20260327;
        b=jQ1K2MHn0T78TV4wAhtpUlvPx281Hl1mAZSH+KyP75AxK6L32VZ0kp/tod9VplY7+D
         R0Cqgj0mMtplQSeNRZ937NOPMcy0GuH4LivlDRsd7Rs8LkgoT+euhIW7+hsVDmc6OmyV
         sgfi8ys0Mpw5eel9cNC7f6oI9eN9CDwHN6CG//6zC0pW+HNAyGCxgaaQmkRkh3TePigq
         3MddmC6cswEy65jTQEwgIL+9cKeAqAQuvu6oH7dJ9gI9vuODaifqdOR1zmxGXCbvCCc5
         ju9C+Bc1upwEcAyucb/hzs3u2mZ2FuUNo8rAchmcY0/FSjMiybqqJ3xatWITSQdDJJsY
         mK1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vjd/fAmD0D3XwcSyeIvZ8+6EDq9t9quZRoVQ7xFbSro=;
        fh=v5MjJuHicq+JFG/iOXMUtOKchHW3eiDVsryhUQk9sf0=;
        b=eqfoD0pdEe+POFmhmAdI410Vw0Wi1Bgqn9JlNrm+RUp15jw2QO1LiOqgoYBPNqcGSD
         W8FFEhmHWF23itwKDmH2gimR4kgo6POeSyfiwkfs2ybZYB861qqggMYN1VS3BqeZ3koA
         IZahIgMbKg7EB4GAUALCLms+W+MXeS3vPe6o8kkmsLjPNbtFm8KG46Ft8L0PVoyu+RVf
         ujbdG8KrmQLq6x+eR5ER9vsieGVfMaJvAMYftaEUWGITbq+vhP7hdn+tehxZFgEm2A/X
         JEdzn3LR+oFtv+Dkx1r95NJOdlRTX1miV3gpDMBOXZzAiTwJHcMrboug//SeBAeIErz2
         GLSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786471395; x=1787076195; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vjd/fAmD0D3XwcSyeIvZ8+6EDq9t9quZRoVQ7xFbSro=;
        b=hbHNHLnu+rlV6LdS5JNiMxaTJUPB+M1ilOtfsxcBq4svk93HmTNB3LL7/eGDHcBwVX
         5aflB+beJ2YGXRuoVrQyz3CdnmuedQ/87ELe79BoZJO3MPusWfHcgkgb/g98ATI8OUQw
         EuFT5YAG00gHNNbwv93nPUNgiE7nTHr2OPxLNroishhAFjSpE50fx/RwN+zXXooXbTAw
         9PXMa6XPWzspU75llP5uUOcPvwENfwctfqUCNvaQxn/+kl05/RsOVkoePnWY5ppNBvtM
         L/Jsl4XnbbnBh7xZUJBK2MG0LWoWodJPJO7c4SFvm+Herc5w8HNupNZKv4CvMZ+RGciD
         1SoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786471395; x=1787076195;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjd/fAmD0D3XwcSyeIvZ8+6EDq9t9quZRoVQ7xFbSro=;
        b=qNAkfm3odBU5RbG3Ua8B7dGVL9Ov2CxxlnCKSsXX6247VT0ltfLiP8I01JokbZ+lxz
         5OFsBqJwkcrvU/pjgXckEVZFOCMpYrhQayjp76bHlUQq/L/6rjz+AYCiQquYJ+BJ/QHR
         0NeqavBkm07bkAfemYsAkFz4ShezhVNeQ75rkrDK2jEIsKAuVUO+0TS+hsCNqbtVJ8GH
         IdPliHsWCVfsM8msfCPkNvtP9uLjdmR7l+BmJYisrPuI0sNGFsUlbN8qvq77tSN1Z+if
         myp/7CdHKa/ZKEWa8T/txhV23rPkMJiYSo8n74Zhd2TL7ZexJntyRWMdQxdSS460FC85
         +HGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5QXP4T8yhDCo3ez502D0TEtbwhQLSE6gpbcfVMAIBBG0lxfhMB9PY/B0/aq4nJiIrujsXX5+5Zi51JuY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKflujNzKpx7zsb8/yxiy0OMJ9HYBeuK9Wq48UbGplif/wfo8a
	nxAajJIrVr6xUVZG+KQ7B1WsxWjcUwIuwkduCXekqs/w5kzHd4hGM5xQhZJkN6fBpFhXGhg8FpU
	Hxu3+RiLW8WSIM/3ouIJV7QZC8hJgWAo=
X-Gm-Gg: AR+sD10XzxtV4lergsdfomdfD/kjnMFxAvg5hvmmK1BJZP+bJlpRqDKmUXMgDA7Le5i
	aWWekKcP4oeJDGiNqrdHtx0YAcYdnnJnYJ2NORYGLOSRkoD2LJeFOtsCQ8Fs0BYnllxiX/d8J8Q
	w30vTHZdiLdgklyHvUDoAg2nTPsxNbxxA2nz3/5Ej4wstRpVX1Kl080Jlf9Njinljs9cCz8zuVA
	k31QLnUhXL+N2W9R93Kj/hw5tFkaYghne29OP4ZDH/0VmkK0CnNVoHsUog/Dm+SMTLpE7qSRu4Z
	becOydK8HsowRO18wUExVi1NixX8S9PaWOyTVR59B2lksQQnmB8ZC5ZJwBPbnTaql5PkgPpUj17
	8gw==
X-Received: by 2002:a05:6512:39d3:b0:5ae:aeeb:e902 with SMTP id
 2adb3069b0e04-5b448610878mr788811e87.13.1786471395270; Tue, 11 Aug 2026
 11:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com> <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
 <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk> <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
In-Reply-To: <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
From: Matt Turner <mattst88@gmail.com>
Date: Tue, 11 Aug 2026 14:03:02 -0400
X-Gm-Features: AUfX_mxmnN3UxyDqTnGPQ9KikRs4pBRLxD5kBxPrAo3ScWOdRlFNN1zZtW9p0HA
Message-ID: <CAEdQ38HmrYhR2z1TjrWFOrv5gJoXYk0HCeUoPPZ7vvghnwLVUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
To: Magnus Lindholm <linmag7@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Magnus Lindholm <lindholm@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:55=E2=80=AFPM Magnus Lindholm <linmag7@gmail.com>=
 wrote:
>
> On Tue, Aug 11, 2026 at 1:10=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me=
.uk> wrote:
> >
> > On Mon, 3 Aug 2026, Magnus Lindholm wrote:
> >
> > > > diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
> > > > index 7631129ac914..5b4f1ae2b74b 100644
> > > > --- a/arch/alpha/kernel/traps.c
> > > > +++ b/arch/alpha/kernel/traps.c
> > > > @@ -925,7 +925,9 @@ void
> > > >  trap_init(void)
> > > >  {
> > > >         /* Tell PAL-code what global pointer we want in the kernel.=
  */
> > > > -       register unsigned long gptr __asm__("$29");
> > > > +       unsigned long gptr;
> > > > +
> > > > +       __asm__ volatile("mov $29, %0" : "=3Dr"(gptr));
> > > >         wrkgp(gptr);
> > > >
> > > >         wrent(entArith, 1);
> > >
> > > This looks good to me. The explicit $gp read and use of
> > > current_stack_pointer avoid relying on the unsupported local
> > > register-asm behavior.
> >
> >  It could have been worth mentioning in the change description that no
> > code quality regression results here with GCC:
> >
> > --- arch/alpha/kernel/traps-0.dump      2026-08-11 11:57:59.895247441 +=
0100
> > +++ arch/alpha/kernel/traps-1.dump      2026-08-11 11:56:31.788713285 +=
0100
> > @@ -2223,8 +2223,8 @@
> >                         1b70: GPDISP    .text+0x4
> >      1b74:      00 00 bd 23     lda     gp,0(gp)
> >      1b78:      f0 ff de 23     lda     sp,-16(sp)
> > -    1b7c:      10 04 fd 47     mov     gp,a0
> > -    1b80:      00 00 5e b7     stq     ra,0(sp)
> > +    1b7c:      00 00 5e b7     stq     ra,0(sp)
> > +    1b80:      10 04 fd 47     mov     gp,a0
> >      1b84:      37 00 00 00     call_pal        0x37
> >      1b88:      04 00 00 c2     br      a0,1b9c <trap_init+0x2c>
> >      1b8c:      08 00 1e a6     ldq     a0,8(sp)
> >
> >  Also I think our coding style would rather see the asm written as:
> >
> >         __asm__ __volatile__("mov $29, %0" : "=3Dr" (gptr));
> >
> >  Otherwise:
> >
> > Reviewed-by: Maciej W. Rozycki <macro@orcam.me.uk>
> >
> >   Maciej
>
> Hi Matt,
>
> Given Maciej's comment on the inline asm style, do you want to send a v2
> of this patch, or are you happy for me to fold the
>
> __asm__ volatile(...)
>
> to
>
> __asm__ __volatile__(...)
>
> style change in when I apply it to the Alpha tree?
>
> Either is fine with me.
>
> Thanks,
> Magnus

Hey Magnus,

Feel free to just fix it up when you apply it.

Thanks,
Matt
