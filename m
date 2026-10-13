Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D004FDA73
	for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 19:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919768; cv=none; b=ah62wYELV+4Uvtk+5JfNyFhT88paGM/XdjOEZbHjIhk+SKANT5h0De7eOzX+Sxr1xVn3vTymeFSFNl9JMBx//FmBjsM+FzWTlF1HLt6vr2/tjnoHDhsOJfx/1c7CAiQNjtkJ0zwzQ4I7BY7vKM3QjufeRqqSgMW6x54MttCZtao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919768; c=relaxed/simple;
	bh=HFB6DyseJTdbQfG1DZ6MXg0hnr9XmayZmDxutEscNow=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pA38dcBaQ6rXm1XV9DTWy/t3gXG8WfjtVufKGn4uONlrD0yDWA3NJy0a+C2pkw1+2A7W9Sxs3tkvAcZLL33T0mN58hTVJjnfQlp6TAO+I1SaoKh4nQogqylV8Zye5Q84d7XufvZ3g9xLFBnsbfMq6X+uEm8WVA0Y3oi+aLGBoSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SkTvqIiA; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SkTvqIiA"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6e560e00a86so2577862eaf.1
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Oct 2026 12:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1791919765; x=1792524565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOxgkNuwHKNgVFVQaM+OBUUFEqO0M0muHBMxUHjrBmQ=;
        b=SkTvqIiA7vr8JdA7bRhOV0Ijo+RNsveUSQpUJqUqmTESqBbZfENP2lD88rRRillW15
         ys2GG5hsB9vHt97BdHz1tW9LWRvwEOUPVKEfgXonYSTYSs4zZ8/h6ww8ZLBIo4CM+1i0
         rTS6kswASnjWNcuXNpBD8nI+kll1UZ7FC7Ka4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919765; x=1792524565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOxgkNuwHKNgVFVQaM+OBUUFEqO0M0muHBMxUHjrBmQ=;
        b=LefAEuPhLTlttIbN9uShIFQynrtWSvOORJc8F+mdsA+CMugdkbwCGox64FVxm38UVq
         AwAchVNnOTom5r3u4XdnUHtb02MCyK94C+N9Bee82gwhK2HAFCBbb/WdanxnohRPpSp+
         GiPxl4DMwPXUYBH3htHphVbU1CURvlcZWS0wNdZDr3JzCq8KhbPR/T4n0ZKW7HpjR45W
         HKiot5k3RvBbvovlif+oSc/OqSNP5nEGqAjWXacM+s/xPSHuQdZhRHfzJCKP32GdgAPQ
         GvgqkPlC5PPg6y4UkzzgR+EUJy5xtajMDPq8L4FiDc/XOr0YeZzwMzZ31ZI/xtPwra0N
         3hXg==
X-Forwarded-Encrypted: i=1; AKwUvBzMdhe1AX3gtnljnDNoiRM6NLnQUjXCa08xipZc8vprGUxQG3FlHYbgnGALTCWhHBWUpmtL7k9k332GACs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI11lTNu8UgC3QrC+Xc3Tkh2SbGANm/7sA3V8R0USNKoHxoYn3v
	d3qyZ5uDX7qhbvRUBuvb2Clz06yyOBI4cOvE6Okb3/wGQewjBwK2oeQDVmk8kGGPAQo=
X-Gm-Gg: AYBFou1M4HcTd9Gsa5QY1ygSAo4m+3dyrjvYpSxkUhE8QqZmcpCPnn8nt2H7Gbyw6OJ
	ANQSsWly1rTLiEJCVhBgONl159jb6i1vI/Vd6ef9rVVFjCyoT7Ng7wFMNDj+HQ5/RJBMKR9HT9e
	/QF8Df7uhdRUZtlHD8mM5gxZOZTAVQ8VLYeIwiutd/XA76WUHupFj7oKO5frXsKiw+DjFHRzN4N
	pcKfctLQhBp+UGumjcKNv7DmfNPBrpUNuzhf6zjw/An6Tobr3aIafogXusoe6vyf4XHcPVtYASj
	i5xaPVf3HL6YW5P9uIv9G5Lq6aleA0q5zPVyH5q7XSu7E2RQWJfvOQXzE6mcu8/55iQrUcOvSJI
	yJ/z4yR+y7tKbiLGmzJWSXjg4oNm2KPLXB/QePk7Kxmo9zeUGsYsPgv12CzXEkQ7OVn1DoOj+L9
	RqifA6CdzP/2hILy7mgIlSzjTYto63ZVEzm/FrdW7vVjubXXZOllZeUQEAqFEDRfiBFq3+T7c86
	EdnGRje
X-Received: by 2002:a05:6820:198a:b0:6ca:3ce1:ed36 with SMTP id 006d021491bc7-6ef100968e7mr11004632eaf.47.1791919765182;
        Tue, 13 Oct 2026 12:29:25 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfd0b149sm437488fac.18.2026.10.13.12.29.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:29:24 -0700 (PDT)
Message-ID: <08e8e221-4e46-41a1-baa5-bade8ee20730@linuxfoundation.org>
Date: Tue, 13 Oct 2026 13:29:22 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/6] tools: build kernel selftests in tools_build
To: Sasha Levin <sashal@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261011233647.2454648-1-sashal@kernel.org>
 <20261011233647.2454648-5-sashal@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261011233647.2454648-5-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/26 17:36, Sasha Levin wrote:
> Add a "Kernel selftests" sub-menu with one entry per selftests directory
> that builds with only a C library and does not write into the source
> tree. Each is built as "make kselftest-all" builds it, with KHDR_INCLUDES
> pointing at the UAPI headers installed in the object tree, but by its own
> make, so the selected ones build in parallel. Selftests whose Makefile
> does not use KHDR_INCLUDES still build against the C library's copy of
> the UAPI headers.
> 
> The selftests do not track header dependencies, so a selftest is built
> again from scratch when its own directory, a header or makefile any
> selftest may share, or a kernel source it includes directly (the vDSO
> test includes the architecture's vDSO code) is newer than its last
> build.

Is there a way you can fold in kselftest_deps.sh run into this
so users know why some tests didn't build. Also we want to make
sure kselftest build doesn't fail if a test fails to build to
keep the current kselftest build behavior.

tools/testing/selftests/kselftest_deps.sh

> 
> Selftests that need libraries beyond the C library, a vmlinux with BTF,
> or a sanitizer runtime are left out for now.

Great. That is good for this round.

thanks,
-- Shuah
