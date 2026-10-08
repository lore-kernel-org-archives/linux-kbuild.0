Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B7F4F4050
	for <linux-kbuild@vger.kernel.org>; Thu,  8 Oct 2026 18:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791484626; cv=none; b=NjkDaQh8KImdfLBs35dUxLan7tO3lRX2UTfhQOh4mrCqy89TzdYcKqy7/sJXWk07tT5SObyE7A4PAMaj1qY1WCxMfpnz4gQFDId6tW9Y0A9BwEcc4bg5cSJkqKEv5Q1Q3ECfpFbhVHcyBxFWa5G55INrA+f9Daqewx3/up2K/lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791484626; c=relaxed/simple;
	bh=wWZeumKz9esFSRC87m2K4cbucNFbsWDBj7xuEZ4k6t4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IKjYlkS4oi4lTdLMb40D7DslP30vZ9CG91g3DYuC2mWqdNl3vpeYTdgXsfHrfjn7MH6Bh2YLvJGdfXerus6EeJGxMX6sDVsjnais/SxebbgHWQx7g1l9v6vJj7LXskM28BX9cgysw1v9gYyex9p9xOjvgyKCf2g5QyF6aiYyg60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGWxYTTE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGWxYTTE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so28686105e9.3
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Oct 2026 11:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791484619; x=1792089419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpJdTFadC59MEdInBU99QKfyaqonluWTURkek0/6Sh8=;
        b=lGWxYTTElOnicnKGCKTgiJIqfxq21ZjOenVm3ZeoC1q2gMbvYFr12zJ0h2/sevmgV5
         w4Qin9hOtCfKbR3A1W/SYi+v3VlB9Ws80dI9HK9nHlfFuPvo2OT1DY0VLWp2v8379YWi
         VwtwX58K+BqgJceZVuzgBGGNPLIOrWw8HuD8ixsBsTtffCtd5hYt0iUPePJdg6+R7Qwr
         rZa4i7u6rjhKM+CGmPwb2Ale/UwcYSWoAOLp6az3ZOjbjQyfSp/DMCruRAMcsuwnek1r
         lm3td10pVl4iQM9v+ejncFsqT1p3+w0XFnTDpVPupH1XAPWbOskw32/w63fskWYM3zX4
         uhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791484619; x=1792089419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gpJdTFadC59MEdInBU99QKfyaqonluWTURkek0/6Sh8=;
        b=KKdHUcNAMSzIhdise0gzaXULJGfw8BECv97cFgRyCv9w57d0iYmb3vUZ79RIQkFLA1
         TbUDWH4V1b1nSNHcNlw3c2fj0QVhO9XbcuvTXIBRHECtcWAl35bdCxCPKSS3ydXPoJL+
         oPsiFLqXNZZcU86lKk67qJp9w8VXCoalrCZnl3dGI4wpgWJZp9QP3Czhg2H0T0zGv0N+
         XGqxtdtJgjZC9zbNj8QQNodmGQOVlq7ezcVSdDJeWpUeRdfoi0ueg7oiDJfeYloQlbSS
         NCaoBwpDif6zN5hv2BwhVliBxQ9uuDnoAUU+5AU9fWdoWevz7T+WJpQ+pi6T7B9ju/Vg
         v7Qg==
X-Gm-Message-State: AFuF++lMayOSor2aR9gWrc8HSL8bkdSVPyTXaqUCOOWArQWprsrs9x+J
	A+b0+I0m76Ej1jgSFP2AmnvDy/pxKnhc8ofesIMPEIoVugJcdfCqQNuD
X-Gm-Gg: AYBFou356XwQIsrTRzNrwDDvgupV0fWXEFD2nTgrVtpEiQcGzALW4Jv631kRfgvsfhA
	tiquNDgUXmV1c5X/LfGLX+EV5xcy7JfWckLm9a4rkgqrvok57DZX4ypn5G64Kws6Ufvcqz5azUq
	F7aVXCDiBXAWp5RX0NzTIufpc+y3c12GTsdtiGKMDWqeC74Okt58oJBfHrwNN0f0WMlOf65TSFB
	sgG68PAkUUGYuFlYr+LOkmIe+XOizWX7comKks81nT33LgWt4gyHnSUD8sgV1s4B9LhmV1iS3Nh
	AaeL0k3mYaX850ECpdcUM0T/Kq1D57W6NAcWBl9Dyv4KPmhiNRpUnKR6JSz0lIs5eAVJXfobWH4
	APKHoZSRaIYaqZ3+SntSE9gnSpZlCYJKNsTyB5LWXf20HbArYFHKHsAo8egu1PVTLKZhVMmai75
	Lrn0Z6cniQvlw6g8CLE8dsxbsBUVZdKwLwKhQdqdIZ6N8Y9BdUHyQR4mtGVEsaR/NUw9ypSgaJs
	mRIyDzdVSQgvP7Dgqm57+PyQaWCtaE=
X-Received: by 2002:a05:600c:6989:b0:4a1:6991:36d7 with SMTP id 5b1f17b1804b1-4a1802f622amr128959465e9.10.1791484618686;
        Thu, 08 Oct 2026 11:36:58 -0700 (PDT)
Received: from [10.0.10.92] ([81.0.251.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb68abfsm5152555e9.0.2026.10.08.11.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 11:36:58 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <b43a2c83-2c19-4b08-bc53-47deac0c81c1@gmail.com>
Date: Thu, 8 Oct 2026 19:36:56 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] kconfig: fix infinite loop in conf_choice() when no
 choice value is visible
To: Leizhen Zhang <lzsx618@gmail.com>, nathan@kernel.org, nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261008164521.3684735-1-lzsx618@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261008164521.3684735-1-lzsx618@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/26 17:45, Leizhen Zhang wrote:
> If a choice is visible but none of its choice values is, conf_choice()
> counts cnt == 0 visible values and finds no default. When the choice has
> to be asked, e.g. because a new symbol was added to the same menu
> (oldconfig, syncconfig) or because stdin is at EOF (oldaskconfig), the
> loop that maps the answer to a menu entry never finds one and the
> while (1) loop repeats forever, printing "choice[1-0?]: 0" each time.
> 
> This happens in the tree for s390 when the compiler supports none of the
> -march=z* options (e.g. a non-s390 host compiler), so that all values of
> the "Processor type" choice are invisible:
> 
>   $ make ARCH=s390 defconfig
>   $ sed -i '/^CONFIG_NR_CPUS=/d' .config
>   $ make ARCH=s390 oldconfig     # hangs
> 
> Before the removal of tristate choice support, conf_choice() returned
> early in this case. Do the same when there is no visible choice value.
> 
> Found by fuzzing Kconfig input with ASan/UBSan.
> 
> Fixes: fde192511bdb ("kconfig: remove tristate choice support")
> Assisted-by: Claude:claude-opus-5-5 libFuzzer
> Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>

Reviewed-by: Julian Braha <julianbraha@gmail.com>
Tested-by: Julian Braha <julianbraha@gmail.com>
