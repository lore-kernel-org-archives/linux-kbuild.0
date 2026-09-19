Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EB023BD17
	for <linux-kbuild@vger.kernel.org>; Sat, 19 Sep 2026 11:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789818423; cv=none; b=hRAu0BksbzUgrwoOciMN3SMSazb/tcA/OwlxSP6x71XbS/Xi2BCYQEKUItsgeR+Vdql/Jb4hUMFUQuDV+6/wSoCUcz2X5aWVfjBSOvO9GB5btHg02c1ulbOOsjKGIT253VP/p3rMJXakIQDh7HmkaPqUDaRaIasLhyvHQfvwdAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789818423; c=relaxed/simple;
	bh=5/be281ZQD53yG9ylgU/R8rXnCdN/BCUnoqRoANjqpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KxYbUCA6BHeBEC+5xgcY0acnV3aYMk8+sjaCEaJ7A1WbzZnMI/zYWFZTpFaCLx+RCDoZitTOxbknix2fgwqJLzDCOt9V7S0rSBrNTsn7r6vR8rhkWviHqbjtCRhGtWjet4vz5jhkKFb/0NoauMa1C3c/CoFptrct9jeo13kSaMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpzYHOte; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpzYHOte"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so828262f8f.0
        for <linux-kbuild@vger.kernel.org>; Sat, 19 Sep 2026 04:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789818420; x=1790423220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ZZo/bO8FaeKZufIlk6aWKDCilZFtBs5IDhS4usmAPk=;
        b=IpzYHOteFMpyOiXD2+gCx/yTW4XFuMlQangK0MJTUFpF9jU1qdPCJezToDUZ3p2T7c
         kiwlgdQo+qfeMyhw/KkZgJpmPgySSL7gwg+W4EPVgcfqVV786ExhOzWtsESK6uUuKpvm
         KcnDb+zyMqFIeIaWIbUsXHYWa1IdYZhpojuFDxM3xs+gsgeW9QAjgreUfkitz4b6LdQ2
         q0ApfvC5lJwcsmw6PjjlNT3/nbnK+iVEMChIAukC5CgfgB4KSI3GiVpe6idE2lhbPhoZ
         xUzhVD63o1GGv8aE9CDv9LqcrHD2QXqfiRCssitck2G4OG64UIfddLUf297BPVTAinEN
         67PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789818420; x=1790423220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ZZo/bO8FaeKZufIlk6aWKDCilZFtBs5IDhS4usmAPk=;
        b=mlqXZxj6jHpcTcPdwxlEZ6U9gm4yA7t4ujXnuemiz8LdZ7CIxn3n/B6AdtY1GvaBKJ
         Sv+yxwCY47zAhKYgYxjsL2CIVR7sIJtScoCB3+YqbWpVnke5d0eXshMF+yVs23RtxlVF
         U63s3fSbaVXXehejVv7SvkAbalMNrt35kQ+5O61Hmapms51tBBlcy0tj+6D4if+btA+x
         xFlfnRmMukWbIRARnqH7wxBbLH087WED1sl5UVSph1S9BU6LEJeKxAMAay6kk8iZQWMi
         67JoGXvp0mYgIgoV+LUHbKcDK6BYnQMHOTE7xfrkQNV4ur3L5OTQQZax8V6DqG2jcdiE
         o6sw==
X-Forwarded-Encrypted: i=1; AKwUvBxt0JNmR8nn7oI34cnT/KmUUeHPf8Os6Me+pYqKYJmGBBeNagFwMrUVEqYVsf0C7aZNi58kIaceLETbveE=@vger.kernel.org
X-Gm-Message-State: AFuF++nOBjvN84xGYbPqdru+So1D/BAZZ4HoaDD70nc3dPaNgi1HOmh4
	oPrLG2wOIKDAGYJ65i2CSWtYjoOnm7ZYPD0l388T3Mc6aWFE/+NbRMJ5
X-Gm-Gg: AYBFou0xW2Ky680HnkRggOpe/F8qoXRVqRlHeDJ6uL16n+EtqU7rYJr/8MnH95I16wh
	N5aH+GGqUVgsST61i7or1hBjapL62dmMfIzcpJprTXlroErQMW9UbPEFpr/dlrsUclHt36odfJi
	1WBgQcpgkhbmjGNPc3xixBj22nlHBCXuFpTCrvK7o49kOD32kUxGTPUwMeHMlrhr4sn3xYItSg5
	ceBJ1c8kNbdPANqEXRET2Nd+9UYF/ZuB74xvV0yPagsUJzcsZSypiacpVih1G4yeSwY6UEYD24w
	y3H7CX7y21LqfkF/gZ142rR6W9cY+MK10ssghiUF0owgcyjg1Krut+kv+cjE/I1xkGGx10WSZLq
	K/J/7zL5sjlN6zF5hu/IM3E6Uz5GdbWG2lQOG9u62MDe19cEtGK+GuNhFiLjG0u8sLyiF+M0nK/
	DBOIgd/jH3zCmvnnKhRNmzZefd+rtNye++0dhgZYCU25dW9m0ljNjIO+m+edBuN7zlfs5N2fD6U
	JlDTNwBVkJiUTy79jWoev/BuWGyAddCquD0AFzY6dj1K87i/TckGDSvBnopwRDzXtk=
X-Received: by 2002:adf:e00e:0:20b0:487:2329:9d0a with SMTP id ffacd0b85a97d-4872329a02bmr2732830f8f.33.1789818420344;
        Sat, 19 Sep 2026 04:47:00 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724460898sm6168114f8f.9.2026.09.19.04.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 04:46:59 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <4d1eee3a-a5f9-467e-880e-4f2815851b09@gmail.com>
Date: Sat, 19 Sep 2026 12:46:58 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] kconfig: warn about malformed KCONFIG_PROBABILITY
 values
To: Dmitrii Tulnov <tulnov.dl@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Peter Korsgaard <jacmet@uclibc.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <9ceb2ab6-f532-49a2-b30b-ecdb4eb4b7b0@gmail.com>
 <20260918213430.3-1-tulnov.dl@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260918213430.3-1-tulnov.dl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/26 22:34, Dmitrii Tulnov wrote:
> randconfig checks the numeric range of each probability but does not
> validate where strtol() stops. For example, KCONFIG_PROBABILITY=50% is
> accepted as 50:0:0: the '%' is parsed repeatedly as zero. For the
> documented value 50, tristate y/m/n probabilities are 25%/25%/50%.
> With 50%, both y/m probabilities silently become zero, reducing the
> coverage of random configuration builds. Empty fields and extra fields
> are also accepted.
> 
> Warn when the value does not follow the documented decimal format. For
> malformed inputs whose parsed probabilities are in range, preserve the
> existing interpretation unless KCONFIG_WERROR is set. In that case, exit
> with an error before writing the configuration. Leading whitespace and
> signs are accepted by strtol(), but also trigger the warning because they
> are outside the documented format.
> 
> Keep the strtol() result as long until the range check. This rejects
> out-of-range values that narrowing to int previously made valid, such as
> 4294967296 becoming zero on a 64-bit host, regardless of KCONFIG_WERROR.
> 
> Add regression tests for one warning per malformed input, preserved
> configurations, KCONFIG_WERROR, out-of-range values, the supported
> probability formats, and the documented empty-value default.
> 
> Fixes: e43956e60769 ("kconfig: implement KCONFIG_PROBABILITY for randconfig")
> Assisted-by: LLM
> Signed-off-by: Dmitrii Tulnov <tulnov.dl@gmail.com>
Tested-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Julian Braha <julianbraha@gmail.com>
