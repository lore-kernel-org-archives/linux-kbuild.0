Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626822E7165
	for <linux-kbuild@vger.kernel.org>; Sat, 15 Aug 2026 11:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786794135; cv=none; b=lMgUie8CI5yipWUeJTnXhqqjUDag5Kcr9TQIAUNEJbNlXvXS0XvqRD5Zxaga8uB4Rb1OR139Uwsx5yyHWuu4TBcSNdVlUJqJHmT8DqaqcBgoqVJsgL1Ogfrcf8b3mu3iTiqGapov5K0W5srpEuJG+O1vOeD0o+Jmyw3fs2/kxq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786794135; c=relaxed/simple;
	bh=tHU8Rlr4iOW0rlT/rGA/8wES3UzsRgSJZGA0S+z80p0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJcM2heOstV4K0aghOYpHe7EiWm2GjfvppnWOzaS8XAAm+186gtZN2wTU/6JwSAg6m/ZBEzec65NCSpcg0MeBXHm+KZHs09MeudXIZD+kqeb26djunjBlfLusx86Et/PC7hIQlTgYdq+Myw+T1YbzgKWZ/yNPhptm7whQjxrlC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c2c96286f0so687396e0c.3
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Aug 2026 04:42:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786794132; x=1787398932;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0rUTv5K3p3pcfp6FAure4QlzpyDmPoMH+895UYcj4JI=;
        b=h3/Pg7RlpVE1/f3xHxjpSw7YQ1mqUwnBhNEoAPwST8BTZp9zs0p0qPnZycub8dnn+n
         1AkFsqFwDcnV6p95StvCStfltU2s6KqlwEtc2zVOQZfigbVzzqb/Z0CoxnVO2x/Kjqsv
         38UyD2D3U/iS7nBTE3VAaFEgnl8ib5pWorzszAE8BrwZ8fBvQ/X1kdWOn4vKlHsZ4X5F
         FK1JWKCXKx8/hG4iYfz3j8pYyB6RkLYhnu8EO7BdHoRUWS2hq6JhH6ZRqaQNvIAtghxe
         7W19+r0ElF5hubvhOgFbz4zbIoOT5chAS1fm0l4ygtgrIJD/Q+R1FlJD0aOLkGufDnR9
         T6TQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCsnxrIe2inDweo+tjIEhzI7PlGObT8js+7V/DbSbpFt6rcsfaCigLtcEobJSO2tG3S40LyHODk20170k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+B61L/AZYZmhBpl08mDv9H1gGX6FBqdCqjWeET/y5BnB3yOll
	JW4v3w+F8cety5ze6mnC6KfFVWoMEuZ/bAAfXSjmfmm63wPxC+Ndwa4TuxH50wjLHhE=
X-Gm-Gg: AR+sD120h/mFyw9fYktAtcMMw5Hvpn3feuNVfVO7Difaq/IBuJeZvtjq4Q/JLM9f7FX
	9eo8eQsHQ4RarD95Ev4MxWAJGnfQwbzU4m4qgy1/C++bDSobQsHF3it8bZStGfv5wxGPt8sBdXk
	U+8bcBuUkprT9m8CWmi7dWa4sxC3SE+oYdEbwIyv19NnkR6pE8efMchggUPYn2ey7SYqggB1h8M
	uRSbc7w5T5jkitTSIBjCI6IawRu1pbqKTozDB/C/ZAlDf6yx7fulQZHoUSEMlQ9EcN+3Ap8TbOq
	jAsgSXjfS2TgfBA+CoqojNER2CoDz8z7t8mH8O65Q6gMrl8/gFmV8cPfACGXVpzAb+xJfz0n91z
	zNpLXXLYXusG37frYTfuSrSA+e3z5Gz7D2ONxk1drX6o0/exBKhJ0s0s9qwtg/Cldi9KvQflXCO
	7Y3noC5h0LvGtDBoJgbJBmHDCgPnTyNE/dTlVLD5gcIjz18/sZe3lJrZLdyWuU9gwGgG4kL8i+4
	HgyuZaIR77DcR54w7c8nmFxkg==
X-Received: by 2002:a05:6122:884:b0:5c5:732c:f4f5 with SMTP id 71dfb90a1353d-5c591d69d69mr2224126e0c.8.1786794132209;
        Sat, 15 Aug 2026 04:42:12 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97bfbdae5e9sm2015667241.11.2026.08.15.04.42.10
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Aug 2026 04:42:10 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-9770fffa5a6so426961241.3
        for <linux-kbuild@vger.kernel.org>; Sat, 15 Aug 2026 04:42:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqN04t87mretaOL9i6xTL5lGFXbDMIV12O3wR8s8qugnWfKCau/p/qjt+7foH4rnB/0egzDgbD/4cZI3wY=@vger.kernel.org
X-Received: by 2002:a05:6102:850e:10b0:770:63a1:b26f with SMTP id
 ada2fe7eead31-77063a1b71dmr649108137.10.1786794130006; Sat, 15 Aug 2026
 04:42:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728065447.91511-1-sj@kernel.org> <CAMuHMdWq1eutRM4u1Q3r50f8W4oSejo_XAgyjEKuwi4Lw6K7jQ@mail.gmail.com>
 <anBYnPELPotUiNjv@monoceros> <CAMuHMdXUyAX0TV0Sq9_YxvipzkVOBX=4s_r5mVQcZ_7nL=-AQw@mail.gmail.com>
 <87853c96-cc8f-49e6-81b1-02bfe409e372@roeck-us.net> <CAJJ9bXyC=piPamaGJN=VMA72Ws+WqgJbYZgTj_w6NFzyLa_mMg@mail.gmail.com>
 <anuyFHLUGDjZWY4K@XiangdeMacBook-Pro.local> <CAMuHMdWQLwgShMK7G-6soiZxtRPYWLizBLRdouwxFUcFXUJM-Q@mail.gmail.com>
 <anxQ-DohuQvuKwAH@XiangdeMacBook-Pro.local> <5825b5c2-06b3-4358-91b0-d7bf437528a3@roeck-us.net>
 <an9d0zxE5J8txxf6@XiangdeMacBook-Pro.local> <1638f2a8-d9cd-423d-83f6-2b436e3c9de0@roeck-us.net>
In-Reply-To: <1638f2a8-d9cd-423d-83f6-2b436e3c9de0@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 15 Aug 2026 13:41:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpJY3gqx98z92=P8NxV2_-_N+5OVqNvMLDMKq9bhuY+Q@mail.gmail.com>
X-Gm-Features: AcwNN1WYoN-n_CAfH-GW_Zs3A4lf_FFUASxx_a7f-R_6u7A4lR5RgAtY2rsqH94
Message-ID: <CAMuHMdXpJY3gqx98z92=P8NxV2_-_N+5OVqNvMLDMKq9bhuY+Q@mail.gmail.com>
Subject: Re: [PATCH v3] erofs: cap LZMA stream pool size
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gao Xiang <xiang@kernel.org>, Michael Bommarito <michael.bommarito@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	SJ Park <sj@kernel.org>, Gao Xiang <hsiangkao@linux.alibaba.com>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Chao Yu <chao@kernel.org>, 
	David Hildenbrand <david@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi G=C3=BCnter,

On Fri, 14 Aug 2026 at 20:44, Guenter Roeck <linux@roeck-us.net> wrote:
> On 8/14/26 11:26, Gao Xiang wrote:
> > On Wed, Aug 12, 2026 at 07:25:50AM -0700, Guenter Roeck wrote:
> >>>> Thank you, that seems to work (despite still seeing the warning on m=
68k,
> >>>> as NR_CPUS does not exist).
> >>>>
> >>>>         $ make ARCH=3Dm68k allmodconfig
> >>>>        fs/erofs/Kconfig:137:warning: range is invalid
> >>>>
> >>>>    Warning...
> >>>
> >>> Yes, other arches shouldn't have the warning because I think other
> >>> arches (including microblaze) defines NR_CPUS in Kconfig, except m68k=
.
> >>
> >> That is not entirely true. openrisc only has it if SMP=3Dy. But it sti=
ll
> >> does not generate the warning for some reason.
> >
> > I looked into the documentation a bit
> > (https://docs.kernel.org/kbuild/kconfig-language.html), especially the
> > following parts:
> >
> >   - type definition: =E2=80=9Cbool=E2=80=9D/=E2=80=9Dtristate=E2=80=9D/=
=E2=80=9Dstring=E2=80=9D/=E2=80=9Dhex=E2=80=9D/=E2=80=9Dint=E2=80=9D ...
> >   - input prompt: =E2=80=9Cprompt=E2=80=9D <prompt> [=E2=80=9Cif=E2=80=
=9D <expr>] ...
> >       and "If a prompt is not present, the config option is
> >            a non-visible symbol, ..."
> >
> >   - dependencies: =E2=80=9Cdepends on=E2=80=9D <expr> [=E2=80=9Cif=E2=
=80=9D <expr>] ...
> >   - Menu dependencies ..
> >
> > and I think that is true, taking openrisc for example:
> >
> > config NR_CPUS
> >          int "Maximum number of CPUs (2-32)"
> >          range 2 32
> >          depends on SMP
> >          default "2"
> >
> > which can be transformed into
> >
> > config NR_CPUS
> >          int
> >       prompt "Maximum number of CPUs (2-32)"
> >       range 2 32
> >       depends on SMP
> >          default "2"
> >
> > which can be then transformed into
> >
> > config NR_CPUS
> >          int
> >       prompt "Maximum number of CPUs (2-32)" if SMP
> >       range 2 32 if SMP
> >          default "2" if SMP
> >
> > so if `SMP=3Dn`, it's equivalent to
> >
> > config NR_CPUS
> >          int
> >
> > so NR_CPUS symbol is still there I think (and its value is 0.)
> >
> $ grep NR_CPUS .config
> CONFIG_FORCE_NR_CPUS=3Dy
> $ grep EROFS .config
> CONFIG_EROFS_FS=3Dy
> # CONFIG_EROFS_FS_DEBUG is not set
> CONFIG_EROFS_FS_XATTR=3Dy
> CONFIG_EROFS_FS_POSIX_ACL=3Dy
> CONFIG_EROFS_FS_SECURITY=3Dy
> CONFIG_EROFS_FS_BACKED_BY_FILE=3Dy
> CONFIG_EROFS_FS_ZIP=3Dy
> CONFIG_EROFS_FS_ZIP_LZMA=3Dy
> CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D0
> # CONFIG_EROFS_FS_ZIP_DEFLATE is not set
> # CONFIG_EROFS_FS_ZIP_ZSTD is not set
> # CONFIG_EROFS_FS_ZIP_ACCEL is not set
> # CONFIG_EROFS_FS_PCPU_KTHREAD is not set
> # CONFIG_EROFS_FS_PAGE_CACHE_SHARE is not set
>
> The symbol may be there internally, but it does not show up in .config.

    config EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS
    ...
    range 1 NR_CPUS

Apparently the default value picked by "automatic" configs like
allmodconfig and defconfig is the last item from the range.
If NR_CPUS exists internally (e.g. openrisc and arm), you end up with
the "undefined value", aka zero:

    CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D0

As NR_CPUS did not exist on m68k at all, you ended up with the NR_CPUS
literal:

    CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3DNR_CPUS

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
