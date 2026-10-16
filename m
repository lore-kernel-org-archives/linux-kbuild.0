Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB834E50B9
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 16:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167488; cv=none; b=Bo8UOVaC5WXmT2Aq9lNHO9wI9Y4e4qD+ncUx8SuVwxraRN5N1ongX9/1WsHSrIWmidTZd3zIwZ/DvvSznU1eMfexGXqS1/JKD1wj3KFTgNYVI+9B+rFR8wEWtRHkCoQmLFnuIwMs/dHjgRLNtUTxZCHPO873JjjgP2gG4HppNJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167488; c=relaxed/simple;
	bh=nZWtbApWt3kV026dkoDNspJsmQaxaHBVELtY6w2UgGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YRlvAyAdeYdO19Hnjzt6KapCw3p4/VgP0QsIiU+RT4A3w4Vkj8ExTJcFpWK6ve04uH3HMJbCPKyJiJYLQRw6haqqaJF5++T+f+ZTdQS6hiraU1zMK8gcE0WKzThmzi7WSIbAyUiLezKjPnXm07gnXJs8mhWH/jtnptDvbHgylws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=M3CpNeiv; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="M3CpNeiv"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-824e6e6ed71so2698301a34.1
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 09:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792167479; x=1792772279; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/aqB/Mmx2mmYZsJMDrgp07ogosIeUVeJwoNnZHzHvsY=;
        b=M3CpNeivZfD2Yrd3gUdREx/HDMNqlNOpX4xlFZRopPaDnqpqK9FF4rNZG9bBbxuPtx
         rVUaIiM31BfaYxDtDVTibXZ2LufgGbCGDw0tKWMYG18+sYEZTrZDwXQW6qN8wvLackjD
         3eA1+y1A60rnAfmqUeg3bK8FhHqvKWEQDU5u8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167479; x=1792772279;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aqB/Mmx2mmYZsJMDrgp07ogosIeUVeJwoNnZHzHvsY=;
        b=ba2DyGHJOBICGJO7vHqSvqHSW8uH4LDuL+inrnel4hBlXz00VAipbsWRl4YdqcmGFF
         YpGb9oYJlO8K5qJINOs/vOyLSiqys6JyVvifmVAk396qlVikHkyIr10GnplMp7KG9Qw/
         OkaR35VjDZt0aEsmkcaO6W5tviWrJI/KZukoUaMrW1FHYX1kG3N8AzLUVlHbDU4DbXiA
         y0+fqQeD3KzqyHK/HKjKsC602I1dr7aGb0EKETn8if7WqJdLRo+JKiYMbGKW0GvLAiUY
         xnPTZ44n3CHI0w7s9djJnKwiqq58kV/uDaH86n0SRU6MJwJ5uwUeNKpOm9tD8k+Ysrk/
         QheQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHwX7s3UAgB4dnldEsrmNgj+6at6mgOOdmXGZPaZxcPBStz3YkoSCgJRXTYef5G20kvtHcFU9TXCxiiqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK22/2t6FFCflstM2E3hXWqHl1rqSCL5bBdBMTPQ8AzsNrozs6y
	p7kCi8zTIwU0bCo5QhBC0l1mVvoqEWfsKx6F/cs6gmK1hcR2j9+T7vqurEnwYT8VXvM=
X-Gm-Gg: AYBFou0EsCp/MRVkaFYFNeijtMQimAmKThdxMNrvtCNyjPKjcK1t79pOrTOUPC44wzp
	Qr2xPMJQvZIoHpWxa3LwDYABocT5nY4LjaTfkuskEmt1EApXDz5clCdS0kKoG1OW5MHAMTSvrr2
	0/76p7NIF2GQiG7uFQB81chnbmqNQgM7FKva7SOhW+owb8EYhLc2nBUZduG4w2JCkca7IaICvWx
	9Cvtoeyt0iMxzR0PxuXfGmeY36fFxcpRfQxIFYog2UTUWRuOD0eMS5/h8nuInIsAuCVJFUANGbp
	d7cmTS17WyrlA+aptASOApp+gKn0lq4rW523WJMGxXZahXvQRR7qFWy0OXo3PdkvToqv0FZMhqU
	J+3u8PQhcEqkI/7t8Mi6p7Is3vOEO6RDyKXJmgR0skcb4BiKZioMa7iVRe8pZfHr0TFZL6mzHq9
	i/LFzySXGQnEt37B5O58Nab4+oAnudehkS7aMKeEPrRPGXwyZZVWv7vXLqCbZnEyv3IrBH293Rk
	fJsa/233g7y76FtA2A=
X-Received: by 2002:a05:6830:828f:b0:81d:c548:292f with SMTP id 46e09a7af769-830959380b5mr21128096a34.12.1792167479094;
        Fri, 16 Oct 2026 09:17:59 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-842a6f0a55csm2327426a34.25.2026.10.16.09.17.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 09:17:58 -0700 (PDT)
Message-ID: <93d5f73d-0126-4727-9014-836e195a3eac@linuxfoundation.org>
Date: Fri, 16 Oct 2026 10:17:54 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 5/7] tools: build kernel selftests in tools_build
To: Sasha Levin <sashal@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, linux-perf-users@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20261016143143.3613501-1-sashal@kernel.org>
 <20261016143143.3613501-6-sashal@kernel.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261016143143.3613501-6-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/26 08:31, Sasha Levin wrote:
> Add a "Kernel selftests" sub-menu with one entry per selftests directory
> that builds with only a C library and does not write into the source
> tree. Each is built as "make kselftest-all" builds it, with KHDR_INCLUDES
> pointing at the UAPI headers installed in the object tree, but by its own
> make, so the selected ones build in parallel. Selftests whose Makefile
> does not use KHDR_INCLUDES still build against the C library's copy of
> the UAPI headers.
> 
> As with "make kselftest-all", a selftest that fails to build does not
> fail the build unless FORCE_TARGETS is set. kselftest_deps.sh then lists
> the libraries the selftest needs that the compiler cannot link with.
> 
> The selftests do not track header dependencies, so a selftest is built
> again from scratch when its own directory, a header or makefile any
> selftest may share, or the kernel sources and headers it includes (the
> vDSO test includes the architecture's vDSO code) are newer than its last
> build.
> 
> Selftests that need libraries beyond the C library, a vmlinux with BTF,
> or a sanitizer runtime are left out for now.
> 
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Thank you.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
