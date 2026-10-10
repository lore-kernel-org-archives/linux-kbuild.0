Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A9B4B1B42
	for <linux-kbuild@vger.kernel.org>; Sat, 10 Oct 2026 18:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658227; cv=pass; b=nfa6tzeLBDaAwGEtDG52Zmb873EVwL0APAT1wdKsvZSZUo5LRaPTN7cn028EMef+hbIHI5TnCMhrwPKpqF+cStH0CoEPULHj8HHfFmRBRmLXhWo2TFvKzxspRZNuxT9fIo7xzOgksg9e6XBlPp7MlpYh0qQzIEq3leaClOtApDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658227; c=relaxed/simple;
	bh=qr18RvOXBpCqRo15c2cqUJX8bvTpVRYiKMUfReneauE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FhhQYTTgcMejFLmQBolEcoHDiqLIkCfLVfgAJO55tXXD4+ExhKe8VeI33oxG/YjGAfun9R5Popak5Qnu6zwn5gboFf1fbWt1yxOnOrxkWTo/4wmnyIIt8Z62FAMxN0HuukbnXZeTt9O3F9b1xjUClTWXPtpZwjVw8pgWtGaLm8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m6jFkgKF; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m6jFkgKF"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so2369a12.1
        for <linux-kbuild@vger.kernel.org>; Sat, 10 Oct 2026 11:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791658224; cv=none;
        d=google.com; s=arc-20260327;
        b=V+Qnk+0Oq2l8b8CZ7fOXFf2kUI4fGgN4RWzUtdlqb3JKumZI3XEytgMInfZcjNPMbm
         TUF3vfYPuGOdfHL43LnuMiEHPr2Nc/Jcj+zSFwsUGWvsMawBUScEh+U8gI3dUN94rq0s
         iOp4DIt0yJyDFTEzdGbL/iHWOoY66WDYhDSjaRDFD8phjQAPb55mfbLlA7Xu6hRzEfAG
         w2Snzv9Ahgp6szNlydKVFZw4xXwiH9xuqUcXIVLRrpu7AzoKva1eKm1sAh23w4rTatIT
         V8F+DtIXAQz+ziB/bb00Br0aLQUQ/zHUxNxxUQvPtTdzRn8ylF6oYqbU41CM5K61g//Y
         6N7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RCAct7EWAduPCLZ2QGVMtJLjx5OgSp/kpcoOzmSgPLs=;
        fh=juWrg/Q3MRiIBIm3qSPYKgFSsvorGP3qZmyNrnJhXzs=;
        b=Qk7IvXHifwd2La6lf/w9gOn1KYn0K5hlNHrXJHEWj6tvfa2HRiZbife06RveFvne8x
         c3+vWp7AauN/D47pnxTpj9zvfJxSLv1jCHgSQDh45w0wQ8fnJdJLOrRJTP4UTb3yarif
         SL2P0qbyoLfmqLcMu0c0zwSwGqOBO3wpv/ORT1I9X/GYQI959TkEAsSLMBKOm7blIBt2
         lsV07zZsPt09RQSdYu72DFzTC8b5zi2kqpT6SLQLur05M3E+Yae6WZzI98oW0VB3C+n1
         GlIEkkbSdeXb9Amoa8hXzwguaEVu90voU9EqkuselG6GkOZMKH11ufA98S614tPCaCpl
         TR8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791658224; x=1792263024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RCAct7EWAduPCLZ2QGVMtJLjx5OgSp/kpcoOzmSgPLs=;
        b=m6jFkgKFJOEIhF3SpRZZRr386KTp8TN7hL9rYZo1IFAK5SABrlic+ZgeqogaDb06Jl
         09zjfB1y/oTF7+EWsUBihB301qdQeTlgcgmewrB3EIVRvylupNe7hlK6R6DlBPpX9B3b
         joYMLAWIrSoJD+/6Ha1kan24hdp4XMANJjV5CTYZx4vAF9CLzo3c2+rGzGsliK6RnyC8
         +bVapBXGDnISbgvIQiCfXyCshUSNEHcpDpfh9NsU9KybczHK3o4qSwsCbE/b6SnkVXOd
         OjeSsoKhRNXUn08KY/ztxMgqBWcZWynOf/AGVxh2PYoIZSQKQqILWuOz9lxw4EP0FRMb
         kaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791658224; x=1792263024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCAct7EWAduPCLZ2QGVMtJLjx5OgSp/kpcoOzmSgPLs=;
        b=FqA8F93ZSet2ZSOUVrHbuuXArQG3U7qGi8ceCBBgdV1+8w+ZmE7LTJJXw5F5spiO+C
         I33CX4PUa8lZW1Ir52sKwlOtMBknWatD6p0IJ8F2bOvpYIAfra9Rdz7v6VaMX2TnB+p/
         9o/A553tI/36LQ/7Zkoy1It8u0NrR710jWPBeRd7uerppqfgYKrd5w4e7HfmeUM8lgtr
         rQ/P/cML5u8nc5c0ndy/hwRAq9IOy2yNNHar99G7ugejMy8v0WGYAldvkLfqr07xIv35
         VFmvzxbkOgG3JECPnEMRGAvjvmAN0mtL0DctIcM5a4VQ2xWLlrUbIhzrDsMgI4hxsm03
         rqgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhxstiq1u2a8wGFFzNy5fb+qyOvufgaIyYTTPTFRnf/v2tGAQFqQu+DWNzoPEwv0kAT4wrwBv836fD9yg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiAQurKtWkc/BfCeQHLmRRS9bF2Dn5jURC3DANizGxuasI3gU+
	5OG5IU034jgpNKaSs8gILFsd/ZbDorbJMB2wFASL6ydnuPBb2xwHCg195/1sWb3c9nC4EAm1ocq
	bhQtXqgd+CNLWRTrq1srKB6PH5Wtx51YUcgtqat6g
X-Gm-Gg: AYBFou2OPGLV7vjfsfuUD1fqYwW4Pn0NDxYsvXkBufsGH5kE/20G8mjb47htw7Qx1SC
	VG4FKjPCy0q8cRKdC/i3k6L+eL8smlFuKRO3vBPEeObMkQaVrgpeVyntzzerg2i7zCjJ9Bdl4sa
	K5My6YkyxNxp26ALOJCOWswBfTmUt0rj1oC9xYbNtmOE1XovyHFlVWLwGkfiMEjOmHJKPlYo9yf
	xvKx9EOKsyxhlX29Fx4KeKU7kpcVoTMsRRImSbobCGcwowCuUaue0HTPFxfK7yVm6K+XTj1wBQ+
	YkehKiArBvXyfYDiduml22sqgeUeiwcEPXfHYBTZPmQMnZopeyi0tQ==
X-Received: by 2002:aa7:df8c:0:b0:6a6:8513:7e14 with SMTP id
 4fb4d7f45d1cf-6b1999f0a81mr27065a12.9.1791658223134; Sat, 10 Oct 2026
 11:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009214501.GA905361@ax162> <CAF1bQ=Qq66JuvYrbR-7GgegZuWPSjxDOgerUSD2NOp9W0BauZw@mail.gmail.com>
In-Reply-To: <CAF1bQ=Qq66JuvYrbR-7GgegZuWPSjxDOgerUSD2NOp9W0BauZw@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Sat, 10 Oct 2026 20:50:12 +0200
X-Gm-Features: AclHuK9XW8_fm_qLinjw3mJ_6Xz_X6pL-OrYahnEsVuiKXgP4DpOW6u5trcIM0Y
Message-ID: <CAF1bQ=TGW3VK7LK-d0JeYhEc3WgTjypVhQc22CxxvRq=VqS5YQ@mail.gmail.com>
Subject: Re: Build breakage from renamed '-split-machine-functions' plugin option
To: Nathan Chancellor <nathan@kernel.org>
Cc: Han Shen <shenhan@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

Thanks for bringing this to our attention. We will need to rename the
option accordingly.

We need this option for ThinLTO (though not distributed ThinLTO).
During a ThinLTO build, LD is called directly when building vmlinux.o,
so the Clang driver change will not apply in this case.

Please note that I am currently on vacation and may be slow to respond.

-Rong

On Sat, Oct 10, 2026 at 8:46=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> Hi Nathan,
>
> Thanks for bringing this to our attention. We will need to rename the opt=
ion accordingly.
>
> We need this option for ThinLTO (though not distributed ThinLTO). During =
a ThinLTO build, LD is called directly when building vmlinux.o, so the Clan=
g driver change will not apply in this case.
>
> Please note that I am currently on vacation and may be slow to respond.
>
> Thanks,
>
> -Rong
>
>
> On Fri, Oct 9, 2026 at 11:45=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
>>
>> Hi Rong and Han,
>>
>> LLVM recently landed a commit renaming the '-split-machine-functions'
>> plugin option to '-function-splitting=3Dall':
>>
>>   https://github.com/llvm/llvm-project/commit/3e6acc87c58843e551d6e8e4bf=
06c26712b04622
>>
>> This breaks builds with CONFIG_AUTOFDO and CONFIG_LTO_CLANG_THIN with:
>>
>>   ld.lld: error: -plugin-opt=3D-: ld.lld: Unknown command line argument =
'-split-machine-functions'.  Try: 'ld.lld --help'
>>
>> Obviously, we can handle this rename but I noticed that the combination
>> of '-flto -fsplit-machine-functions' should add the corresponding
>> '-plugin-opt=3D' since LLVM 15:
>>
>>   https://github.com/llvm/llvm-project/commit/72acd042bad35f78232f17addc=
02196a7af1a6e9
>>
>> So is this even necessary? Should we just remove
>>
>>   KBUILD_LDFLAGS +=3D -plugin-opt=3D-split-machine-functions
>>
>> from scripts/Makefile.autofdo and rely on '-fsplit-machine-functions' to
>> do the right thing or am I missing something here?
>>
>> --
>> Cheers,
>> Nathan
