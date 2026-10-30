Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372842;
	b=TAGiC4rfw5mFOqp5WaqM5eT5uY2z3tDsK/aVkgyQGjaFGcQD6hKROi1NKcKwkjlUJU1T
	 0YbKaGj2IPnImOOBHMAeMcN221OE0dlZycHvJlBDZ5W9x8z63ldAUW3szWv0o8/Pe5Cwv
	 HTLkIKJ5yOVJajqV0A9WzMuOI9OU+KXmgy4xM+haTeR0YHeg5NqiP72pFyXq/8yM8421n
	 aWnocpHC5XcEG/hFOIJBk0YAdDrbIGUocayNs1YOMHQSSaKegIvzp7hIgsDi3WXGkALLX
	 38gW4qZXSiZQroSu3UjNp3nUigeu/6gFnMBqxxHLDgxRPh/WNGUHGqaH0j23N3DEZPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=YNL5gTzoS0SNcKXI362OG6Cyagd0/f8y/Be+hIpJbPg=;
	b=ImWDprRePNiDG9QG3yQ13v97caW/VjeFzDZrtE6VfkXyz2iXsm2v1UMo3EThJhaUwF6M
	 3z+2fuQHnj/ABAX1qa5UzI/09kp4yp1li/A40PZ+a51DDQB/Lwrf5QcaREt6LtSpEsEJ7
	 Ttgq0wh7U+rjLB5Yfbnale0nv31jGSUUYeMZSEDIPCo/t4D7qgWzo2A0xqalMr+J/dhDI
	 cjGNdu8Wfp/nPDu17lwy1lChMN+ppB4RoF/JVCR5aXWm+mopCvBB3M6NByjghqcMqUAtG
	 fPPTuslTTZlc68Ld2QPD+QthBavy0JHWNxXMUvJjtwYcux+Mzf9WBhUy1GISNM+DFxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWnnIDaF;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4AC606A324
	for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 15:07:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B4AC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uWnnIDaF
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so8639385e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Oct 2026 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793372841; x=1793977641; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YNL5gTzoS0SNcKXI362OG6Cyagd0/f8y/Be+hIpJbPg=;
        b=uWnnIDaFZDr4pqzEYcHVHDAqr85/92Q2My9fXNCJD+rkJgIdgpI1tq1Nsu/ad8rMv1
         +RWezfm2jh3eMuFkIfsmUhO1gyAqms4M0rNFpMVk2SIZgx66VY2GDIayj0MDbNPZoCQj
         P0CxcqVstEmDxE8O16N5QIJkpPdcPsFJ/MGp6i3sqw15OksJS9Ox2+geN8KZJuvA53ed
         NhD+8PloOM+6WV43JiFyt+cdUB8pC1HWVKszqyu7EQ+Dw+hClQ9Jtnh8sho7HITeY2Mv
         GPTARz0x64NBro0lE7klgoIWeExmR78Ni5nKXKZLufumNznEsjPgq9U1YNuLr5BhMcDv
         gHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372841; x=1793977641;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YNL5gTzoS0SNcKXI362OG6Cyagd0/f8y/Be+hIpJbPg=;
        b=AKjYdw5ondAPl6vOfOYF1oCU9RLVnCR4NfZ6ilidPko1mPghSxRiMa1OmWsbpSi9gh
         hIGqZCSg6k9M8vVJMkUyC6QM9cTT0WusYfA3OZepSM7BQWvI0+17Ryi0v1wRxFiWffV2
         znlTGngxOa8ElBjlP5vtEr/H6qHTx44lKBo0qMQImogmUqPt87wXy4VAJXx1hXpJ225S
         /DYGIBLuclwbR7+Mluo/cFnQcMz1UvyTWE0tbOQxOilIu1pajWsoLee+2tRBHuJg7qY8
         fMwecX1/ioqbOVlEfjOKcpR2khkeHgHqAHRvdgWYgU9Gl1n6TmhIJJLMuhJe5f6qfb4W
         plTg==
X-Forwarded-Encrypted: i=1; AKwUvBzGnchAGxMmWafInH/68x7Br0gHEwvoPseERHDbNnemyU7OIsFaQBg+nqGznuFd1OPNnAoTQtyoH/RCUpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSHJS/EHUu5u9X9VXhJKcCjGxre92XYmjOqmWf0WUNQF7DIYyB
	/LMbQhOTCeed85FyjiiICRs7LrDngqaGqa8Ah0a+nWQf0EW2V8zxgCB7
X-Gm-Gg: AYBFou2MatLweWsjSIc6AflympGZ1MJ+WbrptwlAAAJDi9tPuxJ8tCOVVonp8JqCZiY
	MifTeqWX+AGTr93xo+uhJQfVfBVbTE9qoV8NbVr3PN0LMJmsw9ZlFKlQugd1O1Edvr8xrXbrXDw
	FN3goIawHVg+69viE6QqD6PkQ3x8Ivjb87Nab5rqR7ieoPpj0RTTCPavOY9L8FzByCHRbZpGIMT
	RqnGL7bzgPFWtJhbIZTXRDo5OjWa03CphuomnHHvsfAjKm/58QwkQDsGdoMqLRvQWWPfJzv5iPY
	noqw1zUfJe8CvqdO/Q/1Lt38XblJ0b6Rc9NGlEpsqjEuBQKA7F0iDjRLznLAh2z1PodkoApO7jp
	LbJqKUcLFWEWVo+71nnMnXHIxObhdkjd3716uoLgBGjpE6Z7m255xQrSHnlnylkovkydyZZ9obX
	1JF8IxcHZRD3v9KTtdxmA4hqyPxqckNmiwdglKrhFIgwKnUdNrL2E4PqUyFF14ySNTg0/pIonLF
	1Qi2VBFdUhqjUiwkC5NFmzaUW0VSYjMQ6/Ojjix7OmPNzihvKl9geXnZ6XVo+IFMIdizTKCJhFS
	Qb5a8nZS516BxK0j85UqALOUIxdUH8ydweMGxAeZ7FeVt0z7HdN1cskIqswaaa/Rng==
X-Received: by 2002:a05:600c:4e8c:b0:4a1:dade:f049 with SMTP id 5b1f17b1804b1-4ac1793ff26mr57275105e9.15.1793372840727;
        Fri, 30 Oct 2026 08:07:20 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf67aab10sm64599465e9.9.2026.10.30.08.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:07:18 -0700 (PDT)
Date: Fri, 30 Oct 2026 15:07:17 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: jim.cromie@gmail.com, Jason Baron <jbaron@akamai.com>, Shuah Khan
 <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Arnd Bergmann
 <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
 <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
 <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, Jonathan
 Corbet <corbet@net.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Pavel
 Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Steven Rostedt <rostedt@goodmis.org>, John Ogness
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?= <linux@weissschuh.net>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-pm@vger.kernel.org, Philipp Hahn
 <phahn-oss@avm.de>
Subject: Re: [PATCH v12 33/40] dyndbg: Ignore additional arguments from
 pr_fmt
Message-ID: <20261030150717.094d8a35@pumpkin>
In-Reply-To: <auNes2b11NqUey3C@pathway>
References: <20261012-dd-cmap-part2-clean-v12-0-3c8cc5725def@gmail.com>
	<20261012-dd-cmap-part2-clean-v12-33-3c8cc5725def@gmail.com>
	<as4W9hToBqAvbzJ-@pathway.suse.cz>
	<20261027132253.5f3a461d@pumpkin>
	<auNes2b11NqUey3C@pathway>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Oct 2026 15:56:51 +0100
Petr Mladek <pmladek@suse.com> wrote:

> On Tue 2026-10-27 13:22:53, David Laight wrote:
> > On Tue, 13 Oct 2026 13:33:10 +0200
> > Petr Mladek <pmladek@suse.com> wrote:
> >  =20
> > > On Mon 2026-10-12 20:37:04, Jim Cromie via B4 Relay wrote: =20
> > > > From: Philipp Hahn <phahn-oss@avm.de>
> > > >=20
> > > > pr_fmt can be used to add a common prefix to any output from a modu=
le:
> > > > 	#define pr_fmt(fmt) KBUILD_MODNAME ".%s " fmt, __func__
> > > >=20
> > > > But adding additional arguments breaks dynamic debug:   =20
> > > > > error: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" passed 4 argumen=
ts, but takes just 3
> > > > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > > > |                                                  ^
> > > > > note: macro "DEFINE_DYNAMIC_DEBUG_METADATA_CLS" defined here
> > > > > | #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)      =
 \
> > > > > |
> > > > > error: =E2=80=98DEFINE_DYNAMIC_DEBUG_METADATA_CLS=E2=80=99 undecl=
ared (first use in this function)
> > > > > |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_=
DFLT, fmt)
> > > > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   =20
> > >=20
> > > I wonder what this error about undeclared macro means.
> > >  =20
> > > > > note: in expansion of macro =E2=80=98DEFINE_DYNAMIC_DEBUG_METADAT=
A=E2=80=99
> > > > > |         DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));=
         \
> > > > > |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > > > note: in expansion of macro =E2=80=98pr_debug_ratelimited=E2=80=99
> > > > > |         pr_debug_ratelimited("%s", "Hello world!");
> > > > > |         ^~~~~~~~~~~~~~~~~~~~   =20
> > > >=20
> > > > Add an additional ', ...' to DEFINE_DYNAMIC_DEBUG_METADATA_CLS to s=
lurp
> > > > any additional argument, which `pr_fmt` might add.
> > > >=20
> > > > --- a/include/linux/dynamic_debug.h
> > > > +++ b/include/linux/dynamic_debug.h
> > > > @@ -351,7 +351,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descri=
ptor,
> > > >  		dump_stack();					\
> > > >  }
> > > > =20
> > > > -#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt)	\
> > > > +#define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)	\
> > > >  	static struct _ddebug  __aligned(8)			\
> > > >  	__section("__dyndbg_descs") name =3D {			\
> > > >  		.modname =3D KBUILD_MODNAME,			\
> > > > diff --git a/include/linux/printk.h b/include/linux/printk.h
> > > > index f594c1266bfd..5d701952e739 100644
> > > > --- a/include/linux/printk.h
> > > > +++ b/include/linux/printk.h
> > > > @@ -742,7 +742,7 @@ do {									\
> > > >  	static DEFINE_RATELIMIT_STATE(_rs,				\
> > > >  				      DEFAULT_RATELIMIT_INTERVAL,	\
> > > >  				      DEFAULT_RATELIMIT_BURST);		\
> > > > -	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, pr_fmt(fmt));		\
> > > > +	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);		\   =20
> > >=20
> > > IMHO, this changes the existing behavior. The prefix added by
> > > pr_fmt() will no longer be stored in DEFINE_DYNAMIC_DEBUG_METADATA().
> > > Is this intentional, please?
> > >=20
> > > Anyway, if we do not longer pass pr_fmt(fmt) then we should not
> > > need to add "..." into DEFINE_DYNAMIC_DEBUG_METADATA_CLS().
> > >=20
> > > By other words, we newly pass just the format "fmt" without the param=
etes.
> > > The 4th parameter was added by pr_fmt().
> > >=20
> > >=20
> > > IMHO, the right solution is to keep pr_fmt(fmt) here and extend both
> > > BEFINE_DYNAMIC_DEBUG_METADATA() and
> > > DEFINE_DYNAMIC_DEBUG_METADATA_CLS()
> > > to accept var args. I would expect something like:
> > >=20
> > > #define DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, cls, fmt, ...)	\
> > > ...
> > >=20
> > > #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)		\
> > > 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt, ##=
__VA_ARGS__)
> > >=20
> > >=20
> > > or maybe, we could "eat" the extra parameters in
> > > DEFINE_DYNAMIC_DEBUG_METADATA. It would mean to keep
> > > DEFINE_DYNAMIC_DEBUG_METADATA_CLS() as is and just add the "..." into
> > > DEFINE_DYNAMIC_DEBUG_METADATA(), aka
> > >=20
> > > #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt, ...)		\
> > > 	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(name, _DPRINTK_CLASS_DFLT, fmt)
> > >=20
> > >=20
> > > Or do I miss something, please? =20
> >=20
> > Don't think that will work.
> > Won't you end up with ".%s" fmt as the string without the extra argumen=
t.
> > So you need to keep the expansion of pr_fmt() together until is is fina=
lly
> > substituted into a printf-like call.
> > It is possible to enclose it in () so it is passed as one parameter and
> > remove them on the final expansion. =20
>=20
> My understanding was that the format is stored in the metadata as is.
> I mean that the string is not formatted in this code path. So that
> the parameter values are or can be ignored. We just need to make
> the compiler happy.
>=20
> But I might miss something.

If it is formatted in any code path you need any argument added by pr_fmt()
otherwise the values printed wont match the format.
Indeed, in some cases, the format has to be formatted in the same code path
(or at least scanned for anything passed by reference) to avoid accessing
stale data.

I've definitely used:
#define pt_fmt(fmt) "driver serial %s:" fmt, foo->serial
which relies on all call sites having a local variable foo of the correct
type. There may be some in the main kernel tree.

Maybe I'm missing something.

David

>=20
> Best Regards,
> Petr
>=20

