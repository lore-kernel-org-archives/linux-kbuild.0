Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA8E3BF692
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2026 21:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790716472; cv=none; b=M+qArfKxCRDRU0JuwY9Xs1vthyxX0n3D67PxmJ8J3HNKC9Oc+gG7vLXe7PrMjH6LG+cv0JjJLgWfma3ISaeG3GkAdRYKL5fTDud42/MRf/CNRBxyZakcSmDp08zFRPA3ecnM6BUnIxaxwAOrDAj2+w5XfM13sh9MFB71Nya2KDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790716472; c=relaxed/simple;
	bh=5/togg/DPk0r7Ug8UPLdLx052cH0w1RAr3Q+/KhfwSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gIqGSauZYkpIUEb2R4DQoWRG+Dt4BLKwhOcvl47ThCGMeZGjTtj3K3HvA8+g5UPpqwAlSoY01TkgD59U+LQDxrz/IboSeb6i2ur+ajXixmsQCZFzosPhk70ruIBMdhzFt7CGlDY+KFIAjYgWrXD01RSU27EsEvti7wpHY8ZszRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhkW4pZg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhkW4pZg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so26328345e9.2
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2026 14:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790716468; x=1791321268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHIA1C0brtLm631UlMCeHLnUCZCnWiJvHiU+FJfuc6o=;
        b=KhkW4pZgUg6TiFYMOVKH+LthuvHRINrTWEQwsyA37RNaAvEVTjs6YgRMTQ5xDmuUPp
         G4MaJ7+43FSbqeYQ/hkNFJGTlHNv4Y8KYpK3cUYPgHQuu5S7tDptdVQHCCwPPYV2CjdE
         zPkVFJIe3B41jUSKab7YWnNldj3VS/a2ELXPY365Uvm/Ur9AOSZyxE2/fDNv9ChpFiK1
         jPSMJourB6EJWIKVsdqj6E/mFwCCm/0Cj9zKDC4oXY1HUKo9bE5TyxfKwRyNbZrjoKxy
         o7VJYkHTCbZr7IWS11MMHLGbhGvwqs0MFJObrzarJ8Nh9ct6hIaNUsWx5K1OTv8oDF+a
         GwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790716468; x=1791321268;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sHIA1C0brtLm631UlMCeHLnUCZCnWiJvHiU+FJfuc6o=;
        b=LCDCcexQv1QGqbdHUSp7pm5zAEnFIatREAaR2wcgX0sGXJyDM8laG/ZViwYAFScDBt
         qDtxep+I75Q77t4uTZrcDnXuBPmQCn14Y4GDv+DiJB9ajYmLYP6v1bUdW1WhD1gs66Mo
         2i80Xg+X6MA+4WxH/hzaLZKNLDfsFbfx1UQdp9JXTEVTBLUSzsIbACuud30wgv+IiWsx
         KaAWekOeuU1A2eypGw2zHf58YW6r2QMU3uCfHBcDlHOJ3sAyzTknQc9M2KRdC4JgM/T2
         k7rnrkns40uwp3u0NGR/FE4imCrxBCtY4h3LVbfOC5oG+LkASLlFOzznA0GeFBpitUCJ
         UlHw==
X-Gm-Message-State: AFuF++mrTlhPUVr2yFZ8otZSinDQ+39YwdKM2vwqG0lY0reAuAv2ZXkj
	6i+p6r4CcUrf2Cfk0FjBlAeXgqi5ZV+DA9WGqxZLyDDFy+NSWpPY9e92
X-Gm-Gg: AYBFou1SSnRf9UnmDGTWn7ZZuEJyyHOxj9hQLJsOYMmcPVf7xPdlHzUak5s0G4xCoys
	aWQQxCuFRT30KWCmrWAbn0SvE9WRnYHK4+iAgRqN93R/NSsieeUizc16nJkUl5L8rxsptzNaC2l
	kHcBhNsNyw2CWwVcYnsMU9zWHC/Hp1GLroHoeX6wCTiij+ajKvEEtMOD6nVK+F1DtWC8oczP4IQ
	rqcp+5yHOsCd4CoDVJArrBpTPo2LjQSotZjw9Kbd6HcLmBfx2gGF3LUea+ytleBM6Sttq2T8IDZ
	O7J6v/gxeWjybUjE4GjYx8roWHx2pSEUxoXUTRuJ3OdYuWeQzQmmW0/T00OxtkphD7qPpJ/4mT4
	G6wTGraVyKxcB4wimEon4RESQwZn8Li96LKZaYnavd3dNUWl2cRGYgIIxTKadVvnNvN1Dz6dFn8
	sDxuQE5WYZkekVqXxzEvy217HK78KenY5pOjry22oAhtZWOdAnf2rnEHpF8nJ3dS/kClmC4C3J5
	uySrNAWV7gZE1INhHi410B34+o9XdUPrCs71I7r2i1DDRGJLrkfvSyQ0M009aSgdCqULAJ6ezDp
	Dpjx42qTnaDT+5h3
X-Received: by 2002:a05:600d:444c:20b0:4a0:151e:f72b with SMTP id 5b1f17b1804b1-4a0151efbb4mr3025585e9.12.1790716468039;
        Tue, 29 Sep 2026 14:14:28 -0700 (PDT)
Received: from ?IPV6:2a00:1358:e0fb:c500:351f:e304:7fce:781b? ([2a00:1358:e0fb:c500:351f:e304:7fce:781b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a015cbc3basm366305e9.2.2026.09.29.14.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 14:14:27 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <f3a26a6d-e2ea-4d84-9e3f-fa8e0d891728@gmail.com>
Date: Tue, 29 Sep 2026 22:14:25 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] kconfig: tests: Reset all KCONFIG_* env variables
 by default
To: Nicolas Schier <n.schier@fritz.com>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Ulf Magnusson <ulfalizer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929-kconfig-tests-minor-updates-v2-0-c5902bee1d0c@fritz.com>
 <20260929-kconfig-tests-minor-updates-v2-1-c5902bee1d0c@fritz.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260929-kconfig-tests-minor-updates-v2-1-c5902bee1d0c@fritz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/29/26 08:59, Nicolas Schier wrote:
> Reset all environment variables with names starting with 'KCONFIG_' from
> the user-provided environment.
> 
> This fixes the 'warn_changed_input' test on systems with
> KCONFIG_WARN_CHANGED_INPUT=1 and ensures a cleaner test environment.
> 
> Fixes: 645323a7f4e5 ("kconfig: add optional warnings for changed input values")
> Signed-off-by: Nicolas Schier <n.schier@fritz.com>
Reviewed-by: Julian Braha <julianbraha@gmail.com>
