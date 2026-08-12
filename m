Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8CE2BB13
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 11:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786534145; cv=none; b=t6OBOVyQvNDsY+tUfO2Xxhy69ApnW+q/zMR/WiQKEwW5eWqhcofJvrSGYIEA/XwkvFWiuRudmg6FJ0YnEJUAyENJty0uB5qA3asFpA0uPF6skXkJ0hQc48r0H7ErMGTVOC96QxqgUkMWXvGwJT4xVUvmJbAMFYx/dxwVKuzFqKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786534145; c=relaxed/simple;
	bh=hsL8A3n+NvkrEiglC9FfZT8YyeQqzHbplzq/3fvfKCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=m5SK6RPR9/q62ilos/Wa9WKlsVAvNdFSEeshqdaYYiLMuaWBxMSXLt8avKJdwuwIummvNBt3Gkt+v5NSvSGHgsn0QXwuE2XPJs0BXWRj86ile3Yx8PsrWZT96Y9UQO0kJj6Pdvz+0QPP5WBlBiRhQhFskdYcYtSL5tR1ZWeJgnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9673385b1efso248400241.2
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 04:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786534142; x=1787138942;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rSvx/0jGZMH3RxNpi80otjZ2OhjJJMdYcHXZd9f4cQ=;
        b=EqWMKHgavdtjKygsptp8CWL+LCcj9VsSgtdrHeOjTO9m9crcO+XnAmQI45wMFkyGl1
         X1Uf6g2Y23g3SFoaU/QjtD8RYnIUx37JpEUH3ecjhFuqUoWKOdQeKKcIrJn39tdtQWhY
         aRXGxSR3pbckXf4A+y+J04uAx+Xcnqhc61kUlHDsEIdMkHjMCC+s7w8GOWLfbdJ6uMQ4
         qWzeIoL0peu9ZAKzuJnNcwZMW0eC1RSfZvKAhkqs4j5C4y/GkC8rIm2r2MvlnY5olqIm
         R1pfEqZT1ntlG/0HQqPSy8+QTq3CUs2Uv5oRTnUDUA+2QmMGnp+6mcj90AUKmmOxkvgg
         sVrA==
X-Forwarded-Encrypted: i=1; AHgh+RqgOTCP7+PhUD+USXc9aGnCs7sl9sYb2HDQEimrpDMhFhNpigbcLjEA3gsdRxwQyyyz1m/l3fsV7/jH4Ys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1AflM6Eu4HvPYJUI44v+4cIFkCErpYjxol8Ig77iBktRwlqhd
	sm5Wb+g9npU2poGiym5gKHpN/ePjoFzo+vTP87CWm0KX4dUsT5NcKsAjmi/agBe6
X-Gm-Gg: AR+sD10zGgOGCrfKno6pUk4r+2eIsGM1mUUdfF7Mi2aXKu71p5/7UheooQylU3g7f9g
	/AjGLXngOUo7JtvVsNyMImt6WRSkIdUnWWZh3Aqv5SlL3UnZl0GkArI0QqO2t9daVCOKFrwenRT
	5gO5J5wKFr9J6TPJPxHL36ANC2zHuQwsNsD3EolAMVS2Wv0Pt3AFJt0oBPJBYQbmcJEvri9Vz6x
	JeO5vAn3w/KigczHFu8id9AKTqcRDZU1D6N9xvMxpEv1qzNHIl8n9rbkn5cCJhhJO489ViHlx3k
	LZvar2o/TMdTlUxVvJ8IDkIMSYm/UjxEIqPMvdNkC9RJuxClxFDb89v7VmtIEvFYvQTguGd/Vh8
	dIFkmxvyOi3E+xLtWXMTDA1nP7dhuMfWbyBMrM14pYtqxlp5wl1X2MMf/76qErPn+egyZcRjUdF
	lhCvrCpnVV1wLMi8cyrrFQ7pq09QjzzYodx1pXb242YOicUzmZ+VN8/r0wepf4kAYmqLsCrDIwZ
	HSuVeJNmkfGDPcCcoviFgyPRw==
X-Received: by 2002:a05:6102:1481:b0:738:d6c:7104 with SMTP id ada2fe7eead31-76c83c1b82cmr863322137.0.1786534142374;
        Wed, 12 Aug 2026 04:29:02 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97a3c28e739sm1526124241.9.2026.08.12.04.29.00
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:29:00 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-96944741eaeso288613241.1
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 04:29:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrakyBmZGrLXOrAoKf+GxoAtTZi1um9SP13B941W08yy2hebNImLNHslozdt1N9PpCs3LeA93GhUoqfacs=@vger.kernel.org
X-Received: by 2002:a05:6102:5696:b0:631:28c1:154c with SMTP id
 ada2fe7eead31-76c89774158mr780549137.9.1786534139804; Wed, 12 Aug 2026
 04:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amhMsk5Z6P0IA8sr@XiangdeMacBook-Pro.local> <20260728065447.91511-1-sj@kernel.org>
 <CAMuHMdWq1eutRM4u1Q3r50f8W4oSejo_XAgyjEKuwi4Lw6K7jQ@mail.gmail.com>
 <anBYnPELPotUiNjv@monoceros> <CAMuHMdXUyAX0TV0Sq9_YxvipzkVOBX=4s_r5mVQcZ_7nL=-AQw@mail.gmail.com>
 <87853c96-cc8f-49e6-81b1-02bfe409e372@roeck-us.net> <CAJJ9bXyC=piPamaGJN=VMA72Ws+WqgJbYZgTj_w6NFzyLa_mMg@mail.gmail.com>
 <anuyFHLUGDjZWY4K@XiangdeMacBook-Pro.local> <CAMuHMdWQLwgShMK7G-6soiZxtRPYWLizBLRdouwxFUcFXUJM-Q@mail.gmail.com>
 <anxQ-DohuQvuKwAH@XiangdeMacBook-Pro.local>
In-Reply-To: <anxQ-DohuQvuKwAH@XiangdeMacBook-Pro.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 13:28:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUO8_BY514PhSXeEPABCoeaJcEk1TimzxvtwPz6zFA5nw@mail.gmail.com>
X-Gm-Features: AUfX_my5HHpFn4yhw-8fesR7FW3YNOyOr1ipPx-sXs7eTkazDvmu8WeCPMYJpY4
Message-ID: <CAMuHMdUO8_BY514PhSXeEPABCoeaJcEk1TimzxvtwPz6zFA5nw@mail.gmail.com>
Subject: Re: [PATCH v3] erofs: cap LZMA stream pool size
To: Geert Uytterhoeven <geert@linux-m68k.org>, Gao Xiang <xiang@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Michael Bommarito <michael.bommarito@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	SJ Park <sj@kernel.org>, Gao Xiang <hsiangkao@linux.alibaba.com>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Chao Yu <chao@kernel.org>, 
	David Hildenbrand <david@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gao,

On Wed, 12 Aug 2026 at 12:55, Gao Xiang <xiang@kernel.org> wrote:
>
> Hi Geert,
>
> On Wed, Aug 12, 2026 at 11:30:14AM +0200, Geert Uytterhoeven wrote:
> > Hi Gao,
> >
> > On Wed, 12 Aug 2026 at 01:37, Gao Xiang <xiang@kernel.org> wrote:
> > > On Tue, Aug 11, 2026 at 03:37:38PM -0400, Michael Bommarito wrote:
> > > > On Tue, Aug 11, 2026 at 3:35=E2=80=AFPM Guenter Roeck <linux@roeck-=
us.net> wrote:
> > > > > > Any progress with fixing this for v7.2?
> > > >
> > > > I would like to fix this since I started the problem with the origi=
nal
> > > > patch, but I feel a bit stuck.  My v1 and v2 patches would not have
> > > > triggered the build failure, but Gao made valid points about the
> > > > trade-offs that led us to this v3.  Maybe it would be worth your
> > > > opinion on the config approach in those earlier patches?
> > >
> > > Sorry about the late reply.
> > >
> > > As I said, I really dislike hardcoded range, but it is an issue that =
no
> > > NR_CPUS definition on CONFIG_SMP:
> > >
> > > I wonder if the following diff resolves the m68k issue (I'm not an
> > > Kconfig expert but it seems to work on x86_64 !CONFIG_SMP):
> > >
> > > diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
> > > index 8ca1767dafb6..2dfc313588d2 100644
> > > --- a/fs/erofs/Kconfig
> > > +++ b/fs/erofs/Kconfig
> > > @@ -134,7 +134,8 @@ config EROFS_FS_ZIP_LZMA
> > >  config EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS
> > >         int "EROFS LZMA default maximum decompression streams"
> > >         depends on EROFS_FS_ZIP_LZMA
> > > -       range 1 NR_CPUS
> > > +       range 1 NR_CPUS if SMP
> > > +       range 1 1 if !SMP
> > >         default 16
> > >         help
> > >           By default EROFS allocates one LZMA decompression stream pe=
r CPU.
> >
> > Thank you, that seems to work (despite still seeing the warning on m68k=
,
> > as NR_CPUS does not exist).
> >
>
> ...
>
> >
> >       $ make ARCH=3Dm68k allmodconfig
> >      fs/erofs/Kconfig:137:warning: range is invalid
> >
> >  Warning...
> >
>
> Yes, other arches shouldn't have the warning because I think other
> arches (including microblaze) defines NR_CPUS in Kconfig, except m68k.
>
> The following diff can eliminate the m68k warning above, I think m68k
> folks could consider this way if you really don't want to define an
> explicit NR_CPUS.  Anyway, I think it should go with another patch:
>
> ```
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index 11835eb59d94..90499f126c73 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -44,6 +44,9 @@ config M68K
>         select UACCESS_MEMCPY if !MMU
>         select ZONE_DMA
>
> +config NR_CPUS
> +       int
> +

Let's bite the issue on m68k for good, I'll take Uwe's patch for v7.2
https://lore.kernel.org/all/20260731094950.1988084-2-ukleinek@kernel.org

>  config CPU_BIG_ENDIAN
>         def_bool y
> ```
>
> I will try to form a formal patch (with the diff in the previous reply)
> directly to Linus (since I don't have other urgent patches for
> Linux 7.2.)

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
