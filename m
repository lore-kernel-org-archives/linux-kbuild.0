Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B27A2FD1AA
	for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 11:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149567; cv=none; b=GST057thnDITBhUUTgrGnItpuP0aJU1OkvGY98Zoy48J1j0FZgBC1Ih011Zy6eG9Ur0upjW916AEtDjUZlsOIyjpD425kgNO3XW7dQH/nP2wKdb2r2OKvStdV1KD3Xf3D0+aZEmp3gZ/7uRC5uFqCHeZ+zeZDFoM6UwfgVNb1ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149567; c=relaxed/simple;
	bh=7kcP9cLCcy4OUEUkmZAtefVAsO/bxsy2QWquHTa4u/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KzEAoj1aowSMy/4VhtYKlTATiO5l8ptDevsaedO6BTL55GK3u7Y40b6wLRxOshm4/DEFMLVehzydnFW2/Te3EeYq2gjxf/pAThR+o3aJw/ngXr2fjh9z2KDoqHIETLmVvONCRj8IZHzvnFO+vILMaoD6YfyHdqBG914uE1rcJMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbDsjxjE; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbDsjxjE"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a16c399641so60760865e9.2
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Oct 2026 04:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792149561; x=1792754361; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7OLFMGhXtb0ShwzI3FF1wI02MWCwrPh2eC1gyrGUFtw=;
        b=SbDsjxjEcn5GIGtCXf7UlinPIncRzcVv5O0dzZxyZVoZ+KYVypt6UJAO2UWvAN9bc8
         WGhErLNHxFsGH3+zLSt6kbxxAIBrMYshv4taKOzPjXm6E7KPRmrg2Gd5h0ZPk6yGmm7u
         UCymjj2LjZal4ePWQVDw9islXVFNJYy1tCE8Hdu87D+KxV+rWb+d6/2RvpZwN/MyMC8Z
         MOcH61w1QE15yo6gLG0dg4OA64tBXysJUi/wVuYGO4v9vx92RXiqypZK6QfX7/4SF2A3
         67C0zIXxYebK8AKGRgRiC/tnFHIsYKo6Z/K0yPTP8fK1mSnXrI33M9gIzFp+tw8PMh6K
         DfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149561; x=1792754361;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7OLFMGhXtb0ShwzI3FF1wI02MWCwrPh2eC1gyrGUFtw=;
        b=IDozlQTdqE9n75DB3vxMsvCmvajleqrJfasDHt+1sDhYbHtJ7/LLz+0+P1B2j1GsNi
         UBwB7e+UKNsaO00kL9EXAX8vZq2Ajz1vrUpCtJxu1l9uQkJNXGz2qzeuTDhIoGK3huNQ
         DrnGrNovwVTR56sroxkhhU9lx4fG5yv0gTAaOP/WkzNd/077rpv32HneSRDlnyEkRghP
         v1G/+fkMGpHUhs1ww40AQ85fC/pAmHw1iDNli/5sdPKcfhpHRnWnY7TFHUQA0DNU5bTa
         d4rZ37xFvcbtJSJfOqwPxlS99GVKmxhRXbskTxkPU9J+MG7BC9Y4ZusflQnTnQb5QGlz
         SLYA==
X-Gm-Message-State: AFq9FYJuL2lUxzFlW3P7qogQ1I4+/npEtm/V7XEmABJIZU7V6heDIF4z
	9MTdNJ+gaTRnt+kYrTy65gDHX/9h7c8EwXOoiqeOhQgjEAzQcMHye5+yL8WnDDhyEx0=
X-Gm-Gg: AYBFou3RPKkrsCS1HnNtCCXpHLSpKr4O12JiNKxCHCkbsfRJUH321MF0eZTIUZSpC91
	VaejqGRAOW1KBBA0u1EQORqJYg40quqWCjDRoBUm6iVQzjE+HeJMSaEzdsqNmqKpGQK5/al4yL2
	5jzusxJ31J723bVfihJFsL6w5zA3Xi4x8J+PgYYyPC5k2qilbI2c/+t3YeYhJ2zAVjIa+d6bEq7
	Kjlh4jbjOGU7brXTHQ5iVv9vC2lGKCyGhzllPMteUnpFV1615evzDw2v+tv7hJt/SOx/9n+i+z2
	tJy7ct+wFZLvLyofOfcYC1kBeO7BAdKBrWmEaRAyjFOfD8ZDd0VUhxH70PRHBGZKrRclJwWk4FV
	1KOPU10UIZhVk8nBb7jBz4FMJO5ONdCLMYf55sKumIEpeDizWMAcrevWpOwHAkyA+fNNNza/7fJ
	/+Bk+a7b3ScWw8uwziAN0P5FqMa44nreEjTNWAoZtZ1JKZttAuPElJfExg+tFpgSVJg7GExEcF2
	7QemGOQdMk=
X-Received: by 2002:a05:600c:1553:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a18e443ea6mr425675325e9.4.1792149560981;
        Fri, 16 Oct 2026 04:19:20 -0700 (PDT)
Received: from ADRIAN-PC.lan ([171.22.87.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm4398611f8f.2.2026.10.16.04.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:19:20 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Adri=C3=A1n=20Garc=C3=ADa=20Casado?= <adriangarciacasado42@gmail.com>
Subject: Re: [PATCH] kbuild: depmod: fallback to /boot/System.map-KERNELRELEASE
Date: Fri, 16 Oct 2026 13:19:15 +0200
Message-Id: <20261016111915.227860-1-adriangarciacasado42@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261016111106.221542-1-adriangarciacasado42@gmail.com>
References: <20261016111106.221542-1-adriangarciacasado42@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Verified on Debian 12 (x86_64) with Linux 7.3.0-rc7 packaged via
'make bindeb-pkg' while installing out-of-tree VirtualBox modules
(vboxdrv, vboxnetflt, vboxnetadp).

Before this patch:
  INSTALL /lib/modules/7.3.0-rc7/misc/vboxdrv.ko
  DEPMOD  /lib/modules/7.3.0-rc7
  Warning: modules_install: missing 'System.map' file. Skipping depmod.

With this patch applied to scripts/depmod.sh:
  INSTALL /lib/modules/7.3.0-rc7/misc/vboxdrv.ko
  DEPMOD  /lib/modules/7.3.0-rc7
  (completes with 0 warnings)

And modules.dep is properly populated:
  $ grep vbox /lib/modules/7.3.0-rc7/modules.dep
  misc/vboxnetflt.ko: misc/vboxdrv.ko
  misc/vboxnetadp.ko: misc/vboxdrv.ko
  misc/vboxdrv.ko:

Tested-by: Adrián García Casado <adriangarciacasado42@gmail.com>
