Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE1941D131
	for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2026 22:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792103760; cv=none; b=r/yhxJuvx4wwxZlBd6c7y/29NAdhWfd+zh+AggMGZFe1T+cLpPX5MHn+67bbkgcnwI0/LeZXijM+uj0uidzdpxRGVLbT36UdNytg4AwPynHm1QWheX77tDLYmUPo5uFC31UildnRxV9QO52Q1wWbmH+HeiTKWIv5IbkDvU6i3qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792103760; c=relaxed/simple;
	bh=cNb2599aisLf9N4nv6csEEr4VxPSgmqchakmgV0DaH8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=bwq7FX7XE7ii4N56bk20aPgenPws9f1xigdvmno8fs7M1XK9dGDiTNIKwg2k7arrRWaE8rmeGH3dNuaV+4ciJ2HQR+D2F+23OqfGuEEHOYvEA2pJMaFmvvo2SU+eJFXEJwWMvj2FBLBHNNAEmCJL8SCRT8o9lQXu/fZ2IYaCcC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EjIqj7pC; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EjIqj7pC"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35d7fa491deso468565eec.1
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Oct 2026 15:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792103758; x=1792708558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xXSyEv36jnn0UrqVwNj52XhE8B6xeFQj285n9/QUz+4=;
        b=EjIqj7pCoK4+nk0gU9MX14g+breJOxcXlm0yFKr5EaiA8aq7vDFzKWKqk+IoaAcvMV
         mSk4mZuF73BmDubLI/kgjeBIyCTSOxz0+xTMAhHUnQy+xx/mhI9FpSqXCtR1GsB/HQ/K
         BfGvBbOB5qbbVG/vRaSijI7V088bcrEaSPx+mfU4LsS5YTmPXTAFdGc30M8xHlIR56zG
         Es7oHusr7nahKY3iRvXOTKZYXuBp/VBr++bBzCfjFl929eJRLbEmlP/94yn/pOgGzBkS
         h5EXmNuXi41gSBA+oH/q0PCluQzF70hc4fFgENnEBxbpR86TLZRDtN80ggq4m5Ay3lsG
         OqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792103758; x=1792708558;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXSyEv36jnn0UrqVwNj52XhE8B6xeFQj285n9/QUz+4=;
        b=0A53SXHNV7FTN3iz5zqrV5Rn1Ve1K0pFaHUERDAYYbgRuk3hU4atoKt5xnVc18dqSd
         P5ihCdj57sKKnXontfdPmyyKmge/fQDYdCEjQzBBYLjY3K/dVQcMbr2YrQiNy5Dnk2in
         jzQulHG/LDXXLmbTrIS51mNwu3bvca6Ztti7mzv/hBkxFKeSJc/1O6DOirrzjRkxhWsZ
         76h3FYEwYNWHzGQk4RRh6M18IDL9n7etfNK9SEyjnqd4FWyW4nH+z6s7nZb+cmhvTm7z
         vadhFrHLeuJ1jjZ+Ux2hg7MNfpvDMjYZ5k/WlnQGjP3/vGYohQ+/2gpgCAd44Cr0Mqyq
         /ZOg==
X-Forwarded-Encrypted: i=1; AKwUvBy1iM3Beznd3Fub1G9woa0wPN4z+lTESGfbc/nwdMgLROeUCNWXsDi3WRi5AX51lm38uKSnAFMfaLniNuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGDEldV6QNpTzfblPFi7Vl92AMhWGwG4BXBQsXBQgjD5QMewe8
	fGEdSnyaorSIxAiWJ3vvb4OjxzImop3hqd3bTDZL3T4MRJPBhE4ttIzl
X-Gm-Gg: AYBFou3KtO81qU19rClYwQ1iXIofXpLI6c9y+P4OQYs3YBWmaPn48MAyOVZat6Yjmt+
	VoDv/K6tKcbB26BWJtij0Wr5zcyynkPfKCWvRtNDswmRMLCPbWfTXsruA1LhtE0GjZywTCgRh/f
	KjhdtvTY9nNssuEYIMn0hhbgQlOPMqdCPh+mda/ovuUSXAB8MRBebhc82czqmtnNIB/IQIuFMui
	ovb+ONeiJ+qzU065A4V6NE1DHqmObIAGiFf5NHu13DVl/jhnF3Fs/fd9QilGMww/Wnogm0xG2Ar
	xmQPuAtjyuO2VuzkeWvyV4xkpUgzv/h0jf6nxP/0IePepmoW1mG8v18fN4gLgjHamGAxSZcS8uU
	72xo7QSsQnkSwNT0UVW4zM/Y/OjpveLcNTVEGNPjLwQeL1nAFSH/qj4YJ+xUK2p9OaUW/CZrEdZ
	WtPm9yOMtEoqqqYjNegLb9MBYyo/xsfJ1+VVYe62/rFOqmAflh1ipn49cBhofgKhp4TLIk8JWU/
	87Er26iciy+V3g=
X-Received: by 2002:a05:7300:50f0:b0:35c:eb2a:8c2a with SMTP id 5a478bee46e88-3602ae5f83emr1712774eec.8.1792103757626;
        Thu, 15 Oct 2026 15:35:57 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2804:2bf0:60e7:ae00:5bc5:e41d:2ee5:2023])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm1155305eec.3.2026.10.15.15.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 15:35:56 -0700 (PDT)
Date: Thu, 15 Oct 2026 19:35:50 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Sasha Levin <sashal@kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>
CC: Ian Rogers <irogers@google.com>, linux-perf-users@vger.kernel.org,
 Namhyung Kim <namhyung@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/6] tools: build perf in tools_build
User-Agent: Thunderbird for Android
In-Reply-To: <atEo6aIQbgww4G0y@laps>
References: <20261011233647.2454648-1-sashal@kernel.org> <20261011233647.2454648-4-sashal@kernel.org> <CAP-5=fWFY-tpJz2vcBZvurwdZY5gwd8cuTemE9q1rtZ0Vi0dng@mail.gmail.com> <20261013170854.647305-1-sashal@kernel.org> <as6SxXELnoIJenIX@x2> <atEo6aIQbgww4G0y@laps>
Message-ID: <C62E88C6-52AF-4F68-95FC-310A84DDF8FC@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On October 15, 2026 4:26:33 PM GMT-03:00, Sasha Levin <sashal@kernel=2Eorg=
> wrote:
>On Tue, Oct 13, 2026 at 05:21:25PM -0300, Arnaldo Carvalho de Melo wrote:
>> Why is that difficult to run:
>>=20
>> make -C tools/perf install-build-deps
>>=20
>> To do a recommended perf build deps install?
>>=20
>> That would be useful as it is what we expect users to do=2E
>
>That's what users do, but it wants to install packages=2E
>
>We need a path for unprivileged builds on bots and CI machines that can't
>install packages, and many of those builds are cross builds, where perf n=
eeds
>the target's libelf and libtraceevent rather than the host's=2E

I see=2E It's unfortunate as the end result will not be that useful, as it=
 will not be testing what people use=2E

Maybe use make MINIMAL=3D1 when doing cross builds?=20

I think we can make this easier for you somehow, like disabling libtraceev=
ent when not available instead of asking for it to be explicitly  opted out=
?

>> If that is too difficult, for some reason, there is a minimal build in
>> tools/perf/tests/make, that is tested since forever:
>>=20
>> # all the NO_* variable combined
>> make_minimal        :=3D NO_PYTHON_MODULE=3D1
>> make_minimal        +=3D NO_DEMANGLE=3D1 NO_LIBELF=3D1 NO_BACKTRACE=3D1
>> make_minimal        +=3D NO_LIBNUMA=3D1 NO_LIBBIONIC=3D1 NO_LIBDW=3D1
>> make_minimal        +=3D NO_LIBBPF=3D1
>> make_minimal        +=3D NO_SDT=3D1 NO_JVMTI=3D1 NO_LIBZSTD=3D1
>> make_minimal        +=3D NO_CAPSTONE=3D1

>I tried make_minimal on perf-tools-next=2E It still requires libtraceeven=
t, so an
>arm64 cross build without the arm64 libtraceevent installed stops at that
>check=2E With NO_LIBTRACEEVENT=3D1 added, it then fails building the Rust=
 test
>workload=2E

I'll fix that, make_minimal wasn't updated when libtraceevent was made opt=
imal, IIRC when it was removed from the kernel sources=20

> Natively it still enables aio, libLLVM, libslang, libtraceevent,
>lzma, zlib and Rust when they are installed, so the result depends on the
>machine=2E
> I'd like to go with Ian's suggestion then: a MINIMAL=3D1 knob in perf th=
at turns
>off every optional feature, which tests/make can use for make_minimal as =
well=2E

Sure, for your use case it makes sense=2E

- Arnaldo 
