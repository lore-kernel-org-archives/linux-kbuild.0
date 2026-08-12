Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE15412BFA
	for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 09:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527384; cv=none; b=DmGo0WTM5+Ye6JCMVL9rZGkayLp86AEjEfk9ECpLwT3pr0jNJGINkCRdeIK5QwCswKcJLYWyMIieMNrFxyZo2ZPEU3cHGoqNN4/x7w6f4zpNBxeccWVj6rvm+mz4fMGgm+T9Ccx4BSj2fC7fwpaycv/r2EzjCP4iZy4Y0L7iNic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527384; c=relaxed/simple;
	bh=mb1vwLfGnoz/AiE/5mRjeVCRWWyUDyrnEFQJJPGmlE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fMXZv1dkPZK6aVHoDcDpOMbxvJcxrTn8aJwLom8S71oqahhP+ipgm5SmTgPg+801V5GkCkGBGl1UMFc4q6KhR5ULXjLzCDwLKTtorfhjwXtY0vB8VpTEvh+mdoNtErGmF+ijauEcAYQDqsuAOONxo7WUMiTRlOTjvRox8tgEVe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e5d6f35c1so73007385a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 02:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786527380; x=1787132180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsKpew/NpbmRwJwh6JVQkfOwogDxzHNyZba/zwHTTH0=;
        b=V7QkL7q0hu2rkmr0xuSIDzKFq1LNT9pe4KyyWHU4SscSTrTMLN1V+CkLKyyT2yV3o8
         43VJHCNowNatHD6HKAsxiaLWEFo9rBJBD+wjaoxUgxZWJaUvubFqGBzEEx3ejShMOup0
         plOnavmm6+BDKyPk3TqT3jhyq+H58jLWk3+CSqk7eq51G0Z42Se8lsL5mNKvdpGK+n3F
         Yq28ofJSzqeY61sxqfkYw6qegbu4lWTbNAqjLK+TgDj0QgIfYJ6AbntEIEC5EXmT+X8N
         X43lRJHVUysnBTGS9es30U7sStgi4Vnvq12rC7fGC8cVh9HC826oIpz+ultjUFBPbgm6
         /E7g==
X-Forwarded-Encrypted: i=1; AHgh+RoqvfJIeOhMuh8wh9AUxRKtfPyEna4nzop8j4fn7NxpKDAzjK6LKFHa24SeT2KdsIr0wtiWsVCVtnK7gCI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaRwUUeQrSV1JB2IK7QWknkGxp0Qo9Rlruizu2/u+NhR5XzF//
	8URcuI3qgxPKeqoOw0GCNTnVDzEJRWuFAVJcwMV4AnlZymgTlCqJx+3cJyJ6DO5I
X-Gm-Gg: AR+sD10+wR7Grd872oMkn9hrEzkRMvnlvzUYqvSH0H0w81P6w2FmRjH0WBKACd8aaVm
	3zAWQ0ifMhDmt8WjHgnbT8uZt6KtVGDH+yGHtGkq9zKCaUzo7zfX2zYFhdEpl6JNq9nHcSfbYLC
	7IwEsgvV+xKp090oGVRMhwh7LLuJVLiPmHfHsvVIOpHybINCNwScMfmOkD1oMxihwjL9vh1SkYc
	1chn0qg/TRRFn0mlRPBeYtXMFt7te8diT8OTWjR5/sHTvaI9IgLQFI2QOFN/h748j3EM8rAN3Ea
	MjE8DuDgzC1tOXOb/4DRiAVZUeN4/XWZ0TD1uUO1YmLiOrHq8DdB3VTumnbLfm1KA26OiBlQmKE
	g5nSMDTE5kiwjvvBITNRs1Z4p6zIXA/Ww71wo+Cfefjfc86xv5cxyV2B9LwUT3jDaE1nO/rFTTR
	aXxM4BUMvgoAp8kffECo1lSBOFvUDy8ZkLjn8cRurnnPfRvJbaTI0U27a9sNTXa/8EitHBQi9Bp
	aR4UkD10yJhlXucJPr/wkAG0lCr+w==
X-Received: by 2002:a05:620a:4506:b0:92e:46cd:72a0 with SMTP id af79cd13be357-936b3a42011mr264929485a.6.1786527379509;
        Wed, 12 Aug 2026 02:36:19 -0700 (PDT)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com. [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-936b5f17eb3sm88929885a.23.2026.08.12.02.36.19
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 02:36:19 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-92e5d6f35c1so73006185a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Aug 2026 02:36:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpon7lX0z1pYofNhJVCIljOfF9ccMXRieQbwHB412SPZBydwBDVN5Rz0V2Deqmc6yfq+dit0yFiH3Dop2Y=@vger.kernel.org
X-Received: by 2002:a05:6102:3c87:b0:737:f0ba:508f with SMTP id
 ada2fe7eead31-76c87872117mr743103137.3.1786527025984; Wed, 12 Aug 2026
 02:30:25 -0700 (PDT)
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
 <anuyFHLUGDjZWY4K@XiangdeMacBook-Pro.local>
In-Reply-To: <anuyFHLUGDjZWY4K@XiangdeMacBook-Pro.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Aug 2026 11:30:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWQLwgShMK7G-6soiZxtRPYWLizBLRdouwxFUcFXUJM-Q@mail.gmail.com>
X-Gm-Features: AUfX_mxA9clRzUNdd2GP67STTBu3d3CfSgby0ufuk5IkGAlxaBZE-BZi7BRVSMc
Message-ID: <CAMuHMdWQLwgShMK7G-6soiZxtRPYWLizBLRdouwxFUcFXUJM-Q@mail.gmail.com>
Subject: Re: [PATCH v3] erofs: cap LZMA stream pool size
To: Gao Xiang <xiang@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Michael Bommarito <michael.bommarito@gmail.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	SJ Park <sj@kernel.org>, Gao Xiang <hsiangkao@linux.alibaba.com>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>, 
	Chunhai Guo <guochunhai@vivo.com>, linux-erofs@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Chao Yu <chao@kernel.org>, 
	David Hildenbrand <david@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gao,

On Wed, 12 Aug 2026 at 01:37, Gao Xiang <xiang@kernel.org> wrote:
> On Tue, Aug 11, 2026 at 03:37:38PM -0400, Michael Bommarito wrote:
> > On Tue, Aug 11, 2026 at 3:35=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> > > > Any progress with fixing this for v7.2?
> >
> > I would like to fix this since I started the problem with the original
> > patch, but I feel a bit stuck.  My v1 and v2 patches would not have
> > triggered the build failure, but Gao made valid points about the
> > trade-offs that led us to this v3.  Maybe it would be worth your
> > opinion on the config approach in those earlier patches?
>
> Sorry about the late reply.
>
> As I said, I really dislike hardcoded range, but it is an issue that no
> NR_CPUS definition on CONFIG_SMP:
>
> I wonder if the following diff resolves the m68k issue (I'm not an
> Kconfig expert but it seems to work on x86_64 !CONFIG_SMP):
>
> diff --git a/fs/erofs/Kconfig b/fs/erofs/Kconfig
> index 8ca1767dafb6..2dfc313588d2 100644
> --- a/fs/erofs/Kconfig
> +++ b/fs/erofs/Kconfig
> @@ -134,7 +134,8 @@ config EROFS_FS_ZIP_LZMA
>  config EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS
>         int "EROFS LZMA default maximum decompression streams"
>         depends on EROFS_FS_ZIP_LZMA
> -       range 1 NR_CPUS
> +       range 1 NR_CPUS if SMP
> +       range 1 1 if !SMP
>         default 16
>         help
>           By default EROFS allocates one LZMA decompression stream per CP=
U.

Thank you, that seems to work (despite still seeing the warning on m68k,
as NR_CPUS does not exist).

Test runs on ARM (NR_CPUS depends on SMP, like most architectures), m68k
(no CONFIG_NR_CPUS), and x86 (NR_CPUS is always defined) before/after:

     $ make ARCH=3Darm allmodconfig
     $ grep CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS .config
     CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D4

 SMP is OK.

     $ sed -i "/CONFIG_SMP=3Dy/d" .config
     $ yes "" | make ARCH=3Darm oldconfig
-
-No warning...
-
     $ grep CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS .config
-    CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D0
+    CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D1

-... but automatic configuration is silently broken on UP.
+UP is OK with automatic configuration.

     $ sed -i "/CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS.*/d" .config
     $ yes "" | make ARCH=3Darm oldconfig
-            EROFS LZMA default maximum decompression streams
(EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS) [0] (NEW)
-    [infinite loop]
+    $ grep CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS .config
+    CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D1

-Manual configuration is broken.
+UP is OK with manual configuration.

 --------------------------------------------------------------------------=
------

      $ make ARCH=3Dm68k allmodconfig
     fs/erofs/Kconfig:137:warning: range is invalid

 Warning...

     $ grep CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS .config
-    CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3DNR_CPUS
-
-... but this will actually build and work, as <linux/threads.h> has:
-
-    #ifndef CONFIG_NR_CPUS
-    /* FIXME: This should be fixed in the arch's Kconfig */
-    #define CONFIG_NR_CPUS  1
-    #endif
-
-    /* Places which use this should consider cpumask_var_t. */
-    #define NR_CPUS         CONFIG_NR_CPUS
+    CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D1
+
+... but UP is OK with automatic configuration.

     $ sed -i "/CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS.*/d" .config
     $ yes "" | make ARCH=3Dm68k oldconfig
-            EROFS LZMA default maximum decompression streams
(EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS) [NR_CPUS] (NEW)
-    [infinite loop]
+    fs/erofs/Kconfig:137:warning: range is invalid
+
+Warning...
+
+    $ grep CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS .config
+    CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D1

-Manual configuration is broken.
+... but UP is OK with manual configuration.

 --------------------------------------------------------------------------=
------

     $ make ARCH=3Dx86 allmodconfig
     $ grep CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS .config
     CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D16

 SMP is OK.

     $ sed -i "/CONFIG_SMP=3Dy/d" .config
     $ yes "" | make ARCH=3Dx86 oldconfig
     $ grep CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS .config
     CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D1

 UP is OK with automatic configuration.

     $ sed -i "/CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS.*/d" .config
     $ yes "" | make ARCH=3Dx86 oldconfig
     $ grep CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS .config
     CONFIG_EROFS_FS_ZIP_LZMA_DEFAULT_MAX_STREAMS=3D1

 UP is OK with manual configuration.

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
