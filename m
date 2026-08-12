Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F032C15A5;
	Wed, 12 Aug 2026 10:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532101; cv=none; b=tlxNOG66s8JJG2bZI94dntjm7S6YRMZjP4LptD8yGjDVB0AGuslIEZ1JWTOLZs0VLXTCddobmahGYQNItGkk9x2JI6AzSbg61LM7CsyCE8cMi9ha0LtYdruBKTtXb0RXegs3Rzv0pJhF+d6hXiCmu1tu8r0kBVY9Ske+TgGFsI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532101; c=relaxed/simple;
	bh=KmHwmxGlpyI7s0Rzvq4S9NgxmAOz2kbeW8b+0HsqmKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xm9j/93ti0AHwkdOaRzKFgsQN2B0KQ3nWdFoEqjzO+oxEgJm/eMo1oJFGQ1nLP6pDyMO6Z/jNG9pDmFJmW4MURcKLHhH4zj+hYf14vyezhj4Y3I7iIS4m14AHkO9GU7droO3+oFGXJ7u2cNQ0awTeO1fANWLbVR2Y60CNIrzjvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lt9u9YE5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lt9u9YE5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF6F1F000E9;
	Wed, 12 Aug 2026 10:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786532099;
	bh=uPRPM0oO7lPsSa7sbZJlY6Xn88MJbrqbLlIHa64uGDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lt9u9YE5gbZuh1Dl7uF+J880/nASXspS3X6PQ8PaNzAHE+Wf1ZS8PDUqSiRRb4te8
	 QUefXzabe5vzPZsmO188kcoZXU02AsZxTXpmcMfJMmDjhggXqNDDiPPbaH8jvg1gt5
	 5T5tBMrc93ZOJqc6pNiSG2Z7ZZjutBnqFlbUdqa0y1BXWxonKLp/xDm5vfxNjrcIxL
	 QD9l377prWUJTgShmNfjOMZs8LrZS3Tc+Y19X84nLCPfXXpAnHYf0P15DgT1epnpvO
	 xLfVThCFpla7alEKCDMdOVVi2/s1flPJJvMRRpRJEg/NLws/iubuoGv5LGug7NgsWe
	 nYIo2O+0H1HGQ==
Date: Wed, 12 Aug 2026 18:54:48 +0800
From: Gao Xiang <xiang@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Gao Xiang <xiang@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	SJ Park <sj@kernel.org>, Gao Xiang <hsiangkao@linux.alibaba.com>,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Chao Yu <chao@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	linux-kbuild <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v3] erofs: cap LZMA stream pool size
Message-ID: <anxQ-DohuQvuKwAH@XiangdeMacBook-Pro.local>
Mail-Followup-To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Gao Xiang <xiang@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Michael Bommarito <michael.bommarito@gmail.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	SJ Park <sj@kernel.org>, Gao Xiang <hsiangkao@linux.alibaba.com>,
	Yue Hu <zbestahu@gmail.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Chao Yu <chao@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	linux-kbuild <linux-kbuild@vger.kernel.org>
References: <amhMsk5Z6P0IA8sr@XiangdeMacBook-Pro.local>
 <20260728065447.91511-1-sj@kernel.org>
 <CAMuHMdWq1eutRM4u1Q3r50f8W4oSejo_XAgyjEKuwi4Lw6K7jQ@mail.gmail.com>
 <anBYnPELPotUiNjv@monoceros>
 <CAMuHMdXUyAX0TV0Sq9_YxvipzkVOBX=4s_r5mVQcZ_7nL=-AQw@mail.gmail.com>
 <87853c96-cc8f-49e6-81b1-02bfe409e372@roeck-us.net>
 <CAJJ9bXyC=piPamaGJN=VMA72Ws+WqgJbYZgTj_w6NFzyLa_mMg@mail.gmail.com>
 <anuyFHLUGDjZWY4K@XiangdeMacBook-Pro.local>
 <CAMuHMdWQLwgShMK7G-6soiZxtRPYWLizBLRdouwxFUcFXUJM-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWQLwgShMK7G-6soiZxtRPYWLizBLRdouwxFUcFXUJM-Q@mail.gmail.com>

Hi Geert,

On Wed, Aug 12, 2026 at 11:30:14AM +0200, Geert Uytterhoeven wrote:
> Hi Gao,
> 
> On Wed, 12 Aug 2026 at 01:37, Gao Xiang <xiang@kernel.org> wrote:
> > On Tue, Aug 11, 2026 at 03:37:38PM -0400, Michael Bommarito wrote:
> > > On Tue, Aug 11, 2026 at 3:35 PM Guenter Roeck <linux@roeck-us.net> wrote:
> > > > > Any progress with fixing this for v7.2?
> > >
> > > I would like to fix this since I started the problem with the original
> > > patch, but I feel a bit stuck.  My v1 and v2 patches would not have
> > > triggered the build failure, but Gao made valid points about the
> > > trade-offs that led us to this v3.  Maybe it would be worth your
> > > opinion on the config approach in those earlier patches?
> >
> > Sorry about the late reply.
> >
> > As I said, I really dislike hardcoded range, but it is an issue that no
> > NR_CPUS definition on CONFIG_SMP:
> >
> > I wonder if the following diff resolves the m68k issue (I'm not an
> > Kconfig expert but it seems to work on x86_64 !CONFIG_SMP):
> >
> > diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
> > index 8ca1767dafb6..2dfc313588d2 100644
> > --- a/fs/erofs/Kconfig
> > +++ b/fs/erofs/Kconfig
> > @@ -134,7 +134,8 @@ config EROFS_FS_ZIP_LZMA
> >  config EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS
> >         int "EROFS LZMA default maximum decompression streams"
> >         depends on EROFS_FS_ZIP_LZMA
> > -       range 1 NR_CPUS
> > +       range 1 NR_CPUS if SMP
> > +       range 1 1 if !SMP
> >         default 16
> >         help
> >           By default EROFS allocates one LZMA decompression stream per CPU.
> 
> Thank you, that seems to work (despite still seeing the warning on m68k,
> as NR_CPUS does not exist).
> 

...

> 
>       $ make ARCH=m68k allmodconfig
>      fs/erofs/Kconfig:137:warning: range is invalid
> 
>  Warning...
>

Yes, other arches shouldn't have the warning because I think other
arches (including microblaze) defines NR_CPUS in Kconfig, except m68k.

The following diff can eliminate the m68k warning above, I think m68k
folks could consider this way if you really don't want to define an
explicit NR_CPUS.  Anyway, I think it should go with another patch:

```
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 11835eb59d94..90499f126c73 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -44,6 +44,9 @@ config M68K
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA
 
+config NR_CPUS
+	int
+
 config CPU_BIG_ENDIAN
 	def_bool y
```

I will try to form a formal patch (with the diff in the previous reply)
directly to Linus (since I don't have other urgent patches for
Linux 7.2.)

Thanks,
Gao Xiang 
