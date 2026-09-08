Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0D23B9942
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Sep 2026 20:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788899743; cv=none; b=J9EiWV2LIskjhJte5uMlFM+gSy56Bs7F6JmoQmvv6W4wlcO1ODHF2fkMsrMTXbpWwIlwqEwuWK4fS9k7NMI7aPLZbgImlWcpgHSM8F0HTrV8tOFWazEcvvNgVvxCz9rHEHK9r85OfW3E0sW8ybyrOBGvqFEOqSQrXE12VWt/ND4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788899743; c=relaxed/simple;
	bh=/0AQ7DYEym0GpAXvWQSi2Y+HfDJ4FzU52T5IBs7jeQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e9VmNuux/NNx1aHe/nbbZ64G785wkXY8XHJK5KcaCAYWAgSysfPSt60I6d4XYkAxLjL86BVpTFK8eADhtV/7yUpwZyPMdUR4wLk1W4NqG+BAE0Bfiqybh83wsoGrogjb43Ob2pcnEe7GZL9HrjmByNQagVvjlD/W+HIqYJHJbGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7mPDVRd; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7mPDVRd"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e022so580936e87.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Sep 2026 13:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788899740; x=1789504540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0AQ7DYEym0GpAXvWQSi2Y+HfDJ4FzU52T5IBs7jeQ4=;
        b=Z7mPDVRdu0ZE79UsRd7v/EatZbXs4QijpE5QOK8F3hKCtb+HBP/+U0Gp/o5tfCcBjW
         jDAytLkCATiEGmwoO03QReingM5CmuZEfQlUcXpvziNJUP6WwtDik3qTfNwhWJh2KoPS
         MN91qi1+BgoqQGXLV/9/QFaCnu04zgYc+hK217ngtBBh5+NWVuSYvPbj5j2RUw/BFH8t
         8+Ejx5QIM69nilRlrnfuB9EB8slBkIIZiuOAnLNOjekfPFFdUChhQdwJyFxw2RwZnsfa
         yTLluUaD341+WlveFD0+g7mgOTPFcR47l/sz9cBSbcjZqPFFaa/6Ktr3yb1Gl21tJmtO
         FBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788899740; x=1789504540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0AQ7DYEym0GpAXvWQSi2Y+HfDJ4FzU52T5IBs7jeQ4=;
        b=qYLKGAGbRwvsuUNoNBKpGyoW+EeKjz1/MOHO0BDf+TmbsfAWy3EDaBXoFVahmI5Dzj
         KwZzo1wWIv+sYqqIP9/t6SS1SKkl49ixiCDURl0kIOUlSWcuZl+pg6U72cq5IhTZX+M8
         iN/G2DEgPOvkgGJnC5VCM9fsu6InV9JNBZH6HFUVwYZtt8bi3oSYZJsKMN1u4avd+JT1
         EhhgrULCf9hCRBjrrh5cESH0Zbyw9Hh0ANcTYJksAAO9kUxYagHxrYJWoooeUUoCEP/d
         656JL+uwvEE2YT6ROUE9vJCbT2RKNyHtpLukFKQLynUgCeJzbMxwcDgCCpqCq+3DcaoR
         3m5A==
X-Forwarded-Encrypted: i=1; AKwUvBx/136S5nJznOF7UtYeks580T5OslzJs494ywa/8tPOb9/pXDCU9cT/2Eg7bRbB5tNNVZnXSuY178qTKco=@vger.kernel.org
X-Gm-Message-State: AFuF++l1LSc52y6nGQYJdMZDsE61e9x+j15hXYH+6jQMt1qjZSGDBEOw
	PcU59+uVuI5H6G74E5SxL+Ym4qSBXWb2LHYgTRo6nNCZKW1lq7FWm58=
X-Gm-Gg: AYBFou17HDQDrP9/EMVYaPhzxsBD4ML4dQFzuTG/qh40S6mKWM6xl2CglH0qzwODYff
	rMw5nzhNIBdw0emfGXJWuc4nbQ1LVMC9osUohYcj3GsgWgmB0pxpwt2sXkIZBCMT0buaIks97V6
	Lry03Tf4B4KLIkFYogxH6m/SPlwHT09tPukLwJUCHTn2rhL92l/9KE9UEB/2gQ7UBA6KZHM1lv1
	YGFADBB3gZSs0/Z9ohevtE2OBeP7+YHSFmzwrOwcqeeeYfFpsCDSxela3Hq4xqMSt85gJOmFdkQ
	2uSu3nI17nAeIf62lKnM5xW6QHkoGv1nAMjyjM6cAqcKtUcLkiFmyrqgHLwO8lbeFpKp7JNXiJf
	nKq4BhjaX00cehSae7On5Q3KITNwBGYNx9jHD8Q48dlZFH6Yq62Cn7oUXLeuhb6DgCFWbwdvwWq
	J6jt5Mxwc7CjDolH+nrwqtmMrGuZuBjHVPvFzleKDVBUvweZr6W4vlfoZRY3PAVsHM5SMr5XcYH
	DRUPvs2Aqy/afBaGoXeQK7/X1M5N+GKd43ebSX1Vly0pCWmH+hceJJ630T/JjxjG9p9ig==
X-Received: by 2002:a05:6512:3d02:b0:5b6:10bc:b865 with SMTP id 2adb3069b0e04-5b75c925643mr1603725e87.19.1788899740122;
        Tue, 08 Sep 2026 13:35:40 -0700 (PDT)
Received: from insciwin.localdomain (224.105.88.34.bc.googleusercontent.com. [34.88.105.224])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166384aasm3352409e87.0.2026.09.08.13.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 13:35:39 -0700 (PDT)
From: Dmitrii Tulnov <tulnov.dl@gmail.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Peter Korsgaard <jacmet@uclibc.org>,
	"Yann E. MORIN" <yann.morin.1998@free.fr>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: reject malformed KCONFIG_PROBABILITY values
Date: Tue,  8 Sep 2026 23:35:36 +0300
Message-ID: <20260908203536.4-1-tulnov.dl@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ce0786a7-e48d-4d7b-b601-86a598bb03d1@gmail.com>
References: <20260907194536.37-1-tulnov.dl@gmail.com> <ce0786a7-e48d-4d7b-b601-86a598bb03d1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Julian,

Thank you for the review and for the welcome.

> It would be good to note here that 'KCONFIG_PROBABILITY=50' (without
> the '%') should be 25:25:50 instead.

You're right. The v2 commit message now states explicitly that
KCONFIG_PROBABILITY=50 gives tristate y/m/n probabilities of 25%/25%/50%.
The regression test compares the equivalent inputs 50 and 50:25:25 across
20 fixed seeds.

> I disagree with allowing the leading whitespace and sign.

Agreed. Leading whitespace and signs are now warning-only because they are
accepted by strtol() but outside Kconfig's documented XX:XX:XX format.

> I would prefer to make this a warning for now, and then promote this to an
> error later assuming nobody complains.

The v2 implementation warns about malformed syntax while retaining the
existing parsing behavior for compatibility. Numeric range violations remain
errors.

Thank you again for taking the time to review this.

Best regards,
Dmitrii
